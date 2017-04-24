#ifndef FLOATINGTEXT_H
#define FLOATINGTEXT_H

#include <string>
#include <forward_list>

#include "Atlas.h"
#include "Font.h"

class GemeotryPointer;

class FloatingText
{
public:
	enum FloatingType
	{
		MONEY,
        CASHBAG,
        SUPERCASH,
        GREAT
	};

	struct FloatingTextInstance
	{
		FloatingType type;
		std::string text;
		float X;
		float Y;
		float liveTime;
	};


	static void AddFloating(FloatingType type,const std::string& text,float X,float Y);
	static void DrawAll(Atlas& atlas, GemeotryPointer*,Font& font,Font& );
    static void DeleteInstance()
    {
        delete s_Instance;
		s_Instance = nullptr;
    }

private:
	void Draw(Atlas& atlas, GemeotryPointer*,Font& font,Font&);

	FloatingText();
	~FloatingText();

	FloatingText(const FloatingText&) = delete;
	FloatingText(FloatingText&&) = delete;

	FloatingText& operator = (const FloatingText&) = delete;
	FloatingText& operator = (FloatingText&&) = delete;

	static FloatingText* 						s_Instance;
	std::forward_list<FloatingTextInstance> 	m_floatsList;
};

#endif
