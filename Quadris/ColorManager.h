#ifndef COLORMANAGER_H
#define COLORMANAGER_H

#include <string>
#include "Model2D.h"

enum GameColorSet
{
	LEFT_OPAQUE = 0
	, LEFT_TRANSPARENT
	, RIGHT_OPAQUE
	, RIGHT_TRANSPARENT
	, STAND
	, ONWAIT_SET
	, GAMECOLORSET_SIZE
};

enum Color
{
    ONWAIT = 0
	, LEVEL_BAR
	, LINESTREAK
    , LEVEL_FILL
	, LEFT_BORDER
	, LEFT_FILL
	, LEFT_LIGHT
	, RIGHT_BORDER
	, RIGHT_FILL
	, RIGHT_LIGHT
	, STAND_BORDER
	, STAND_FILL
	, STAND_LIGHT
    , MONEY_COLOR
    , FLOATING_TEXT_COLOR
	, MAINSCREEN_COLOR
	, BUTTON_FILL
	, BUTTON_HIGH
	, BUTTON_LIGHT
    , COLOR_SIZE
};

class ColorManager
{
public:
	ColorManager();
	~ColorManager();
	
//Color loading
	void LoadFromFile(const std::string& path);
	void ColorGeometry(Model2D& model, Color colors[3]);
	void ColorGeometry(Model2D& model, Color colors[3],uint8_t alpha);
	void ColorGeometry(Model2D& model);
	void ColorGeometry(Model2D& model, Color32 color);

    Color32 GetColor(Color c)
    {
        return m_colors[c];
    }

    bool IsLoaded()
    {
        return m_colors != nullptr;
    }
private:
	static void LoadColor(Vertex* vertex)
	{
		ColorVertex2D* v = static_cast<ColorVertex2D*>(vertex);
		if (v->color.R == 0)
			v->color = s_CurrentColor;
		else if (v->color.R == 255)
			v->color = s_CurrentColorSec;
		else
			v->color = s_CurrentColorTer;
	}

	static Color32	s_CurrentColor;
	static Color32	s_CurrentColorSec;
	static Color32	s_CurrentColorTer;
	uint8_t*		m_colorEquivalence;
	Color32*		m_colors;
};



#endif