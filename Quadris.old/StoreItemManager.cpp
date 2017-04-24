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



StoreItemManager::StoreItemManager()
    : m_lockFlags(0)
{
	
}


StoreItemManager::~StoreItemManager()
{

}

void StoreItemManager::Generate(AchievementManager& manager)
{
	m_list.push_back(Item( 500, manager.GetAchievement("level", 0), std::string("pwr2"),
		GET_STRING("Power1Name"), GET_STRING("Power1Desc") ));

	m_list.push_back(Item( 2000, manager.GetAchievement("level", 1), std::string("pwr1"),
		GET_STRING("Power2Name"), GET_STRING("Power2Desc") ));
}