#ifndef IMAGE_H
#define IMAGE_H

#include <stdint.h>
#include "Engine.h"

class Image
{
public:

	Image();
	~Image();

	Image(const Image&) = delete;
	Image(Image&&) = delete;

	Image operator = (const Image&) = delete;

	enum Type
	{
		NONE
		, RGB
		, BGR
		, RGBA
		, BGRA
		, MONO
	};

	static Image* LoadFromPath(const char* path);
	static Image* LoadFromStringName(const char* stringidx)
	{
		return LoadFromPath(Engine::Instance().GetStringManager()
			.ReturnString(stringidx).c_str());
	}
	static Image* LoadFromMemory(uint8_t* bytes, size_t pitch, size_t w, size_t h);

	void LoadVideoMemory(bool);
	void LoadVideoMemory()
	{
		LoadVideoMemory(false);
	}
	void Bind();

	static uint32_t LastBinding;
	
private:
	static bool LoadPNG(uint8_t* mem, Image& desc, size_t);

	uint8_t* m_pixelData;
	int		 m_width;
	int		 m_height;
	int		 m_stride;
	int		 m_bpp;
	Type     m_type;
	uint32_t m_glPointer;
};

#endif