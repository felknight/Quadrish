#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <string>

#include "ColorManager.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif


Color32	ColorManager::s_CurrentColor;
Color32	ColorManager::s_CurrentColorSec;
Color32	ColorManager::s_CurrentColorTer;

ColorManager::ColorManager()
:m_colors(nullptr)
{
	m_colorEquivalence = new uint8_t[COLOR_SIZE];
    m_colorEquivalence[ONWAIT] = 255;
    m_colorEquivalence[LEVEL_BAR] = 255;
    m_colorEquivalence[LINESTREAK] = 255;
    m_colorEquivalence[LEVEL_FILL] = 255;

	m_colorEquivalence[LEFT_BORDER] = 120;
	m_colorEquivalence[LEFT_FILL] = 120;
	m_colorEquivalence[LEFT_LIGHT] = 120;

	m_colorEquivalence[RIGHT_BORDER] = 120;
	m_colorEquivalence[RIGHT_FILL] = 120;
	m_colorEquivalence[RIGHT_LIGHT] = 120;

	m_colorEquivalence[STAND_BORDER] = 255;
	m_colorEquivalence[STAND_FILL] = 255;
	m_colorEquivalence[STAND_LIGHT] = 255;

    m_colorEquivalence[MONEY_COLOR] = 255;
    m_colorEquivalence[FLOATING_TEXT_COLOR] = 255;

	m_colorEquivalence[MAINSCREEN_COLOR] = 255;
	m_colorEquivalence[BUTTON_FILL] = 255;
	m_colorEquivalence[BUTTON_HIGH] = 255;
	m_colorEquivalence[BUTTON_LIGHT] = 255;

}

ColorManager::~ColorManager()
{
	if (m_colors)
		delete[] m_colors;
	if (m_colorEquivalence)
		delete[] m_colorEquivalence;
}

void ColorManager::LoadFromFile(const std::string& path)
{
	Engine::FileDescriptor* desc =
		Engine::OpenFileBinary(path.c_str());
	if (desc)
	{
		uint32_t size;
		Engine::ReadFile(desc, sizeof(uint32_t), 1, &size);
		m_colors = new Color32[size];
		for (uint32_t i = 0; i < size; i++)
		{
			uint8_t buffer[3];
			Engine::ReadFile(desc, sizeof(uint8_t), 3, buffer);
			m_colors[i].R = buffer[2];
			m_colors[i].G = buffer[1];
			m_colors[i].B = buffer[0];
			m_colors[i].A = m_colorEquivalence[i];
		}

		Engine::CloseFile(desc);
	}
	else
	{
		m_colors = new Color32[COLOR_SIZE];
		for (int i = 0; i < COLOR_SIZE; i++)
		{
			m_colors[i].R = 0;
			m_colors[i].G = 64;
			m_colors[i].B = 0;
			m_colors[i].A = 255;
		}
	}
}

void ColorManager::ColorGeometry(Model2D& model, Color colors[3])
{
	s_CurrentColor = m_colors[colors[0]];
	s_CurrentColorSec = m_colors[colors[1]];
	s_CurrentColorTer = m_colors[colors[2]];
	model.TransformGeometry(LoadColor);
}

void ColorManager::ColorGeometry(Model2D& model, Color colors[3], uint8_t alpha)
{
	s_CurrentColor = m_colors[colors[0]];
	s_CurrentColor.A = alpha;
	s_CurrentColorSec = m_colors[colors[1]];
	s_CurrentColorSec.A = alpha;
	s_CurrentColorTer = m_colors[colors[2]];
	s_CurrentColorTer.A = alpha;
	model.TransformGeometry(LoadColor);
}

void ColorManager::ColorGeometry(Model2D& model)
{
	s_CurrentColor		= Color32(255, 255, 255);
	s_CurrentColorSec	= Color32(255, 255, 255);
	s_CurrentColorTer	= Color32(255, 255, 255);
	model.TransformGeometry(LoadColor);
}

void ColorManager::ColorGeometry(Model2D& model, Color32 color)
{
	s_CurrentColor = color;
	s_CurrentColorSec = color;
	s_CurrentColorTer = color;
	model.TransformGeometry(LoadColor);
}