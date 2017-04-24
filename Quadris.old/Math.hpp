#ifndef MATH_H
#define MATH_H

#include <stdint.h>

struct Size
{
	Size()
	:W(0)
	,H(0)
	{

	}

	Size(float w, float h)
	:W(w)
	,H(h)
	{

	}
	float W;
	float H;
};

template <class T>
struct Point
{
	T X;
	T Y;
	Point() = default;

	Point(T x, T y)
		: X(x)
		, Y(y)
	{

	}
};

typedef Point<int32_t> IPoint;
typedef Point<int16_t> SPoint;
typedef Point<float> FPoint;

struct QuadSize
{
	uint16_t W;
	uint16_t H;
};


struct Color32
{
	uint8_t R;
	uint8_t G;
	uint8_t B;
    uint8_t A;

	Color32() = default;
	Color32(uint8_t r, uint8_t g, uint8_t b)
	{
		R = r;
		G = g;
		B = b;
		A = 255;
	}
	Color32(uint8_t r, uint8_t g, uint8_t b,uint8_t a)
	{
		R = r;
		G = g;
		B = b;
		A = a;
	}


};

struct Vertex
{
	
};

struct ColorVertex2D
	:public Vertex
{
	Color32 color;
	float X, Y;
};

struct SmallTexVertex2D
	:public Vertex
{
	int16_t U, V;
	float X, Y;
};

struct SizeOffsetPointer
{
	uint32_t Size;
	uint32_t Offset;
};

#endif