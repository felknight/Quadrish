#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include "PowerManager.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

#include <gtx/transform.hpp>


const char* m_power[] = 
{
	"pwr2"
	,"pwr1"
	,"pwr1"
	,"pwr1"
	,"pwr1"
	,"pwr1"
	,"pwr1"
	,"pwr1"
	,"pwr1"
};

PowerManager::PowerManager()
	:m_atlas(nullptr)
{

}

PowerManager::~PowerManager()
{
}


void PowerManager::Load()
{
	
	
}

void PowerManager::LoadVideoMemory()
{
	
}

void PowerManager::Clean()
{
	m_buttons.clear();
}

void PowerManager::Draw(GemeotryPointer* m_texrect)
{
	if (!m_atlas)
		return;

	for (unsigned i = 0; i < POWER_COUNT; i++)
	{

		if (!m_buttons[i].Unlocked)
			Engine::Instance().GetRenderer()->BlendColor(0.2f, 0.2f, 0.2f, 0.5f);

		m_atlas->SetCursor(m_buttons[i].X, m_buttons[i].Y);
		m_atlas->SetScale(m_buttons[i].W);
		m_atlas->DrawAtlasImage(m_texrect, m_power[i]);

		Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f, 1.0f);
	}
}

void PowerManager::UpdateStoreItems(StoreItemManager& manager)
{

}


void PowerManager::OnTouch()
{
	auto point = Engine::Instance().GetTouchPoint();
	for (unsigned i = 0; i < POWER_COUNT; i++)
	{
		if (!m_buttons[i].Unlocked)
			continue;

		if (point.X > m_buttons[i].X
			&&  point.X < m_buttons[i].X + m_buttons[i].W
			&&  point.Y > m_buttons[i].Y
			&&  point.Y < m_buttons[i].Y + m_buttons[i].H
			)
		{
			Engine::Instance().AddBeforeRenderTask([this,i]{
				m_handler((Power)i);
				return true;
			});
		}
	}
}

void PowerManager::CreateLayout(float x, float y, float w, float h)
{
	//There is two kinds of layouts.
	//The vertical one, that puts buttons on ascending order 
	//vertically
	//The horizontal one that divides the 9 buttons on a 3 x 3 grid

	if (w < h)
	{
		Engine::Instance().LogInformation("Using a vertical layout");
		//Vertical layout
		//The number of buttons divided by the height
		float r = h / (float)POWER_COUNT;
		float m = 0.0f;
		if (r > w)
			r = w;
		else
			m = (w - r) / 2.0f;

		for (unsigned i = 0; i < POWER_COUNT; i++)
		{
			PowerButton b;
			b.X = x + m;
			b.Y = (y + h) - r*(float)(i+1);
			b.W = r;
			b.H = r;
			b.Unlocked = false;
			m_buttons.push_back(b);
		}
	}
	else
	{
		Engine::Instance().LogInformation("Using an horizontal layout");
		//Horizontal layout
		//3 x 3 grid
		float r =	h / 3;
		float mx = 0.0f;
		float my = 0.0f;
		if (r * 3 > w)
		{
			r = w / 3;
			my = (h - r*3.0f) / 4.0f;
		}	
		else
			mx = (w - r*3.0f) / 4.0f;

		for (unsigned i = 0; i < POWER_COUNT; i++)
		{
			int ix = i % 3;
			int iy = i / 3;

			PowerButton b;
			b.X = x + mx + r*(float)ix;
			b.Y = y + my + r*(float)iy;
			b.W = r;
			b.H = r;
			b.Unlocked = false;
			m_buttons.push_back(b);
		}
	}
}