#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <assert.h>

#include <ft2build.h>
#include FT_FREETYPE_H

#include "FontManager.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif


FT_Library g_library = nullptr;
bool FontManager::s_loaded;

void FontManager::Load()
{
	s_loaded = false;
	auto error = FT_Init_FreeType(&g_library);
	if (error)
		Engine::Instance().UserError(GET_CSTRING("fontProblem"));
	else
		s_loaded = true;
	
}

Font FontManager::CreateFont(const char* path)
{
	assert(g_library);
	auto file = Engine::OpenFileBinary(path);
	if (!file)
	{
		Engine::Instance().LogWarning("Font %s could not be loaded", path);
		return Font();
	}
	size_t fsize = Engine::FileSize(file);
	uint8_t* buffer = new uint8_t[fsize];
	Engine::ReadFile(file, fsize, 1, buffer);
	FT_Face face;
	auto error = FT_New_Memory_Face(g_library, buffer, fsize, 0, &face);
	if (error)
	{
		Engine::Instance().LogWarning("Error while loading the font %s "
			". Freetype error: %d", path,error);
        Engine::CloseFile(file);
		return Font();
	}

	Engine::CloseFile(file);
	return Font(face,buffer);
}

void FontManager::Clean()
{
	FT_Done_FreeType(g_library);
	g_library = nullptr;
}