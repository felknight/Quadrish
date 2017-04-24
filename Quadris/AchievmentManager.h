#pragma once
#ifndef ACHIEVEMENTMANAGER_H
#define ACHIEVEMENTMANAGER_H

#include <string>
#include <cstdint>
#include <unordered_map>

class AchievementManager
{
public:
	class Achievement
	{
		friend class AchievementManager;
	public:
		std::string Name;
		std::string Desc;
	private:
		std::string Group;
		uint32_t	Id;
	};

	typedef std::unordered_map<uint32_t, Achievement> AchivMap;
	typedef std::pair<uint32_t, Achievement> AchivPair;
	typedef std::unordered_map<std::string, AchivMap> GroupMap;
	typedef std::pair<std::string, AchivMap> GroupPair;
	typedef std::unordered_map<std::string, uint32_t> GroupSaveMap;
	typedef std::pair<std::string, uint32_t> GroupSavePair;

	AchievementManager();
	~AchievementManager();

	void Load();

	Achievement* GetAchievement(const std::string& group,uint32_t id);
	bool IsWon(Achievement*);
	void SetWon(Achievement*);
	uint32_t LockFlags(const std::string& group)
	{
		if (m_saveMap.find(group) != m_saveMap.end())
			return m_saveMap[group];
		else
			return 0;
	}

	void LockFlags(const std::string& group,uint32_t flags)
	{
		if (m_saveMap.find(group) != m_saveMap.end())
			m_saveMap[group] = flags;
	}
private:
	GroupMap		m_groups;
	GroupSaveMap	m_saveMap;
};

#endif
