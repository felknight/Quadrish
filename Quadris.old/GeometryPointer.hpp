#ifndef GEOMETRYPOINTER_H
#define GEOMETRYPOINTER_H

#include <stdint.h>

class GemeotryPointer
{
	friend class Engine;

public:
	GemeotryPointer()
		:glBufferVertex(0)
		, glBufferIndices(0)
	{

	}
	~GemeotryPointer();
	enum States
	{
		NONE = 0x000
		, VERTEX = 0X001
		, COLOR = 0X002
		, TEXTURE = 0x004
	};

	uint8_t mode;
	uint8_t states;
	uint8_t vertexOffset;
	uint8_t colorOffset;
	uint8_t textureOffset;
	uint8_t stride;
	uint32_t glBufferVertex;
	uint32_t glBufferIndices;
	size_t size;
};

#endif