#pragma once

class Quadris;

class SaveManager
{
public:
	SaveManager();	
	~SaveManager();

	void SaveGame(Quadris* m_game);
	void LoadGame(Quadris* m_game);

	void SetSavePath(const char* path);
private:
	static void SaveThread(void*);
	void LoadGame(Quadris* m_game, const char* file,int ntry);

	static uint32_t XorEnc(uint32_t val, uint16_t key)
	{
		uint16_t hi = (uint16_t)(val & 0xFFFF) ^ key;
		uint16_t lo = (uint16_t)(val >> 16 & 0xFFFF) ^ key;
		return (uint32_t)hi | (uint32_t)(lo << 16);
	}

	std::thread					m_saveThread;
	static std::string			m_savePath;
	static std::string			m_bakSavePath;
};

