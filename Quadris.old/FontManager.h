#ifndef FONTMANAGER_H
#define FONTMANAGER_H

#include "Font.h"

class FontManager
{
public:
	static void Load();
	static Font CreateFont(const char* path);
	static void Clean();
private:
	static bool s_loaded;
};

#endif