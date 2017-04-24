#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

//Just to get IDE happy

#include <memory>
#include <cassert>
#include <cstring>

#include "Quad.h"


#include <iostream>
#include <cstdarg>

#ifdef _WIN32
#include <crtdbg.h>
#endif


QuadSize GetQuadSize(QuadKind k)
{
	uint16_t w,h;
	switch (k)
	{
	case TQuad:
		w = 3;
		h = 2;
		break;
	case Square:
		w = 2;
		h = 2;
		break;
	case ZQuad:
		w = 3;
		h = 2;
		break;
	case SQuad:
		w = 3;
		h = 2;
		break;
	case LQuad:
		w = 2;
		h = 3;
		break;
	case FQuad:
		w = 2;
		h = 3;
		break;
	case Line:
		w = 1;
		h = 4;
		break;
	default:
		break;
	}

	return QuadSize{ w, h };
}

void CreateQuad(QuadSquare* m, QuadKind k)
{
	switch (k)
	{
	case TQuad:
		m[1].Flags |= 1;
		m[3].Flags |= 1;
		m[4].Flags |= 1;
		m[5].Flags |= 1;
		break;
	case Square:
		m[0].Flags |= 1;
		m[1].Flags |= 1;
		m[2].Flags |= 1;
		m[3].Flags |= 1;
		break;
	case ZQuad:
		m[0].Flags |= 1;
		m[1].Flags |= 1;
		m[4].Flags |= 1;
		m[5].Flags |= 1;
		break;
	case SQuad:
		m[1].Flags |= 1;
		m[2].Flags |= 1;
		m[3].Flags |= 1;
		m[4].Flags |= 1;
		break;
	case LQuad:
		m[0].Flags |= 1;
		m[2].Flags |= 1;
		m[4].Flags |= 1;
		m[5].Flags |= 1;
		break;
	case FQuad:
		m[0].Flags |= 1;
		m[1].Flags |= 1;
		m[2].Flags |= 1;
		m[4].Flags |= 1;
		break;
	case Line:
		m[0].Flags |= 1;
		m[1].Flags |= 1;
		m[2].Flags |= 1;
		m[3].Flags |= 1;
		break;
	default:
		break;
	}
}

QuadSize GetQuadSize(QuadKind k, QuadRotation r)
{
	QuadSize sizet = GetQuadSize(k);
	int w = sizet.W;
	int h = sizet.H;

	if (r == DEFAULT)
		return sizet;

	if (w == h)
		return sizet;

	if (w == 1 || h == 1)
	{
		if (r == CW_90 || r == CCW_90)
		{
			sizet.W = h;
			sizet.H = w;
			return sizet;
		}
		return sizet;
	}

	if (w == 2 && h == 3)
	{
		QuadSquare buffer[6];
		if (r == CW_90 || r == CCW_90)
		{
			sizet.W = 3;
			sizet.H = 2;
			return sizet;
		}

		if (r == INVERSE)
			return sizet;
	}

	if (w == 3 && h == 2)
	{
		QuadSquare buffer[6];
		if (r == CW_90 || r == CCW_90)
		{
			
			sizet.W = 2;
			sizet.H = 3;
			return sizet;
		}

		if (r == INVERSE)
			return sizet;
	}

	assert(false);
	return sizet;
	
}

void RotateQuad(QuadSquare* m, uint16_t & w, uint16_t& h, QuadRotation r)
{

	if (r == DEFAULT)
		return;

	if (w == h)
	{
		return;
	}

	if (w == 1 || h == 1)
	{
		if (r == CW_90 || r == CCW_90)
		{
			int tmp;
			tmp = w;
			w = h;
			h = tmp;
			return;
		}
		return;
	}

	if (w == 2 && h == 3)
	{
		QuadSquare buffer[6];
		if (r == CW_90)
		{
			buffer[2] = m[0];
			buffer[5] = m[1];
			buffer[1] = m[2];
			buffer[4] = m[3];
			buffer[0] = m[4];
			buffer[3] = m[5];
			memcpy(m, buffer, 6 * sizeof(QuadSquare));
			w = 3;
			h = 2;
			return;
		}

		if (r == CCW_90)
		{
			buffer[3] = m[0];
			buffer[0] = m[1];
			buffer[4] = m[2];
			buffer[1] = m[3];
			buffer[5] = m[4];
			buffer[2] = m[5];
			memcpy(m, buffer, 6 * sizeof(QuadSquare));
			w = 3;
			h = 2;
			return;
		}

		if (r == INVERSE)
		{
			buffer[5] = m[0];
			buffer[4] = m[1];
			buffer[3] = m[2];
			buffer[2] = m[3];
			buffer[1] = m[4];
			buffer[0] = m[5];
			memcpy(m, buffer, 6 * sizeof(QuadSquare));
			return;
		}
	}

	if (w == 3 && h == 2)
	{
		QuadSquare buffer[6];
		if (r == CW_90)
		{
			buffer[1] = m[0];
			buffer[3] = m[1];
			buffer[5] = m[2];
			buffer[0] = m[3];
			buffer[2] = m[4];
			buffer[4] = m[5];
			memcpy(m, buffer, 6 * sizeof(QuadSquare));
			w = 2;
			h = 3;
			return;
		}

		if (r == CCW_90)
		{
			buffer[4] = m[0];
			buffer[2] = m[1];
			buffer[0] = m[2];
			buffer[5] = m[3];
			buffer[3] = m[4];
			buffer[1] = m[5];
			memcpy(m, buffer, 6 * sizeof(QuadSquare));
			w = 2;
			h = 3;
			return;
		}

		if (r == INVERSE)
		{
			buffer[5] = m[0];
			buffer[4] = m[1];
			buffer[3] = m[2];
			buffer[2] = m[3];
			buffer[1] = m[4];
			buffer[0] = m[5];
			memcpy(m, buffer, 6 * sizeof(QuadSquare));
			return;
		}
	}

	assert(false);

}
