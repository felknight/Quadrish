#ifndef RENDERER_H
#define RENDERER_H

#include <stdint.h>
#include "GeometryPointer.hpp"

class VertexRenderer
{
public:
	virtual void Init(){}
	virtual void ReplaceModelViewMatrix(float*){}
	virtual void ReplaceTextureMatrix(float* m){}
	virtual void RenderGeometry(GemeotryPointer*, int size, int ofsset){}
	virtual void RenderGeometry(GemeotryPointer* p)
	{
		RenderGeometry(p, -1, -1);
	}
	virtual GemeotryPointer* BuildGeometry(ColorVertex2D* buffer, size_t n,
		uint16_t* indices, size_t nidx)
	{
		return nullptr;
	}

	virtual GemeotryPointer* BuildGeometry(SmallTexVertex2D* buffer, size_t n,
		uint16_t* indices, size_t nidx)
	{
		return nullptr;
	}

    virtual void ClearColor(float r, float g, float b){}
    virtual void ClearColor(Color32 col){}

    virtual void BlendColor(float r,float g,float b){}
    virtual void BlendColor(float r, float g, float b,float a){}
    virtual void BlendColor(Color32){}
};

#endif