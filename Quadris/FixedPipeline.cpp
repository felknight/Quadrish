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
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif







#if _DEBUG
//Debug global variables


#define CLEAN_GL_ERROR() glGetError()
#define LOG_ON_GLERROR(L) {if (glGetError() != 0) {Engine::Instance().LogWarning(L);}}

#else 
#define CLEAN_GL_ERROR()
#define LOG_ON_GLERROR(X)
#endif


FixedPipeline::FixedPipeline()
:m_lastIndexBuffer(0)
, m_lastVertexBuffer(0)
, m_lastState(0)
{

}

FixedPipeline::~FixedPipeline()
{

}

void FixedPipeline::Init()
{
    auto ws = Engine::Instance().GetWindowSize();
    glViewport(0, 0, (GLsizei)ws.W, (GLsizei)ws.H);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
#ifdef _WIN32
	glOrtho(0, ws.W, ws.H, 0, 1.0f, 0);
#else
	glOrthof(0, ws.W, ws.H, 0, 1.0f, 0);
#endif
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
}

void FixedPipeline::ReplaceModelViewMatrix(float* m)
{
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glMultMatrixf(m);
}

void FixedPipeline::ReplaceTextureMatrix(float* m)
{
    glMatrixMode(GL_TEXTURE);
    glLoadIdentity();
    glMultMatrixf(m);

}

void FixedPipeline::RenderGeometry(GemeotryPointer* gp, int size, int offset)
{
    bool changedGeomBuffer = false;
    if (m_lastVertexBuffer != gp->glBufferVertex)
    {
        glBindBuffer(GL_ARRAY_BUFFER, gp->glBufferVertex);
        m_lastVertexBuffer = gp->glBufferVertex;
        changedGeomBuffer = true;
    }

    if (m_lastIndexBuffer != gp->glBufferIndices)
    {
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, gp->glBufferIndices);
        m_lastIndexBuffer = gp->glBufferIndices;
    }

    if (m_lastState != gp->states
            || changedGeomBuffer
        )
    {
        glDisableClientState(GL_VERTEX_ARRAY);
        glDisableClientState(GL_COLOR_ARRAY);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glDisable(GL_TEXTURE_2D);

        if (gp->states & GemeotryPointer::VERTEX)
        {
            glEnableClientState(GL_VERTEX_ARRAY);
            glVertexPointer(2, GL_FLOAT, gp->stride,
                (GLvoid*)(uintptr_t)gp->vertexOffset);
        }

        if (gp->states & GemeotryPointer::COLOR)
        {
            glEnableClientState(GL_COLOR_ARRAY);
            glColorPointer(4, GL_UNSIGNED_BYTE, gp->stride,
                (GLvoid*)(uintptr_t)gp->colorOffset);
        }

        if (gp->states & GemeotryPointer::TEXTURE)
        {
            glEnable(GL_TEXTURE_2D);
            glEnableClientState(GL_TEXTURE_COORD_ARRAY);
            glTexCoordPointer(2, GL_SHORT, gp->stride,
                (GLvoid*)(uintptr_t)gp->textureOffset);
        }

        m_lastState = gp->states;
    }

    if (size == -1)
        size = gp->size;

    if (offset == -1)
        offset = 0;

    glDrawElements(gp->mode, size, GL_UNSIGNED_SHORT,
        (GLvoid*)(uintptr_t)offset);
}


GemeotryPointer* FixedPipeline
::BuildGeometry(ColorVertex2D* buffer, size_t n, uint16_t* indices, size_t nidx)
{

    GemeotryPointer* r = new GemeotryPointer;

    CLEAN_GL_ERROR();
    BuildGeneralGeometry(r, n, indices, nidx);
    glBufferData(GL_ARRAY_BUFFER, sizeof(ColorVertex2D)*n, buffer, GL_STATIC_DRAW);
    LOG_ON_GLERROR("Error while loading buffer data");
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    r->stride = sizeof(ColorVertex2D);
    r->vertexOffset = offsetof(ColorVertex2D, X);
    r->colorOffset = 0;
    r->mode = GL_TRIANGLES;
    r->states = GemeotryPointer::VERTEX | GemeotryPointer::COLOR;
    r->size = nidx;
    return r;
}

GemeotryPointer* FixedPipeline
::BuildGeometry(SmallTexVertex2D* buffer, size_t n, uint16_t* indices, size_t nidx)
{
    GemeotryPointer* r = new GemeotryPointer;

    CLEAN_GL_ERROR();
    BuildGeneralGeometry(r, n, indices, nidx);
    glBufferData(GL_ARRAY_BUFFER, sizeof(SmallTexVertex2D)*n, buffer, GL_STATIC_DRAW);
    LOG_ON_GLERROR("Error while loading buffer data");
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    r->stride = sizeof(SmallTexVertex2D);
    r->vertexOffset = offsetof(SmallTexVertex2D, X);
    r->textureOffset = 0;
    r->mode = GL_TRIANGLES;
    r->states = GemeotryPointer::VERTEX | GemeotryPointer::TEXTURE;
    r->size = nidx;
    return r;
}

void FixedPipeline::BuildGeneralGeometry(GemeotryPointer* r
    , size_t n, uint16_t* indices, size_t nidx)
{
    GLuint buf[2];
    glGenBuffers(2, buf);
    glBindBuffer(GL_ARRAY_BUFFER, buf[0]);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buf[1]);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(uint16_t)*nidx, indices, GL_STATIC_DRAW);

    LOG_ON_GLERROR("Error while loading buffer indices");

    r->glBufferVertex = buf[0];
    r->glBufferIndices = buf[1];
}

void FixedPipeline::ClearColor(float r, float g, float b)
{
    glClearColor(r, g, b, 1.0f);
}

void FixedPipeline::ClearColor(Color32 col)
{
    glClearColor((float)col.R / 255.0f, (float)col.G / 255.0f
        , (float)col.B / 255.0f, (float)col.A / 255.0f);
}

void FixedPipeline::BlendColor(float r, float g, float b)
{
    glColor4f(r, g, b,1.0f);
}

void FixedPipeline::BlendColor(float r, float g, float b, float a)
{
    glColor4f(r, g, b, a);
}

void FixedPipeline::BlendColor(Color32 col)
{
    glColor4f((float)col.R / 255.0f, (float)col.G / 255.0f
        , (float)col.B / 255.0f, (float)col.A / 255.0f);
}