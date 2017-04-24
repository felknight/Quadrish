#ifndef SIMPLEGEMOETRY_H
#define SIMPLEGEMOETRY_H

#include "Math.hpp"
#include "Model2D.h" 

class SimpleGeometry
{
public:
	static Model2D TextureSquare()
	{
		static_assert(sizeof(SmallTexVertex2D) == 12, "Must be 12");

		Model2D model;
		model.m_Type = Model2D::SMALLTEX2D;
		model.m_Data = new SmallTexVertex2D[4];
		model.m_DataCount = 4;

		SmallTexVertex2D* datap = static_cast<SmallTexVertex2D*>(model.m_Data);
		datap[0].X = 0.0f;
		datap[0].Y = 0.0f;
		datap[0].U = 0;
		datap[0].V = 0;
		datap[1].X = 1.0f;
		datap[1].Y = 0.0f;
		datap[1].U = 1;
		datap[1].V = 0;
		datap[2].X = 0.0f;
		datap[2].Y = 1.0f;
		datap[2].U = 0;
		datap[2].V = 1;
		datap[3].X = 1.0f;
		datap[3].Y = 1.0f;
		datap[3].U = 1;
		datap[3].V = 1;
		model.m_Indices = new uint16_t[6];
		model.m_IdxCount = 2;
		model.m_Indices[0] = 0;
		model.m_Indices[1] = 1;
		model.m_Indices[2] = 2;
		model.m_Indices[3] = 1;
		model.m_Indices[4] = 2;
		model.m_Indices[5] = 3;

		return model;
	}

    static Model2D Square()
    {
        static_assert(sizeof(ColorVertex2D) == 12, "Must be 12");

        Model2D model;
        model.m_Type = Model2D::RGBA2D;
        model.m_Data = new ColorVertex2D[4];
        model.m_DataCount = 4;

        ColorVertex2D* datap = static_cast<ColorVertex2D*>(model.m_Data);
        datap[0].X = 0.0f;
        datap[0].Y = 0.0f;
        datap[0].color = { 0, 0, 0, 255 };
        datap[1].X = 1.0f;
        datap[1].Y = 0.0f;
        datap[1].color = { 0, 0, 0, 255 };
        datap[2].X = 0.0f;
        datap[2].Y = 1.0f;
        datap[2].color = { 0, 0, 0, 255 };
        datap[3].X = 1.0f;
        datap[3].Y = 1.0f;
        datap[3].color = { 0, 0, 0, 255 };
        model.m_Indices = new uint16_t[6];
        model.m_IdxCount = 2;
        model.m_Indices[0] = 0;
        model.m_Indices[1] = 1;
        model.m_Indices[2] = 2;
        model.m_Indices[3] = 1;
        model.m_Indices[4] = 2;
        model.m_Indices[5] = 3;

        return model;
    }

    static Model2D LineSquare()
    {
        static_assert(sizeof(ColorVertex2D) == 12, "Must be 12");

        Model2D model;
        model.m_Type = Model2D::RGBA2D_LINED;
        model.m_Data = new ColorVertex2D[4];
        model.m_DataCount = 4;

        ColorVertex2D* datap = static_cast<ColorVertex2D*>(model.m_Data);
        datap[0].X = 0.0f;
        datap[0].Y = 0.0f;
        datap[0].color = { 0, 0, 0, 0 };
        datap[1].X = 1.0f;
        datap[1].Y = 0.0f;
        datap[1].color = { 0, 0, 0, 0 };
        datap[2].X = 0.0f;
        datap[2].Y = 1.0f;
        datap[2].color = { 0, 0, 0, 0 };
        datap[3].X = 1.0f;
        datap[3].Y = 1.0f;
        datap[3].color = { 0, 0, 0, 0 };
        model.m_Indices = new uint16_t[5];
        model.m_IdxCount = 5;
        model.m_Indices[0] = 0;
        model.m_Indices[1] = 1;
        model.m_Indices[2] = 3;
        model.m_Indices[3] = 2;
        model.m_Indices[4] = 0;

        return model;
    }
};

#endif //SIMPLEGEMOETRY_H