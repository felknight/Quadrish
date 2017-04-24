
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
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif



Model2D::Model2D()
:m_Data(nullptr)
, m_Indices(nullptr)
, m_Type((Type)0)
{

}

Model2D::Model2D(const Model2D& m)
:m_Type(m.m_Type)
, m_IdxCount(m.m_IdxCount)
, m_DataCount(m.m_DataCount)
{
    CopyData(&m);
}

Model2D::Model2D(Model2D&& m)
:m_Type(m.m_Type)
, m_IdxCount(m.m_IdxCount)
, m_DataCount(m.m_DataCount)
{
    m_Indices = m.m_Indices;
    m.m_Indices = 0;
    m_Data = m.m_Data;
    m.m_Data = 0;
}

Model2D::~Model2D()
{
    if (m_Data)
        delete[] m_Data;
    if (m_Indices)
        delete[] m_Indices;
}

Model2D Model2D::operator + (const Model2D& x)
{
    Model2D stackm;
    stackm.m_Type = m_Type;
    stackm.m_DataCount = m_DataCount + x.m_DataCount;
    stackm.m_IdxCount = m_IdxCount + x.m_IdxCount;

    if (stackm.m_DataCount > 0)
    {
        size_t datasize_a = 0;
        size_t datasize_b = 0;
        switch (m_Type)
        {
        case RGBA2D:
            stackm.m_Data = new ColorVertex2D[stackm.m_DataCount];
            datasize_a = m_DataCount*sizeof(ColorVertex2D);
            datasize_b = x.m_DataCount*sizeof(ColorVertex2D);
            break;
        default:
            assert(false);
            break;
        }
        if (m_Data)
            memcpy(stackm.m_Data, m_Data, datasize_a);
        if (x.m_Data)
        {
            size_t p = reinterpret_cast<uintptr_t>(stackm.m_Data) + datasize_a;
            memcpy(reinterpret_cast<void*>(p), x.m_Data, datasize_b);
        }
    }

    if (stackm.m_IdxCount > 0)
    {
        stackm.m_Indices = new uint16_t[stackm.m_IdxCount * 3];

        if (m_Indices)
            memcpy(stackm.m_Indices, m_Indices, m_IdxCount * 3 * sizeof(uint16_t));

        if (x.m_Indices)
        {
            uintptr_t p = reinterpret_cast<uintptr_t>(stackm.m_Indices) + m_IdxCount * 3 * sizeof(uint16_t);
            for (uint32_t i = 0; i < x.m_IdxCount * 3; i++)
            {
                uint16_t* pp = reinterpret_cast<uint16_t*>(p + sizeof(uint16_t)*i);
                *pp = x.m_Indices[i] + m_DataCount;
            }
        }

    }

    return stackm;
}

Model2D& Model2D::operator = (const Model2D& x)
{
    m_Type = x.m_Type;
    m_IdxCount = x.m_IdxCount;
    m_DataCount = x.m_DataCount;

    CopyData(&x);

    return *this;
}

Model2D& Model2D::operator = (Model2D&& x)
{
    Vertex* tmpdata = m_Data;
    uint16_t* tmpidx = m_Indices;

    m_Type = x.m_Type;
    m_IdxCount = x.m_IdxCount;
    m_DataCount = x.m_DataCount;
    m_Data = x.m_Data;
    m_Indices = x.m_Indices;
    x.m_Data = tmpdata;
    x.m_Indices = tmpidx;
    return *this;
}

void Model2D::CopyData(const Model2D* data)
{
    const Model2D& m = *data;
    if (m.m_Indices)
    {
        m_Indices = new uint16_t[m_IdxCount * 3];
        memcpy(m_Indices, m.m_Indices, m_IdxCount*sizeof(uint16_t)* 3);
    }
    else
        m_Indices = 0;


    if (m.m_Data)
    {
        switch (m_Type)
        {
        case RGBA2D:
            m_Data = new ColorVertex2D[m_DataCount];
            memcpy(m_Data, m.m_Data, m_DataCount*sizeof(ColorVertex2D));
            break;
        case SMALLTEX2D:
            m_Data = new SmallTexVertex2D[m_DataCount];
            memcpy(m_Data, m.m_Data, m_DataCount*sizeof(SmallTexVertex2D));
            break;
        default:
            assert(false);
        }
    }
    else
        m_Data = 0;
}

bool Model2D::Load(const char* filename)
{
    char buffer[255];

    Engine::FileDescriptor* f = Engine::OpenFileBinary(filename);

    if (!f)
        return false;

    Engine::ReadFile(f, 2, 1, buffer);

    if (buffer[0] != 'S' || buffer[1] != 'A')
    {
        Engine::CloseFile(f);
        return false;
    }


    Engine::ReadFile(f, sizeof(int16_t), 1, &m_Type);

    //Read vertex data
    Engine::ReadFile(f, sizeof(uint32_t), 1, &m_DataCount);

    switch (m_Type)
    {
    case RGBA2D:
        m_Data = new ColorVertex2D[m_DataCount];
        if (Engine::ReadFile(f, sizeof(ColorVertex2D), m_DataCount, m_Data) != m_DataCount)
        {
            Engine::CloseFile(f);
            return false;
        }
        break;
    case SMALLTEX2D:
    default:
        assert(false);
        break;
    }

    //Read indices
    Engine::ReadFile(f, sizeof(uint32_t), 1, &m_IdxCount);

    m_Indices = new uint16_t[m_IdxCount * 3];

    if (Engine::ReadFile(f, sizeof(uint16_t), m_IdxCount * 3, m_Indices) != m_IdxCount * 3)
    {
        Engine::CloseFile(f);
        return false;
    }

    Engine::CloseFile(f);

    return true;
}

GemeotryPointer* Model2D::BuildGeometry()
{
    auto r = Engine::Instance().GetRenderer();
    assert(r);
    switch (m_Type)
    {
    case RGBA2D:
        return r->BuildGeometry((ColorVertex2D*)m_Data, m_DataCount, m_Indices,
            m_IdxCount * 3);
        break;
    case SMALLTEX2D:
        return r->BuildGeometry((SmallTexVertex2D*)m_Data, m_DataCount, m_Indices,
            m_IdxCount * 3);
        break;
    }

    return 0;
}


void Model2D::UpdateIndexData(uint16_t* newdata, uint32_t size)
{
    //Implement If Needed
    assert(false);
}