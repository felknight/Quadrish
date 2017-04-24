#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <cassert>
#include <sstream>
#include <locale>
#include <vector>
#include <iterator>
#include <cstdlib>
#include "AchievmentManager.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

struct csv_reader : std::ctype<char> {
	csv_reader() : std::ctype<char>(get_table()) {}
	static std::ctype_base::mask const* get_table() {
		static std::vector<std::ctype_base::mask> rc(table_size, std::ctype_base::mask());

		rc[','] = std::ctype_base::space;
		rc['\n'] = std::ctype_base::space;
		rc['\r'] = std::ctype_base::space;
		return &rc[0];
	}
};

AchievementManager::AchievementManager()
{

}


AchievementManager::~AchievementManager()
{

}

void AchievementManager::Load()
{
	Engine::FileDescriptor* file 
		= Engine::OpenFileBinary(GET_CSTRING("achievFile"));

	if (file)
	{
		size_t size = Engine::FileSize(file);
		char* buffer = new char[size+1];

		Engine::ReadFile(file, size, 1, buffer);
		buffer[size] = 0;

		using namespace std;

		stringstream stream(buffer);
		csv_reader* facet = ::new csv_reader();
		stream.imbue(locale(locale(), facet));
		istream_iterator<string> it(stream);
		AchivMap* currentGroup = nullptr;
		std::string cgname = "";

		for (; it != istream_iterator<string>();it++)
		{
			if ((*it) == std::string("group"))
			{
				it++;
				const auto& res = m_groups.insert(GroupPair(*it, AchivMap()));
				m_saveMap.insert(GroupSavePair(*it, 0));
				cgname = std::move(*it);
				if (res.second)
				{
					currentGroup = &res.first->second;
				}
				it++;
			}
			else if (currentGroup)
			{
				uint32_t id = ::atoi(it->c_str());
				it++;
				Achievement achiv;
				achiv.Name = std::move(*it);
				it++;
				achiv.Desc = std::move(*it);
				achiv.Group = cgname;
				achiv.Id = id;

				currentGroup->insert(AchivPair(id, std::move(achiv)));
			}
		}

		delete[] buffer;
		Engine::CloseFile(file);
	}
}

AchievementManager::Achievement* 
	AchievementManager::GetAchievement(const std::string& group, uint32_t id)
{
	auto itt = m_groups.find(group);
	if (itt != m_groups.end())
	{
		auto it = itt->second.find(id);
		if (it != itt->second.end())
		{
			return &it->second;
		}
	}
	return nullptr;
}

bool AchievementManager::IsWon(Achievement* achiv)
{
	int idb = 1 << achiv->Id;
	auto itt = m_saveMap.find(achiv->Group);
	if (itt != m_saveMap.end())
		return (bool)((itt->second & idb) == idb);

	return false;
}

void AchievementManager::SetWon(Achievement* achiv)
{
	int idb = 1 << achiv->Id;
	auto itt = m_saveMap.find(achiv->Group);
	if (itt != m_saveMap.end())
	{
		itt->second = itt->second | idb;
	}
		
}