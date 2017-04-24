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
#include "StoreItemManager.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

uint32_t slowerbits[] =
{
    0
    , 3
};

uint32_t accelbits[] =
{
    2
};



StoreItemManager::StoreItemManager()
    : m_lockFlags(0)
{
	
}


StoreItemManager::~StoreItemManager()
{

}

void StoreItemManager::Generate(AchievementManager& manager)
{
    m_list.push_back(Item(250,nullptr, std::string("pwr_lev"),
        GET_STRING("PowerLvlName"), GET_STRING("PowerLvlDesc"),1));

	m_list.push_back(Item( 300, manager.GetAchievement("level", 0), std::string("pwr3"),
		GET_STRING("Power1Name"), GET_STRING("Power1Desc") ));

    m_list.push_back(Item(800, nullptr, std::string("pwr_lup"),
        GET_STRING("PowerLUpName"), GET_STRING("PowerLUpDesc"), 1));

    m_list.push_back(Item(3000, nullptr, std::string("pwr_lev"),
        GET_STRING("PowerLvlName"), GET_STRING("PowerLvlDesc"),2));

	m_list.push_back(Item( 1500, manager.GetAchievement("level", 1), std::string("pwr1"),
		GET_STRING("Power2Name"), GET_STRING("Power2Desc") ));
}

float StoreItemManager::GetSlowerRatio()
{
    float total = 0.0f;
    for (uint32_t i = 0; i < sizeof(slowerbits) / sizeof(uint32_t); i++)
    {
        if (!IsLocked(slowerbits[i]))
        {
            total += 0.18f;
        }
    }

    return 1.0f-total;
    
}

float StoreItemManager::GetAccelRatio()
{
    float total = 0.0f;
    for (uint32_t i = 0; i < sizeof(accelbits) / sizeof(uint32_t); i++)
    {
        if (!IsLocked(accelbits[i]))
        {
            total += 0.10f;
        }
    }

    return 1.0f + total;

}