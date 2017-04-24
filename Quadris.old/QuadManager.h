#ifndef QUADMANAGER_H
#define QUADMANAGER_H

#include <unordered_map>
#include <functional>
#include <assert.h>
#include <mutex>

#include "Math.hpp"
#include "GeometryPointer.hpp"
#include "GameConstants.hpp"
#include "Quad.h"
#include "ColorManager.h"


class QuadManager
{
public:
	static const int BOARD_WIDTH = GameConstants::BOARD_WIDTH;
	static const int BOARD_HEIGHT = GameConstants::BOARD_HEIGHT;

	static const size_t RESERVE_FLOATINGS = 2;

	typedef void(*DrawSquareFunc)(float X, float Y, GemeotryPointer*
		, float, SizeOffsetPointer);

	struct FloatingQuad
	{
		QuadSquare* Matrix;
		float X;
		float Y;
		uint16_t W;
		uint16_t H;
		void*	 UserPointer;
		int		 UserInteger;
		float	 UserFloating;
		int8_t   ID;
	};

	typedef std::unordered_map<int8_t, FloatingQuad> FloatingMap;
	typedef std::pair<int8_t, FloatingQuad> FMapPair;

	QuadManager();
	QuadManager(const QuadManager&) = delete;
    ~QuadManager();
	void RequestSize(float W, float H);

	void DrawMatrix(DrawSquareFunc func, GemeotryPointer* gp)
	{
		float Y = m_boardHeight - m_squareSize / 2;
		float X = m_squareSize / 2;

		for (int i = 0; i < BOARD_HEIGHT; i++)
		for (int j = 0; j < BOARD_WIDTH; j++)
		{
			if ((m_quadMatrix[i*BOARD_WIDTH + j].Flags & 1) == 1)
			{
				float x = X + j*m_squareSize;
				float y = Y - i*m_squareSize;
				auto sop = m_colors[m_quadMatrix[i*BOARD_WIDTH + j].Color];
				func(x, y, gp, m_squareSize, sop);
			}
		}
	}

	void DrawFloating(const FloatingQuad& f, DrawSquareFunc func
		, GemeotryPointer* gp)
	{
		float X = f.X + m_squareSize / 2.0f;
		float Y = f.Y + m_squareSize / 2.0f;
		for (int i = 0; i < f.H; i++)
		for (int j = 0; j < f.W; j++)
		{
			if ((f.Matrix[i*f.W + j].Flags & 1) == 1)
			{
				float x = X + j*m_squareSize;
				float y = Y + i*m_squareSize;
				auto sop = m_colors[f.Matrix[i*f.W + j].Color];
				func(x, y, gp, m_squareSize, sop);
			}
		}
	}

	void DrawAllFloating(DrawSquareFunc func, GemeotryPointer* gp)
	{
		std::lock_guard<std::mutex> guard(m_floatingMutex);
		for (auto f : m_floatingQuads)
		{
			DrawFloating(f.second, func, gp);
		}
	}

	float GetBoardWidth()
	{
		return m_boardWidth;
	}

	float GetBoardHeight()
	{
		return m_boardHeight;
	}

	float GetSquareSize()
	{
		return m_squareSize;
	}

	void SetInactive(int X, int Y)
	{
		assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
		assert(Y >= 0 && X >= 0);

		m_quadMatrix[Y*BOARD_WIDTH + X].Flags &= ~(uint8_t)QuadSquare::ACTIVE;
	}

	void SetActive(int X, int Y)
	{
		assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
		assert(Y >= 0 && X >= 0);

		m_quadMatrix[Y*BOARD_WIDTH + X].Flags |= QuadSquare::ACTIVE;
	}

	void SetActive(int X, int Y, uint8_t color, int8_t f)
	{
		assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
		assert(Y >= 0 && X >= 0);

		m_quadMatrix[Y*BOARD_WIDTH + X].Flags |= QuadSquare::ACTIVE;
		m_quadMatrix[Y*BOARD_WIDTH + X].Color = color;
		m_quadMatrix[Y*BOARD_WIDTH + X].FloatEquivalent = f;
	}

	void SetActive(int X, int Y, uint8_t color)
	{
		assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
		assert(Y >= 0 && X >= 0);

		m_quadMatrix[Y*BOARD_WIDTH + X].Flags |= QuadSquare::ACTIVE;
		m_quadMatrix[Y*BOARD_WIDTH + X].Color = color;
	}

    void SetTimer(int X, int Y, uint8_t timer)
    {
        assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
        assert(Y >= 0 && X >= 0);

        m_quadMatrix[Y*BOARD_WIDTH + X].Timer = timer;
    }

	void SetShifting(int X, int Y)
	{
		assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
		assert(Y >= 0 && X >= 0);

		m_quadMatrix[Y*BOARD_WIDTH + X].Flags |= QuadSquare::SHIFTING;
	}

	uint8_t GetColor(int X, int Y)
	{
		assert(X < BOARD_WIDTH && Y < BOARD_HEIGHT);
		assert(Y >= 0 && X >= 0);

		return m_quadMatrix[Y*BOARD_WIDTH + X].Color;
	}

	void SetGeometryColors(SizeOffsetPointer* colors)
	{
		m_colors = colors;
	}

	void ColorMatrix(uint8_t color)
	{
		for (int i = 0; i < BOARD_WIDTH*BOARD_HEIGHT; i++)
			m_quadMatrix[i].Color = color;
	}

    void TimedTransition(uint8_t from, uint8_t to)
    {
        for (int i = 0; i < BOARD_HEIGHT; i++)
        for (int j = 0; j < BOARD_WIDTH; j++)
        {
            auto& q = m_quadMatrix[i*BOARD_WIDTH + j];
            if (q.Flags & QuadSquare::ACTIVE)
            {
                if (q.Color == from)
                {
                    if (!q.Timer)
                        q.Color = to;

                    q.Timer -= 1;
                }
            }
        }
    }

	FloatingQuad& CreateFloating(QuadKind f, GameColorSet color, QuadRotation = DEFAULT);

	const QuadSquare* GetMatrix()
	{
		return m_quadMatrix;
	}

    QuadSquare* BeginEditMatrix()
    {
        return m_quadMatrix;
    }

    void EndEditMatrix()
    {
        
    }

	void ForEachFloating(std::function<void(FloatingQuad&)> func)
	{
		std::lock_guard<std::mutex> guard(m_floatingMutex);
		for (auto& i : m_floatingQuads)
		{
			func(i.second);
		}
	}

	size_t FloatingCount() const
	{
		return m_floatingQuads.size();
	}

	void DeleteFloating(int8_t idx)
	{
		assert(!m_floatingQuads.empty());
		std::lock_guard<std::mutex> guard(m_floatingMutex);

        auto& f = m_floatingQuads.at(idx);
        if (f.Matrix)
        {
            delete[] f.Matrix;
            f.Matrix = nullptr;
        }
		m_floatingQuads.erase(idx);
	}

	void ClearFloating()
	{
		std::lock_guard<std::mutex> guard(m_floatingMutex);
        for (auto& f : m_floatingQuads)
        {
            if (f.second.Matrix)
            {
                delete[] f.second.Matrix;
                f.second.Matrix = nullptr;
            }
        }
		m_floatingQuads.clear();
	}

	void ClearFloating(int ex, bool useuser = false, int userex = -1)
	{

		std::lock_guard<std::mutex> guard(m_floatingMutex);
		for (auto it = m_floatingQuads.begin();it != m_floatingQuads.end();)
		{
            if ( it->second.ID != ex && (!useuser || it->second.UserInteger != userex))
            {
                if (it->second.Matrix)
                {
                    delete[] it->second.Matrix;
                    it->second.Matrix = nullptr;
                }
                
                it = m_floatingQuads.erase(it);
            }
			else
				it++;
		}
	}

    void ClearBoard()
    {
        memset(m_quadMatrix, 0, sizeof(QuadSquare)*BOARD_HEIGHT*BOARD_WIDTH);
        ClearFloating();
    }

private:
	QuadSquare*					m_quadMatrix;
	FloatingMap					m_floatingQuads;
	float						m_boardWidth;
	float						m_boardHeight;
	float						m_squareSize;
	SizeOffsetPointer*			m_colors;
	int8_t						m_floatCurrentId;
	std::mutex					m_floatingMutex;
};

#endif