#ifndef FONT_H
#define FONT_H

#include <stdint.h>
#include <string>
#include <unordered_map>

#include "GeometryPointer.hpp"

class FontManager;
class Image;

class Font
{
public:
	friend class FontManager;

	Font();
	Font(const Font&) = delete;
	Font(Font&&);

	Font& operator = (const Font&) = delete;
	Font& operator = (Font&&);

	operator bool()
	{
		return m_freetypeFace != nullptr;
	}

	~Font();

	void SetSize(size_t h);
	void BufferChar(uint16_t c);
	void LoadVideoMemory(bool clear = false);
	void DrawString(const std::string& utf8string);
	void SetCursor(float _x, float _y)
	{
		m_curX = _x;
		m_curY = _y;
	}
    void ClearGlyphs()
    {
        m_glyphMap.clear();
    }

    float Height();
    float NumberHeight()
    {
        return m_g1Height;
    }

	float StringWidth(const std::string&);
    void CenterText(const std::string& utf8string,float w);

	unsigned int		m_glTexAtlas;
protected:
    Font(void* face, uint8_t*);
private:

	struct Glyph
	{
		uint8_t*  buffer;
		uint16_t  width;
		uint16_t  height;
		uint16_t  pitch;
		int16_t	  X;
		int16_t   Y;
		uint16_t  charchode;
		uint16_t  texX;
		uint16_t  texY;

        float      advance;
	};

	typedef std::pair<uint16_t, Glyph> GlyphPair;
	typedef std::unordered_map<uint16_t, Glyph> GlyhpMap;

	void*				m_freetypeFace;
	GemeotryPointer*	m_geom;
	size_t				m_height;
	GlyhpMap			m_glyphMap;
	size_t				m_area;
	
	float				m_curX;
	float				m_curY;
	float				m_atlasSize;
    uint8_t*            m_fontBuffer;
    float               m_g1Height;
};

#endif