#pragma once

#ifndef LEVELMANAGER_H
#define LEVELMANAGER_H

#include "AchievmentManager.h"
#include <vector>

struct Level
{
    uint32_t							ExpectedLevel;
    const char*							LevelTitle;
	uint32_t							MoneyReward;
	AchievementManager::Achievement*	Achievement;
};

class LevelManager
{
public:
    LevelManager(AchievementManager& achiv)
		: m_lockFlags(1)
		, m_achivManager(achiv)
    {
		
    }

    ~LevelManager()
    {

    }

    const Level GetLevel(uint32_t i)
    {
		Level level;

        switch (i)
        {
        case 0:
			level = Level{ 5, "Primeros pasos",30 };
			break;
        case 1:
			level = Level{ 10, "Busca lineas", 60};
			break;
        case 2:
			level = Level{ 15, "Dedos agiles", 200};
			break;
        case 3:
			level = Level{ 20, "Explota lineas", 400};
			break;
        case 4:
			level = Level{ 25, "Guerrero", 800};
			break;
        case 5:
			level = Level{ 30, "Maestro", 2000};
			break;
        case 6:
			level = Level{ 40, "Ultra Quadrish", 4000};
			break;
        case 7:
			level = Level{ 50, "Campeon Quadrish", 10000};
			break;
        case 8:
			level = Level{ 0, "Infinito", 0};
			break;
        default:
            assert(false);
        }

		level.Achievement = m_achivManager.GetAchievement("level", i);
        return level;
    }

	void SetUnlockFlags(uint32_t flags)
	{
		m_lockFlags = flags;
	}

	uint32_t GetLockFlags()
	{
		return m_lockFlags;
	}

private:
	uint32_t				m_lockFlags;
	AchievementManager&		m_achivManager;
	//std::vector<Level>		m_level;
};

#endif