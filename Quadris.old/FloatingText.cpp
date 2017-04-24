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
#include "FloatingText.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

FloatingText* FloatingText::s_Instance = nullptr;

FloatingText::FloatingText()
{

}

FloatingText::~FloatingText()
{

}

void FloatingText::AddFloating(FloatingType type,const std::string& text,float X,float Y)
{
	if (!s_Instance)
		s_Instance = new FloatingText;


	FloatingTextInstance inst
	{
		type,text,X,Y,100.0f
	};

	s_Instance->m_floatsList.push_front(inst);
}

void FloatingText::DrawAll(Atlas& atlas, GemeotryPointer* geomp, Font& font, Font& bigfont)
{
	if (!s_Instance)
		return;

    s_Instance->Draw(atlas, geomp, font, bigfont);

}

void FloatingText::Draw(Atlas& atlas, GemeotryPointer* geomp,Font& font,Font& bigfont)
{
	auto size = Engine::Instance().GetWindowSize();
    double delta = Engine::Instance().GetFrameDelta();

	float iw = size.W * 0.18f;
    float ihw = iw / 2.0f;

    for (auto it = m_floatsList.begin(); it != m_floatsList.end();it++)
	{
        auto& ins = *it;
        float fh = 0.0f;
        if (ins.type == GREAT)
            fh = bigfont.NumberHeight();
        else
			fh = font.NumberHeight();

        Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f
            ,ins.liveTime/100.0f);

		atlas.SetCursor(ins.X-ihw,ins.Y-ihw);

        switch (ins.type)
        {
        case MONEY:
            atlas.SetScale(iw);
		    atlas.DrawAtlasImage(geomp,"cash");
            break;
        case CASHBAG:
            atlas.SetScale(iw);
            atlas.DrawAtlasImage(geomp, "cashbag_one");
            break;
        case SUPERCASH:
            atlas.SetScale(iw*1.25f);
            atlas.DrawAtlasImage(geomp, "cashbag");
            break;
        }
        if (ins.type == GREAT)
            bigfont.SetCursor(ins.X + ihw*0.85f, ins.Y + fh / 2.0f);
        else
		    font.SetCursor(ins.X+ihw*0.85f,ins.Y+fh/2.0f);


        Engine::Instance().GetRenderer()->BlendColor(
            135.0f / 255.0f, 222.0f / 255.0f, 135.0f / 255.0f, ins.liveTime / 100.0f);

        if (ins.type == GREAT)
            bigfont.DrawString(ins.text);
        else
		    font.DrawString(ins.text);

	ins.liveTime -= (float)delta*50.0f;;
        ins.Y -= (float)delta * Engine::Instance().GetWindowSize().H*0.05f;
	}

    for (auto it = m_floatsList.before_begin(); it != m_floatsList.end(); it++)
    {
        auto it2 = it;
        it2++;
        if (it2 == m_floatsList.end())
            break;

        if (it2->liveTime <= 0)
            it = m_floatsList.erase_after(it);

        if (it == m_floatsList.end())
            break;
    }

    Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f, 1.0f);
}

