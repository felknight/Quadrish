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
#include <cmath>
#include <limits>
#include <sstream>

#ifdef _WIN32
#define GLEW_STATIC
#include <GL\glew.h>
#else
#include <GLES/gl.h>
#endif


#include <ft2build.h>
#include FT_FREETYPE_H
#include FT_GLYPH_H
#include <gtx/transform.hpp>

#include "Engine.h"
#include "Font.h"
#include "Image.h"
#include "SimpleGeometry.hpp"


#ifdef _WIN32
#include <crtdbg.h>
#endif


#if _DEBUG
#define CLEAN_GL_ERROR() glGetError()
#define LOG_ON_GLERROR(L) {if (glGetError() != 0) {Engine::Instance().LogWarning(L);}}
#else 
#define CLEAN_GL_ERROR()
#define LOG_ON_GLERROR(X)
#endif


Font::Font()
	:m_freetypeFace(nullptr)
    , m_area(0)
    , m_geom(0)
    , m_fontBuffer(0)
{
}

Font::Font(void* face, uint8_t* f_buffer)
: m_freetypeFace(face)
, m_area(0)
, m_geom(0)
, m_fontBuffer(f_buffer)
{
     

}

Font::Font(Font&& x)
{
    void* tmp = m_freetypeFace;
    m_freetypeFace = x.m_freetypeFace;
    x.m_freetypeFace = tmp;

    m_glyphMap = std::move(x.m_glyphMap);
    std::swap(x.m_area, m_area);
    std::swap(x.m_geom, m_geom);
    std::swap(x.m_fontBuffer, m_fontBuffer);
}

Font& Font::operator = (Font&& x)
{
	void* tmp = m_freetypeFace;
	m_freetypeFace = x.m_freetypeFace;
    x.m_freetypeFace = tmp;

    m_glyphMap = std::move(x.m_glyphMap);
    std::swap(x.m_area, m_area);
    std::swap(x.m_geom,m_geom);
    std::swap(x.m_fontBuffer, m_fontBuffer);
	return *this;
}

Font::~Font()
{
    delete m_geom;
    m_geom = 0;

    if (m_freetypeFace)
    {
        FT_Face face = static_cast<FT_Face>(m_freetypeFace);
        FT_Done_Face(face);
        m_freetypeFace = 0;
    }

    if (m_fontBuffer)
    {
        delete[] m_fontBuffer;
        m_fontBuffer = 0;
    }
    
}


void Font::SetSize(size_t h)
{
	assert(m_freetypeFace);
	FT_Face face = static_cast<FT_Face>(m_freetypeFace);
	FT_Set_Pixel_Sizes(face, 0, h);
	m_height = h;
}

void Font::BufferChar(uint16_t c)
{
	assert(m_freetypeFace);
	assert(m_glyphMap.find(c) == m_glyphMap.end());
	FT_Face face = static_cast<FT_Face>(m_freetypeFace);
	auto index = FT_Get_Char_Index(face, c);
	FT_Load_Glyph(face, index, 0);
	auto error = FT_Render_Glyph(face->glyph 
		, FT_Render_Mode_::FT_RENDER_MODE_NORMAL);
	if (error)
	{
		Engine::Instance().LogWarning("Font could not be buffered");
		return;
	}

	auto& g = m_glyphMap[c];
	size_t s = face->glyph->bitmap.pitch*face->glyph->bitmap.rows;
	g.height = face->glyph->bitmap.rows;
	g.width = face->glyph->bitmap.width;
	g.pitch = face->glyph->bitmap.pitch;
	g.charchode = c;
	g.advance = (float)face->glyph->advance.x / 64.0f;
	g.X = face->glyph->bitmap_left;
	g.Y = face->glyph->bitmap_top;

	if (face->glyph->bitmap.buffer)
	{
		g.buffer = new uint8_t[s];
		memcpy(g.buffer, face->glyph->bitmap.buffer, s);
	}

    if (c == (uint16_t)'1')
    {
        m_g1Height = (float)face->glyph->metrics.height / 64.0f;
    }

	m_area += g.height*g.width;
}

#if defined(ANDROID) && _NDK_MATH_NO_SOFTFP == 1
extern "C" double cm_ldexp(double x, int n);
#define ldexp cm_ldexp
#endif


void Font::LoadVideoMemory(bool clear)
{   
	if (!this)
		return;

	Model2D model = SimpleGeometry::TextureSquare();
	m_geom = model.BuildGeometry();

retry:
	double f = (double)m_area*1.15;
	f = sqrt(f);

	int exp;
	if (frexp(f, &exp) != 0.5) {
		f = ldexp(1.0, exp);
	}

	size_t size = (size_t)f;

	size_t max = Engine::Instance().MaxTextureSize();
	if (size > max)
	{
		Engine::Instance().LogWarning("Font atlas too big");
		return;
	}
	m_atlasSize = (float)f;

	glEnable(GL_TEXTURE_2D);
	glGenTextures(1, &m_glTexAtlas);
	CLEAN_GL_ERROR();
	int lastbinding;
	glGetIntegerv(GL_TEXTURE_BINDING_2D, &lastbinding);
	glBindTexture(GL_TEXTURE_2D, m_glTexAtlas);
	//glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, size, size, 0, GL_ALPHA,
		GL_UNSIGNED_BYTE, 0);
	LOG_ON_GLERROR("Error while generation font atlas");
	size_t xof = 0;
	size_t yof = 0;
	int biggest = std::numeric_limits<int>::min();
	for (auto& g : m_glyphMap)
	{
		auto& gl = g.second;
		if (gl.buffer)
		{
			if (xof + gl.width > size)
			{
				xof = 0;
				yof += biggest;
				biggest = std::numeric_limits<int>::min();
			}

			gl.texX = xof;
			gl.texY = yof;

			int glerror = glGetError();

			glTexSubImage2D(GL_TEXTURE_2D, 0, xof, yof, gl.width, gl.height
				, GL_ALPHA, GL_UNSIGNED_BYTE, gl.buffer);

			glerror = glGetError();
			if (glerror != 0)
			{
				Engine::Instance().LogWarning("Error with font size calculation. "
					"Trying again. Old area: %d",m_area);
				glBindTexture(GL_TEXTURE_2D, 0);
				glDeleteTextures(1, &m_glTexAtlas);
				m_area = (size_t)((double)m_area*1.5);
				Engine::Instance().LogWarning("New area: %d", m_area);
				goto retry;
			}

			if (gl.height > biggest)
				biggest = gl.height;

			xof += gl.width;
         
				
		}		
	}

    if (clear)
    {
        for (auto& g : m_glyphMap)
        {
            auto& gl = g.second;
            delete[] gl.buffer;
            gl.buffer = nullptr;
        }
        
    }
	
	LOG_ON_GLERROR("Error while loading glyphs to alpha");
	glBindTexture(GL_TEXTURE_2D, lastbinding);

}

void Font::DrawString(const std::string& s)
{
    FT_Face face = static_cast<FT_Face>(m_freetypeFace);

	if (Image::LastBinding != m_glTexAtlas)
	{
		glBindTexture(GL_TEXTURE_2D, m_glTexAtlas);
		Image::LastBinding = m_glTexAtlas;
	}		

	for (auto c : s)
	{
        uint16_t cc = (uint16_t)((uint8_t)c);

        if (m_glyphMap.find(cc) != m_glyphMap.end())
		{
			auto gp = m_glyphMap[cc];
			float tp = 1.0f / m_atlasSize;
			auto trans = glm::translate(glm::vec3(m_curX+gp.X, m_curY-gp.Y, 0.0f));
			trans = glm::scale(trans, glm::vec3(gp.width, gp.height, 0.0f));

			
			auto tex = glm::translate(glm::vec3(tp*gp.texX, tp*gp.texY, 0.0f));
			tex = glm::scale(tex, glm::vec3(tp*gp.width, tp*gp.height, 1.0f));
			Engine::Instance().GetRenderer()->ReplaceTextureMatrix(&tex[0][0]);
			Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&trans[0][0]);

			Engine::Instance().GetRenderer()->RenderGeometry(m_geom);
			m_curX += gp.advance+1.0f;
		}
	}
}

float Font::Height()
{
    assert(m_freetypeFace);
    FT_Face face = static_cast<FT_Face>(m_freetypeFace);
    return (float)face->size->metrics.height / 64.0f;
}


float Font::StringWidth(const std::string& s)
{
	float curPosition = 0.0f;

	for (uint32_t n = 0; n < s.length(); n++)
	{
		auto ch = s[n];
		if (m_glyphMap.find((uint8_t)ch) != m_glyphMap.end())
		{
			curPosition += m_glyphMap[s[n]].advance;
		}
		else
			assert(false);
	}

	return curPosition;
}

void Font::CenterText(const std::string& utf8string, float w)
{
    std::stringstream stream(utf8string);
    std::string sentence;
    std::string lastsentence;
    std::string word;
    float senwidth = 0.0f;
    float lastwidth;
    FPoint cursor = FPoint(m_curX, m_curY);

    do
    {
        lastwidth = senwidth;
        senwidth = StringWidth(sentence);

        if (senwidth >= w*0.90)
        {
            float cen = (w - lastwidth*1.05f) / 2.0f;
            m_curX = cen+cursor.X;
            DrawString(lastsentence);
            m_curY += Height();
            sentence = word + " ";
            continue;
        }
        else
        {
            lastsentence = sentence;
        }

        if (stream.eof())
        {
            float cen = (w - senwidth*1.05f) / 2.0f;
            m_curX = cen + cursor.X;
            DrawString(sentence);
            break;
        }
        else
        {
            stream >> word;
            sentence += word + " ";
        }       
    } while (true);
    

    int a = 0;
    
}