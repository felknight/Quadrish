#pragma once

#ifndef STOREITEMMANAGER_H
#define STOREITEMMANAGER_H

#include "AchievmentManager.h"
#include "SecureMemory.h"
#include <vector>
#include <cstdint>

class StoreItemManager
{
public:
	class Item
	{
	public:
		typedef AchievementManager::Achievement Achiv;

		SecureMemory<uint32_t>			Price;
		Achiv*							Requierment;		
		std::string						Icon;
		std::string						Name;
		std::string						Desc;

		Item()
			: Price(0)
		{

		}
		Item(uint32_t price, Achiv* req, const std::string& icon
			, const std::string& name, const std::string& desc)
			:Price(price)
			, Requierment(req)
			, Icon(icon)
			, Name(name)
			, Desc(desc)
		{

		}

        Item(uint32_t price, Achiv* req, const std::string& icon
            , const std::string& name, const std::string& desc,int value)
            :Price(price)
            , Requierment(req)
            , Icon(icon)
            , Name(name)
        {
            char* buffer = (char*)malloc(desc.size() + 10);
#ifdef _WIN32
            sprintf_s(buffer, desc.size() + 10, desc.c_str(), value);
#else
            sprintf(buffer, desc.c_str(), value);
#endif
            Desc = std::string(buffer);
            free(buffer);
        }
	};

	typedef std::vector<Item> ItemList;

	StoreItemManager();
	~StoreItemManager();

	void Generate(AchievementManager& manager);
	const ItemList& GetItemList() const
	{
		return m_list;
	}
    bool IsLocked(uint32_t idx)
    {
        return (m_lockFlags & (1 << idx)) == 0;
        
    }

    void Unlock(uint32_t idx)
    {
        m_lockFlags |= 1 << idx;
    }

    uint32_t GetLockFlags()
    {
        return m_lockFlags;
    }

    void SetLockFlags(uint32_t lockflags)
    {
        m_lockFlags = lockflags;
    }

    float GetSlowerRatio();
    float GetAccelRatio();

private:
	ItemList m_list;
    uint32_t m_lockFlags;
};

#endif

