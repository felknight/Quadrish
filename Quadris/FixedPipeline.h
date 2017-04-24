#ifndef FIXEDPIPELINE_H
#define FIXEDPIPELINE_H

#include "Renderer.h"

class FixedPipeline
	:public VertexRenderer
{
public:
	FixedPipeline();
	virtual ~FixedPipeline();
	virtual void Init();
	virtual void ReplaceModelViewMatrix(float*);
	virtual void ReplaceTextureMatrix(float* m);
	virtual void RenderGeometry(GemeotryPointer*, int, int);
	virtual GemeotryPointer* BuildGeometry(ColorVertex2D* buffer, size_t n,
		uint16_t* indices, size_t nidx);
	virtual GemeotryPointer* BuildGeometry(SmallTexVertex2D* buffer, size_t n,
		uint16_t* indices, size_t nidx);
    virtual void ClearColor(float r, float g, float b);
    virtual void ClearColor(Color32 col);
    virtual void BlendColor(float r, float g, float b);
    virtual void BlendColor(float r, float g, float b, float a);
    virtual void BlendColor(Color32);
private:
	void BuildGeneralGeometry(GemeotryPointer*p,
		size_t n, uint16_t* indices, size_t nidx);

	uint32_t m_lastIndexBuffer;
	uint32_t m_lastVertexBuffer;
	uint8_t  m_lastState;
};

#endif