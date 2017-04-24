#ifndef MODEL2D_H
#define MODEL2D_H

#include <stdint.h>
#include "GeometryPointer.hpp"
#include "Math.hpp"

class Model2D
{
public:
	friend class SimpleGeometry;

	typedef void(*TransformGeometryFunc)(Vertex*);

	enum Type : uint16_t
	{
		RGBA2D = 0x1001
		, SMALLTEX2D = 0x1002
        , RGBA2D_LINED = 0x1003
	};

	Model2D();
	Model2D(const Model2D&);
	Model2D(Model2D&&);

	Model2D operator + (const Model2D& x);
	Model2D& operator = (const Model2D& x);
	Model2D& operator = (Model2D&& x);

	~Model2D();
	bool Load(const char* filename);
	GemeotryPointer* BuildGeometry();
	void TransformGeometry(TransformGeometryFunc func)
	{
		uintptr_t ptr = reinterpret_cast<uintptr_t>(m_Data);
		uintptr_t inc = 0;
		switch (m_Type)
		{
		case RGBA2D:
			inc = sizeof(ColorVertex2D);
		case SMALLTEX2D:
			inc = sizeof(SmallTexVertex2D);
			break;
		}

		for (uint32_t i = 0; i < m_DataCount; i++)
		{
			uintptr_t p = ptr + inc*i;
			func(reinterpret_cast<Vertex*>(p));
		}
	}

	Type GetType() const
	{
		return m_Type;
	}


	uint32_t IndexCount()
	{
		return m_IdxCount * 3;
	}

    void UpdateIndexData(uint16_t* newdata, uint32_t size);

private:
	void CopyData(const Model2D* data);

	Vertex*		m_Data;
	uint16_t*	m_Indices;
	uint32_t    m_DataCount;
	uint32_t    m_IdxCount;
	Type		m_Type;
};


#endif