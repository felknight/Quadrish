#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <limits>
#include <cstring>

#include "QuadManager.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

QuadManager::QuadManager()
:m_quadMatrix(nullptr)
, m_boardHeight(0.0f)
, m_boardWidth(0.0f)
, m_colors(nullptr)
, m_floatCurrentId(0)
{
	m_quadMatrix = new QuadSquare[BOARD_HEIGHT*BOARD_WIDTH];
	m_floatingQuads.reserve(RESERVE_FLOATINGS);
}

QuadManager::~QuadManager()
{
    for (auto f : m_floatingQuads)
    {
        delete[] f.second.Matrix;
        f.second.Matrix = 0;
    }

    if (m_quadMatrix)
    {
        delete[] m_quadMatrix;
        m_quadMatrix = 0;
    }
        
}

void QuadManager::RequestSize(float W, float H)
{
	m_squareSize = H / (float)BOARD_HEIGHT;
	m_boardHeight = m_squareSize*(float)BOARD_HEIGHT;
	m_boardWidth = m_squareSize*(float)BOARD_WIDTH;

	if (m_boardWidth > W)
	{
		m_squareSize = W / (float)BOARD_WIDTH;
		m_boardHeight = m_squareSize*(float)BOARD_HEIGHT;
		m_boardWidth = m_squareSize*(float)BOARD_WIDTH;
	}
}

QuadManager::FloatingQuad&
QuadManager::CreateFloating(QuadKind kind, GameColorSet color
, QuadRotation r)
{
	std::lock_guard<std::mutex> guard(m_floatingMutex);
	m_floatingQuads.insert(FMapPair(m_floatCurrentId, FloatingQuad()));
	FloatingQuad& f = m_floatingQuads[m_floatCurrentId];
	auto size = GetQuadSize(kind);
	f.W = size.W;
	f.H = size.H;
	f.Matrix = new QuadSquare[f.W*f.H];
	f.X = 0.0f;
	f.Y = 0.0f;
	f.ID = m_floatCurrentId;

	CreateQuad(f.Matrix, kind);

	if (r != DEFAULT)
	{
		uint16_t w = size.W;
		uint16_t h = size.H;
		RotateQuad(f.Matrix, w, h, r);
		f.W = w;
		f.H = h;
	}

	for (int i = 0; i < f.W*f.H; i++)
#pragma warning(suppress: 6386)
		f.Matrix[i].Color = color;

	if (m_floatCurrentId == std::numeric_limits<int8_t>::max())
		m_floatCurrentId = 0;
	else
		m_floatCurrentId++;

	return f;
}
