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
#include <vector>
#include <iterator>
#include "ButtonUI.h"
#include "Model2D.h"
#include "Engine.h"
#include "FontManager.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

#include <gtx/transform.hpp>


uint32_t			ButtonUI::s_staticFlags = 0;
GemeotryPointer*	ButtonUI::s_roundRectGeom = nullptr;
Model2D				ButtonUI::s_roundRectModel;
Font				ButtonUI::s_font;
Font				ButtonUI::s_font_small;

ButtonUI::ButtonUI()
{
	m_layoutStart	= std::numeric_limits<float>::infinity();
	m_layoutIndex	= 0xFFFFFFFF;
	m_enabled		= true;
	m_color = Color32(255, 255, 255);
}


ButtonUI::~ButtonUI()
{

}

ButtonUI::ButtonUI(FPoint pos,FPoint scale)
{
	m_pos = pos;
	m_scale = scale;
	m_layoutStart = std::numeric_limits<float>::infinity();
	m_layoutIndex = 0xFFFFFFFF;
	m_enabled = true;
	m_color = Color32(255, 255, 255);
}

ButtonUI::ButtonUI(Layout p, float start)
{
	m_layoutIndex = 0;
	m_layoutStart = start;
	GenerateLayout(p,start);
	m_enabled = true;
	m_color = Color32(255, 255, 255);
}

ButtonUI::ButtonUI(Layout p, ButtonUI& back)
{
	assert(m_layoutStart != std::numeric_limits<float>::infinity());

	m_layoutIndex = back.m_layoutIndex+1;
	m_layoutStart = back.m_layoutStart;
	GenerateLayout(p, back.m_layoutStart);
	m_enabled = true;
	m_color = Color32(255, 255, 255);
}

void ButtonUI::Draw()
{
	if (!(s_staticFlags & (uint32_t)Flags::LOADED_VIDEO))
		return;

	auto tras = glm::translate(glm::vec3(m_pos.X, m_pos.Y, 0.0f));
	tras = glm::scale(tras, glm::vec3(m_scale.X, m_scale.Y, 1.0f));
	Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&tras[0][0]);

	Engine::Instance().GetRenderer()->RenderGeometry(s_roundRectGeom);

	float width = s_font.StringWidth(m_text);
	float smallwidth = s_font_small.StringWidth(m_text);


	if (m_enabled)
		Engine::Instance().GetRenderer()->BlendColor(m_color);
	else
	{
		Color32 rcolor = m_color;
		rcolor.A = 56;
		Engine::Instance().GetRenderer()->BlendColor(rcolor);
	}
	
		

	if (width < m_scale.X && (s_staticFlags & (uint32_t)Flags::FONT_VIDEO))
	{
		float cent = m_pos.Y + s_font.Height() / 2.0f;
		float pox = m_pos.X - width / 2.0f;
		s_font.SetCursor(pox, cent);
		s_font.DrawString(m_text);
	}
	else if (smallwidth < m_scale.X && (s_staticFlags & (uint32_t)Flags::SMALL_FONT_VIDEO))
	{
		float cent = m_pos.Y + s_font_small.Height() / 2.0f;
		float pox = m_pos.X - smallwidth / 2.0f;
		s_font_small.SetCursor(pox, cent);
		s_font_small.DrawString(m_text);
	}
	else
	{
		using namespace std;
		istringstream iss(m_text);
		vector<string> tokens;
		copy(istream_iterator<string>(iss),
			istream_iterator<string>(),
			back_inserter(tokens));

		float totalh = (float)tokens.size()*s_font_small.Height();
		float cent = m_pos.Y - totalh / 2.0f + s_font_small.Height()/2.0f;

		for (auto ti : tokens)
		{
			float smallwidth = s_font_small.StringWidth(ti);
			float pox = m_pos.X - smallwidth / 2.0f;
			s_font_small.SetCursor(pox, cent);
			s_font_small.DrawString(ti);
			cent += s_font_small.Height();
		}
	}

	Engine::Instance().GetRenderer()->BlendColor(Color32(255,255,255));
}

void ButtonUI::LoadStaticGeometry(ColorManager& m_colors)
{
	s_roundRectModel = std::move(Model2D());

	if (!s_roundRectModel.Load(GET_CSTRING("roundrect")))
		return;

	s_staticFlags |= (uint32_t)Flags::LOADED_MODEL;
	m_colors.ColorGeometry(s_roundRectModel,Color32(255,255,255,128));
}

void ButtonUI::LoadStaticFonts()
{
	s_staticFlags = 0;

	s_font = FontManager::CreateFont(GET_CSTRING("buttonsFont"));
	if (s_font)
	{
		size_t s = 0;

		if (Engine::Instance().GetWindowSize().W  
			< Engine::Instance().GetWindowSize().H)
			s = (size_t)(Engine::Instance().GetWindowSize().W * 0.12f);
		else
			s = (size_t)(Engine::Instance().GetWindowSize().H * 0.08f);
		 
		s_font.SetSize(s);

		for (int i = 32; i < 128; i++)
			s_font.BufferChar((uint8_t)i);

		s_staticFlags |= (uint32_t)Flags::FONT_LOADED;
	}	


	s_font_small = FontManager::CreateFont(GET_CSTRING("buttonsFont"));
	if (s_font_small)
	{
		size_t s = 0;

		if (Engine::Instance().GetWindowSize().W
			< Engine::Instance().GetWindowSize().H)
			s = (size_t)(Engine::Instance().GetWindowSize().W * 0.08f);
		else
			s = (size_t)(Engine::Instance().GetWindowSize().H * 0.06f);

		s_font_small.SetSize(s);

		for (int i = 32; i < 128; i++)
			s_font_small.BufferChar((uint8_t)i);

		s_staticFlags |= (uint32_t)Flags::SMALL_FONT_LOADED;
	}
}

void ButtonUI::LoadStaticVideoMemory()
{
	if (s_staticFlags & (uint32_t)Flags::LOADED_MODEL)
	{
		s_roundRectGeom = s_roundRectModel.BuildGeometry();
		s_staticFlags |= (uint32_t)Flags::LOADED_VIDEO;
	}

	if (s_staticFlags & (uint32_t)Flags::FONT_LOADED)
	{
		s_font.LoadVideoMemory(true);
		s_staticFlags |= (uint32_t)Flags::FONT_VIDEO;
	}

	if (s_staticFlags & (uint32_t)Flags::SMALL_FONT_LOADED)
	{
		s_font_small.LoadVideoMemory(true);
		s_staticFlags |= (uint32_t)Flags::SMALL_FONT_VIDEO;
	}


	s_roundRectModel = Model2D();	
}

void ButtonUI::StaticDataClean()
{
	s_font = Font();
	s_font_small = Font();

	if (s_roundRectGeom)
	{
		delete s_roundRectGeom;
		s_roundRectGeom = nullptr;
	}
}


void ButtonUI::GenerateLayout(Layout p, float start)
{
	float ww = Engine::Instance().GetWindowSize().W;
	float wh = Engine::Instance().GetWindowSize().H;

	switch (p)
	{
	case ButtonUI::ROWS3:

		m_scale.X = ww*.72f;
		m_scale.Y = 0.26f*(wh-start);

		m_pos.X = ww / 2.0f;
		m_pos.Y = start + (.185f + .315f*(float)m_layoutIndex)*(wh - start);
		break;
	case ButtonUI::GRID3X3:
		m_scale.X = ww / 3.0f;
		m_scale.Y = wh / 3.0f;

		m_pos.X = (ww / 6.0f)*(float)( (m_layoutIndex % 3) * 2 + 1);
		m_pos.Y = (wh / 6.0f)*(float)( (m_layoutIndex / 3) * 2 + 1);
		break;
	default:
		break;
	}
}

void ButtonUI::Touch(int _x, int _y)
{
	float x = (float)_x;
	float y = (float)_y;

	if (	   x > m_pos.X - m_scale.X / 2.0f
		&&	   x < m_pos.X + m_scale.X / 2.0f
		&&	   y > m_pos.Y - m_scale.Y / 2.0f
		&&	   y < m_pos.Y + m_scale.Y / 2.0f
		)
	{
		if (m_enabled)
		{
			for (auto hand : m_handlers)
				hand();
		}
	}
}

