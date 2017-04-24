#ifndef QUAD_H
#define QUAD_H

#include <stdint.h>
#include "Math.hpp"


struct QuadSquare
{
	enum Flags
	{
		ACTIVE = 0x001
		, SHIFTING = 0x002
	};
	QuadSquare()
		:Flags(0)
        , Timer(0)
		, Color(0)
		, FloatEquivalent(-1)
	{

	}

	bool IsActive() const
	{
		return (bool)(Flags & QuadSquare::ACTIVE);
	}

	uint8_t		Flags;
	uint8_t		Timer;
	uint8_t		Color;
	int8_t		FloatEquivalent;
};
enum QuadKind
{
	TQuad,
	Square,
	ZQuad,
	SQuad,
	LQuad,
	FQuad,
	Line,
	QuadKind_Total
};
enum QuadRotation
{
	DEFAULT
	, CW_90
	, INVERSE
	, CCW_90
	, QuadRotation_TOTAL
};

QuadSize		GetQuadSize(QuadKind k);
QuadSize		GetQuadSize(QuadKind k,QuadRotation r);
void			CreateQuad(QuadSquare*, QuadKind);
void	     	RotateQuad(QuadSquare*, uint16_t &, uint16_t&, QuadRotation);


#endif