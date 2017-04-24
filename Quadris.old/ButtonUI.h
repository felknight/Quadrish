#pragma once

#ifndef BUTTONUI_H
#define BUTTONUI_H

#include "ColorManager.h"
#include "Font.h"
#include <string>
#include <functional>
#include <list>


class ButtonUI
{
public:

	typedef std::function <void()> TouchFunc;
	typedef std::list<TouchFunc> TouchHandlerList;

	enum class Flags : uint32_t
	{
		LOADED_MODEL			= 0x1
		,LOADED_VIDEO			= 0x2
		,FONT_LOADED			= 0x4
		,FONT_VIDEO				= 0x8
		,SMALL_FONT_LOADED		= 0x10
		,SMALL_FONT_VIDEO		= 0x20
	};

	enum Layout
	{
		ROWS3
		,GRID3X3
	};

	ButtonUI();
	ButtonUI(FPoint,FPoint);
	ButtonUI(Layout p,float start);
	ButtonUI(Layout p, ButtonUI& back);
	~ButtonUI();

	void SetText(const std::string& text)
	{
		m_text = text;
	}

	void SetText(std::string&& text)
	{
		m_text = std::move(text);
	}

	void Draw();

	void Touch(int x, int y);

	void AddTouchHandler(TouchFunc func)
	{
		m_handlers.push_back(func);
	}

	void SetEnabled(bool value)
	{
		m_enabled = value;
	}

	void TextColor(Color32 color)
	{
		m_color = color;
	}

	static void LoadStaticGeometry(ColorManager& m_colors);
	static void LoadStaticFonts();
	static void LoadStaticVideoMemory();
	static void StaticDataClean();

private:


	void GenerateLayout(Layout p, float start);

	
	FPoint						m_pos;
	FPoint						m_scale;
	uint32_t					m_layoutIndex;
	float						m_layoutStart;
	std::string					m_text;
	TouchHandlerList			m_handlers;
	bool						m_enabled;
	Color32						m_color;


	static uint32_t			s_staticFlags;
	static Model2D			s_roundRectModel;
	static GemeotryPointer*	s_roundRectGeom;
	static Font				s_font;
	static Font				s_font_small;

};

#endif