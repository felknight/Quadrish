#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif


#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#define __STDINT_LIMITS
#include <cassert>
#include <iostream>
#include <thread>

#include "Quadris.h"
#include "SaveManager.h"
#include "GameConstants.hpp"

#ifdef _WIN32
#include <crtdbg.h>
#endif

std::string	SaveManager::m_savePath;
std::string	SaveManager::m_bakSavePath;

//TODO: Handle a sigsev so at least the game is saved correctly before it crashes

enum Save
{
	SAVESIZE = 0
	+ 2 //RandKey 
	+ 4 //Version
	+ 4 //Money
	+ 4 //Store
	+ 4 //Level
	+ 4 //Level achivements
	, SAVEVERSION = 0xA4004401u
};

const char* SAVESTRING = "2751480833";
const char* SAVESTRING_BAK = "2751480833b";

SaveManager::SaveManager()
{
	m_savePath		= SAVESTRING;
	m_bakSavePath	= SAVESTRING_BAK;
}

SaveManager::~SaveManager()
{
	if (m_saveThread.joinable())
		m_saveThread.join();
}


void SaveManager::SaveThread(void* vars)
{
	FILE* fe = fopen(m_savePath.c_str(), "rb");
	if (fe)
	{
		fseek(fe, 0, SEEK_END);
		size_t size = ftell(fe);
		fseek(fe, 0, SEEK_SET);
		void* buffer = malloc(size);
		fread(buffer, size, 1, fe);

		FILE* file = fopen(m_bakSavePath.c_str(), "wb");
		fwrite(buffer, size, 1, file);
		fclose(file);
		fclose(fe);
		free(buffer);
	}

	FILE* file = fopen(m_savePath.c_str(), "wb");
	fwrite(vars, SAVESIZE, 1, file);
	fclose(file);
	free(vars);
}

void SaveManager::SaveGame(Quadris* m_game)
{
	if (m_saveThread.joinable())
		m_saveThread.join();
	

	//Generate a random key for the whole save
	char* cyph = static_cast<char*>(malloc(SAVESIZE));
	int16_t* randkey = reinterpret_cast<int16_t*>(cyph);
	*randkey = m_game->m_uniformDist(m_game->m_randEngine) % INT16_MAX;

	//1 == Encrypt VERSION
	uint32_t* vers = reinterpret_cast<uint32_t*>(cyph + 2);
	*vers = XorEnc(SAVEVERSION, *randkey);

	//2 == Encrypt money
	uint32_t* money = reinterpret_cast<uint32_t*>(cyph + 6);
	*money = XorEnc(m_game->m_money, *randkey);

	//3 == Encrypt store flags
	uint32_t* store = reinterpret_cast<uint32_t*>(cyph + 10);
    *store = XorEnc(m_game->m_storeManager.GetLockFlags(), *randkey);

	//4 == Encrypt level flags
	uint32_t* level = reinterpret_cast<uint32_t*>(cyph + 14);
	*level = XorEnc(m_game->m_levelManager.GetLockFlags(), *randkey);

	//5 == Encrypt level achievements flags
	uint32_t* levelachiv = reinterpret_cast<uint32_t*>(cyph + 18);
	*levelachiv = XorEnc(m_game->m_achievementManager.LockFlags("level"), *randkey);

	//Use default key to encrypt the random key
	*randkey = *randkey ^ GameConstants::SAVE_XOR_KEY;

	m_saveThread = std::move(std::thread(SaveThread, cyph));
}

void SaveManager::LoadGame(Quadris* m_game)
{
	LoadGame(m_game, m_savePath.c_str(), 0);
}

#define HACKRECURSE() if (!ntry)										\
					{													\
						fclose(file);									\
						LoadGame(m_game, m_bakSavePath.c_str(), 1);		\
					}													\
					else												\
					{													\
						fclose(file);									\
						return;											\
					}													\



void SaveManager::LoadGame(Quadris* m_game, const char* filestr, int ntry)
{
	FILE* file = fopen(filestr, "rb");

	if (!file)
		//No save
		return;

	//Get the random key from the save
	int16_t randkey;
	fread(&randkey, 2, 1, file);
	randkey = XorEnc(randkey, GameConstants::SAVE_XOR_KEY);

	//1 == Decrypt VERSION
	uint32_t vers;
	fread(&vers, 4, 1, file);
	vers = XorEnc(vers, randkey);
	if ((vers & 0xFFFFFF00) != 0xA4004400u)
	{
		//Not reconized version probably hack or error backing to save
		HACKRECURSE();
	}

	//2 == Decrypt money
	uint32_t money;
	fread(&money, 4, 1, file);
	money = XorEnc(money, randkey);
	if (money & 0x80000000)
	{
		//Too big, maybe negative? hack or error backing to save
		HACKRECURSE();
	}
	m_game->m_money = money;

	//3 == Get store flags
	uint32_t store;
	fread(&store, 4, 1, file);
	store = XorEnc(store, randkey);
    m_game->m_storeManager.SetLockFlags(store);

	//4 == Get level flags
	uint32_t level;
	fread(&level, 4, 1, file);
	level = XorEnc(level, randkey);

	if ((level & 0xFFFFFE00) != 0)
	{
		//Only 9 levels, prob hack
		HACKRECURSE();
	}
	m_game->m_levelManager.SetUnlockFlags(level);

	//5 == Get level achivements
	uint32_t levelachiv;
	fread(&levelachiv, 4, 1, file);
	levelachiv = XorEnc(levelachiv, randkey);

	m_game->m_achievementManager.LockFlags("level", levelachiv);
	
	fclose(file);
}


void SaveManager::SetSavePath(const char* path)
{
	m_savePath		= std::string(path) + "/" + SAVESTRING;
	m_bakSavePath	= std::string(path) + "/" + SAVESTRING_BAK;
}

