#pragma once

#ifndef POWERMANAGER_H
#define POWERMANAGER_H

#include "Image.h"
#include "StoreItemManager.h"
#include "Model2D.h"
#include "GeometryPointer.hpp"
#include "Atlas.h"
#include <vector>
#include <cstdint>
#include <functional>

class PowerManager
{
public:

	enum Flags
	{
		
	};

	enum Power
	{
		LINESTREAK = 0
		,LEVELUP
		, POWER3
		, POWER4
		, POWER5
		, POWER6
		, POWER7
		, POWER8
		, POWER9
		,POWER_COUNT
	};

	typedef std::vector<Image*> ImageList;
	typedef std::function<void(Power)> PowerHandler;

	PowerManager();
	~PowerManager();

	void Load();
	void LoadVideoMemory();
	void Clean();
	void Draw(GemeotryPointer* m_texrect);
	void UpdateStoreItems(StoreItemManager& manager);
	void RegisterTouch()
	{
		Engine::Instance().AddOnTouchHandle(
			std::bind(&PowerManager::OnTouch, this));
	}

	void PowerSentHandler(PowerHandler handler)
	{
		m_handler = handler;
	}

	uint32_t GetPowerCost(Power p)
	{
		switch (p)
		{
		case PowerManager::LINESTREAK:
			return 80;
			break;
		case PowerManager::LEVELUP:
			return 10;
			break;
		case PowerManager::POWER3:
			break;
		case PowerManager::POWER4:
			break;
		case PowerManager::POWER5:
			break;
		case PowerManager::POWER6:
			break;
		case PowerManager::POWER7:
			break;
		case PowerManager::POWER8:
			break;
		case PowerManager::POWER9:
			break;
		case PowerManager::POWER_COUNT:
			break;
		default:
			break;
		}
		return 0;
	}

	void CreateLayout(float x, float y, float w, float h);
	void SetAtlas(Atlas* atl)
	{
		m_atlas = atl;
	}

private:

	class PowerButton
	{
	public:
		float X;
		float Y;
		float W;
		float H;
		bool  Unlocked;
	};

	typedef std::vector<PowerButton> BList;

	void OnTouch();

	Atlas*				m_atlas;
	PowerHandler		m_handler;
	BList				m_buttons;
};

#endif