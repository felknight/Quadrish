#ifndef AI_H
#define AI_H

#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <array>
#include <random>

#include "Quad.h"
#include "QuadRandomBag.h"
#include "GameConstants.hpp"


#ifdef _UNITTEST

namespace QudrisTests
{
	class AILogic;
}

#endif

class AI
{
#ifdef _UNITTEST
	friend class QudrisTests::AILogic;
#endif 
public:
//Constants
	static const int BOARD_WIDTH = GameConstants::BOARD_WIDTH;
	static const int BOARD_HEIGHT = GameConstants::BOARD_HEIGHT;

//Enums
	enum : uint32_t
	{
		PREDICTION_BRANCHES = 2
	};

//Constructor
	AI();
    ~AI();

//Thread Management
	void Start(const QuadSquare* matrix);
	void RequestData(uint32_t branch)
	{
		m_reqBranch = branch;
		m_reqDataGuard = true;
		m_reqData.notify_one();
	}
	void WaitForData(uint32_t ms)
	{
		typedef std::chrono::milliseconds ms_t;
		std::unique_lock<std::mutex> lock(m_hasDataMutex);
		m_hasData.wait_for(lock, ms_t(ms), [this] {return m_hasDataGuard; });
		m_hasDataGuard = false;
	}
	void WaitForData()
	{
		std::unique_lock<std::mutex> lock(m_hasDataMutex);
		m_hasData.wait(lock, [this] {return m_hasDataGuard; });
		m_hasDataGuard = false;
	}
	bool HasData()
	{
		return m_hasDataFlag;
	}
	void SetDataFetch()
	{
		m_hasDataFlag = false;
		m_dataFetchGuard = true;
		m_dataFetch.notify_one();
	}

    void RequestChangeFigure()
    {
        m_changeFigure = true;
    }

    void RequestSpecificFigure(QuadKind kind)
    {
        m_specificFigure = true;
        m_specificFigureKind = kind;
    }

//AI Result	
	QuadKind GetResult()
	{
		return m_result;
	}
	const SPoint* GetResultPosition(int p)
	{
		return m_resultPos[p];
	}
	QuadRotation GetResultRotation(int p)
	{
		return m_resultRotation[p];
	}
    bool IsValidResult(int p)
    {
        return m_validResult[p];
    }
//AI Management
    void RestartAI();



private:
//Private thread management
	void WaitForReqData();
	void SetHasData();
	void WaitConsumerDataFetch();
    void WaitPredStart(uint32_t i, uint32_t&);
	void StartAllPreds();
	void WaitForPredFinish(uint32_t i);
    void SetPredFinished(uint32_t i);
	void StopAllUneeded();

//Thread methods
	void MainThread();
	void PredThread(uint32_t);

//AI Processing 
	void GenPredictionMatrix(QuadSquare*, SPoint[4]);
	static void ProcessAI(QuadSquare*
		, SPoint[PREDICTION_BRANCHES][4], QuadRotation*, QuadKind figure
        , bool [2], bool* stopFlag);
	static int32_t LowerPlaceColumn(const QuadSquare*, uint32_t, uint32_t);
	static void SourtFour(int32_t in[4])
	{
#define SWAP(x,y) { if( in[x] > in[y]) {int32_t tmp = in[x]; in[x] = in[y]; in[y] = tmp;} };
		SWAP(0, 1);
		SWAP(2, 3);
		SWAP(0, 2);
		SWAP(1, 3);
		SWAP(1, 2);
	}
	static int32_t GravityQuad(const QuadSquare*, const SPoint[4]);
	static void PlaceQuad(const QuadSquare*, uint32_t, uint32_t, uint32_t, uint32_t, SPoint*);
	static uint32_t NumberHoles(const QuadSquare*);
	static uint32_t EvaluateMatrix(const QuadSquare*, int, QuadKind, QuadRotation);
	static void CreateAndPlace(QuadSquare*, QuadKind, QuadRotation, int,SPoint*);
	static uint32_t MaxHeight(const QuadSquare*);
    static uint32_t ColumnHeight(const QuadSquare*, uint32_t, uint32_t);
    static int32_t  CheckForLines(const QuadSquare*);
    static void  UpdateMatrixLines(QuadSquare* m, bool debug = false);

//AI Logic members
	QuadSquare*                                     m_matrix;
	std::array<QuadSquare*, PREDICTION_BRANCHES>    m_predMatrices;
    QuadRandomBag                                   m_randomBag;
    bool                                            m_changeFigure;
    bool                                            m_specificFigure;
    QuadKind                                        m_specificFigureKind;
// Result Memeber
	QuadKind				m_result;
	QuadRotation			m_resultRotation[PREDICTION_BRANCHES];
	SPoint					m_resultPos[PREDICTION_BRANCHES][4];
	SPoint					m_predResultsPos[PREDICTION_BRANCHES*PREDICTION_BRANCHES][4];
	QuadRotation			m_predResultsRot[PREDICTION_BRANCHES*PREDICTION_BRANCHES];
    bool			        m_predResultsValid[PREDICTION_BRANCHES*PREDICTION_BRANCHES];
	std::mutex				m_dataFetchedMutex;
	bool					m_dataFetchGuard;
	std::condition_variable m_dataFetch;
	std::array<bool, PREDICTION_BRANCHES> m_predProcReady;
	uint32_t				m_reqBranch;
	QuadKind				m_currentFigure;
    bool                    m_validResult[PREDICTION_BRANCHES];

//Threading memebers
	std::thread				m_mainThread;
	std::mutex				m_reqDataMutex;
	std::condition_variable m_reqData;
	bool					m_reqDataGuard;
	std::mutex				m_hasDataMutex;
	std::condition_variable m_hasData;
	bool					m_hasDataGuard;
	bool					m_hasDataFlag;
	std::array<std::thread, PREDICTION_BRANCHES> m_predThreads;
	std::array<std::mutex, PREDICTION_BRANCHES> m_predMutexReady;
	std::array<std::mutex, PREDICTION_BRANCHES> m_predMutexStart;
	std::array<std::condition_variable, PREDICTION_BRANCHES> m_predReady;
	std::array<std::condition_variable, PREDICTION_BRANCHES> m_predStart;
	std::array<bool, PREDICTION_BRANCHES> m_predGuardReady;
	std::array<bool, PREDICTION_BRANCHES> m_predGuardStart;
    std::array<bool, PREDICTION_BRANCHES> m_predStopFlag;
//Randomizer static members
	static std::mt19937								s_randEngine;
	static std::uniform_int_distribution<uint32_t>	s_randDist;

//AI Management members
    bool m_restartRequested;
};

#endif