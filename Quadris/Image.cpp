#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#ifdef _WIN32
#define GLEW_STATIC
#include <GL\glew.h>
#else
#include <GLES/gl.h>
#endif

#include <cassert>
#include <png.h>
#include <cstring>

#include "Image.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

uint32_t Image::LastBinding = 0;

Image::Image()
:m_pixelData(nullptr)
, m_type(NONE)
, m_glPointer(0)
{

}

Image::~Image()
{
	if (m_pixelData)
		delete[] m_pixelData;

	if (m_glPointer > 0)
		glDeleteTextures(1, &m_glPointer);
}

Image* Image::LoadFromPath(const char* path)
{

	const char* ext = strchr(path, '.');
	if (strcmp(ext, ".png") != 0)
	{
		Engine::Instance().LogWarning("Image format not supported: %s", path);
		return 0;
	}

	Image* img = new Image;

	auto f = Engine::OpenFileBinary(path);
	if (f)
	{
		size_t size = Engine::FileSize(f);
		uint8_t* tmp = new uint8_t[size];
		Engine::ReadFile(f, size, 1, tmp);
		if (strcmp(ext, ".png") == 0)
		{
			if (!LoadPNG(tmp, *img, size))
			{
				delete img;
				delete[] tmp;
                Engine::CloseFile(f);
				return nullptr;
			}
		}

        Engine::CloseFile(f);
		delete[] tmp;
	}
	else
	{
		delete img;
		return nullptr;
	}

	return img;
}

bool Image::LoadPNG(uint8_t* mem, Image& desc, size_t size)
{
	png_image image;
	memset(&image, 0, sizeof (png_image));
	image.version = PNG_IMAGE_VERSION;

	if (png_image_begin_read_from_memory(&image, mem, size))
	{
		desc.m_pixelData = new uint8_t[PNG_IMAGE_SIZE(image)];

		switch (image.format)
		{
		case PNG_FORMAT_RGB:
			desc.m_type = RGB;
			desc.m_bpp = 24;
			break;
		case PNG_FORMAT_RGBA:
			desc.m_type = RGBA;
			desc.m_bpp = 32;
			break;
		case PNG_FORMAT_BGR:
			desc.m_type = BGR;
			desc.m_bpp = 24;
			break;
		case PNG_FORMAT_BGRA:
			desc.m_type = BGRA;
			desc.m_bpp = 32;
			break;
		default:
			assert(false);
			break;
		}

		desc.m_height = image.height;
		desc.m_width = image.width;
		int stride = PNG_IMAGE_ROW_STRIDE(image);
		if (stride % 4 != 0)
			stride = ((stride / 4) + 1) * 4;
		desc.m_stride = stride;

		if (png_image_finish_read(&image, NULL, desc.m_pixelData, desc.m_stride, NULL))
			return true;
		else
			return false;

	}
	else
		return false;
}

Image* Image::LoadFromMemory(uint8_t* bytes, size_t pitch,size_t w, size_t h)
{
	Image* img = new Image;
	img->m_bpp = 8;
	img->m_width = w;
	img->m_height = h;
	img->m_stride = pitch;
	img->m_pixelData = new uint8_t[pitch*h];
	img->m_type = MONO;

	memcpy(img->m_pixelData, bytes, pitch*h*sizeof(uint8_t));
	return img;
}

void Image::LoadVideoMemory(bool clean)
{
	if (!m_pixelData)
		return;
	glEnable(GL_TEXTURE_2D);

	int32_t lastbind;
	glGetIntegerv(GL_TEXTURE_BINDING_2D, &lastbind);
	glGenTextures(1, &m_glPointer);
	glBindTexture(GL_TEXTURE_2D, m_glPointer);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
#ifdef _DEBUG
	glGetError();
#endif

	switch (m_type)
	{
	case Image::RGB:
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, m_width,
			m_height, 0, GL_RGB, GL_UNSIGNED_BYTE, m_pixelData);
		break;
	case Image::BGR:
		break;
	case Image::RGBA:
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, m_width,
				m_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, m_pixelData);
		break;
	case Image::BGRA:
		break;
	case Image::MONO:
		glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, m_width,
			m_height, 0, GL_ALPHA, GL_UNSIGNED_BYTE, m_pixelData);
	default:
		break;
	}

#ifdef _DEBUG
	if (glGetError() != 0)
	{
		Engine::Instance().LogError("Error loading texture to video memory");
	}
#endif

	if (clean)
	{
		delete[] m_pixelData;
		m_pixelData = nullptr;
	}



}

void Image::Bind()
{
	if (m_glPointer != LastBinding)
	{
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, m_glPointer);
		LastBinding = m_glPointer;
	}	
}

