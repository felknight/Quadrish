#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <assert.h>
#include <algorithm>
#include <vector>
#include <cstring>

#include "Engine.h"
#include "AI.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif


#if defined(_WIN32) && defined(_DEBUG)
extern "C" __declspec(dllimport)
unsigned long __stdcall GetCurrentThreadId(void);
void SetThreadName(DWORD dwThreadID, char* threadName);
#endif

//#define DEBUG_PREDTHREADS

#ifdef _DEBUG
extern const QuadSquare* g_renderedMatrix;

void g_verifyMatrix(QuadSquare* oth)
{

    if (!g_renderedMatrix)
        return;

    for (uint32_t i = 0; i < AI::BOARD_HEIGHT; i++)
    {
        for (uint32_t j = 0; j < AI::BOARD_WIDTH; j++)
        {
            if (!g_renderedMatrix)
                return;

            assert(g_renderedMatrix[i* AI::BOARD_WIDTH + j].Flags
                == oth[i* AI::BOARD_WIDTH + j].Flags);
        }
    }
}
#endif

unsigned int g_seed = (unsigned int)::time(NULL);
//unsigned int g_seed = 588928248;

std::mt19937 AI::s_randEngine = std::mt19937(g_seed);
std::uniform_int_distribution<uint32_t>  AI::s_randDist;

AI::AI()
:m_reqDataGuard(false)
, m_hasDataGuard(false)
, m_hasDataFlag(false)
, m_reqBranch(0)
, m_matrix(nullptr)
, m_randomBag(s_randEngine,s_randDist)
, m_restartRequested(false)
, m_changeFigure(false)
, m_specificFigure(false)
{
#ifndef _UNITTEST
	Engine::Instance().LogInformation("AI Started with seed: %d", g_seed);
#endif
	for (int i = 0; i < PREDICTION_BRANCHES; i++)
		m_predGuardStart[i] = false;

    for (int i = 0; i < PREDICTION_BRANCHES; i++)
        m_predMatrices[i] = nullptr;

    for (int i = 0; i < PREDICTION_BRANCHES; i++)
        m_predStopFlag[i] = false;    
}

AI::~AI()
{
    for (auto p : m_predMatrices)
    {
        if (p)
            delete[] p;
    }

    if (m_matrix)
        delete m_matrix;
        
}

void AI::Start(const QuadSquare* matrix)
{
	using namespace std;
	assert(matrix);
	m_matrix = new QuadSquare[BOARD_WIDTH*BOARD_HEIGHT];
	memcpy(m_matrix, matrix, sizeof(QuadSquare)*BOARD_WIDTH*BOARD_HEIGHT);

	for (int i = 0; i < PREDICTION_BRANCHES; i++)
		m_predMatrices[i] = new QuadSquare[BOARD_WIDTH*BOARD_HEIGHT];

	m_mainThread = std::move(thread(bind(&AI::MainThread, this)));

#ifndef _UNITTEST
	Engine::Instance().AddWaitThread(&m_mainThread);
#endif
	
	for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
	{
		m_predThreads[i] = std::move(thread(bind(&AI::PredThread, this,i)));
#ifndef _UNITTEST
		Engine::Instance().AddWaitThread(&m_predThreads[i]);
#endif
	}
	
}

void AI::MainThread()
{
#if defined(_WIN32) && defined(_DEBUG) && !defined(_UNITTEST)
	unsigned long id = GetCurrentThreadId();
	SetThreadName(id, "Main AI Thread");
#endif

start:
    if (m_specificFigure)
    {
        m_currentFigure = m_specificFigureKind;
    }
    else
        m_currentFigure = m_randomBag.Next();
   
	m_result = m_currentFigure;

    bool stop = false;
    ProcessAI(m_matrix, m_resultPos, m_resultRotation
        ,m_currentFigure, m_validResult, &stop);
    m_currentFigure = m_randomBag.Next();

#ifdef _DEBUG
//    g_verifyMatrix(m_matrix);
#endif

	for (int i = 0; i < PREDICTION_BRANCHES; i++)
		GenPredictionMatrix(m_predMatrices[i], m_resultPos[i]);

	
#ifdef DEBUG_PREDTHREADS
    for (int id = 0; id < PREDICTION_BRANCHES; id++)
    {
        if (m_validResult[id])
        {
            ProcessAI(m_predMatrices[id]
                , (SPoint(*)[4])m_predResultsPos[id*PREDICTION_BRANCHES]
                , &m_predResultsRot[id*PREDICTION_BRANCHES]
                , m_currentFigure
                , &m_predResultsValid[id*PREDICTION_BRANCHES]
                , &m_predStopFlag[id] );
            m_predProcReady[id] = true;
        }
        else
        {
            for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
                m_predResultsValid[id*PREDICTION_BRANCHES + i] = false;
        }
	}
#else
	StartAllPreds();
#endif 
    if (m_changeFigure || m_specificFigure)
    {
        m_changeFigure = false;
        m_specificFigure = false;
    }
    else
    {
        WaitForReqData();
    }
	SetHasData();

	while (true)
	{
#ifndef _UNITTEST
		if (Engine::Instance().IsClosing())
			return;
#endif
		
		WaitForReqData();
		StopAllUneeded();

        if (m_restartRequested)
        {
            for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
            {
                if (!m_predProcReady[i])
                    WaitForPredFinish(i);
            }

			for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
				m_predStopFlag[i] = false;

            memset(m_matrix, 0, sizeof(QuadSquare)*BOARD_HEIGHT*BOARD_WIDTH);
            m_randomBag.Clear();
            m_restartRequested = false;
            goto start;

        }

        if (m_changeFigure || m_specificFigure)
        {
            for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
            {
                if (!m_predProcReady[i])
                    WaitForPredFinish(i);
            }

            for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
                m_predStopFlag[i] = false;

            goto start;
        }

		for (int i = 3; i >= 0; i--)
		{
			SPoint* q = m_resultPos[m_reqBranch];
			m_matrix[q[i].X + q[i].Y * AI::BOARD_WIDTH].Flags |= QuadSquare::ACTIVE;
		}
        UpdateMatrixLines(m_matrix,true);

#ifdef _DEBUG
        g_verifyMatrix(m_matrix);
#endif

		if (!m_predProcReady[m_reqBranch])
		{
			WaitForPredFinish(m_reqBranch);
		}

        for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
            m_predStopFlag[i] = false;

		for (int i = 0; i < PREDICTION_BRANCHES; i++)
		{
			memcpy(m_resultPos[i]
				, m_predResultsPos[m_reqBranch*PREDICTION_BRANCHES + i]
				, sizeof(SPoint)* 4);

			m_resultRotation[i] = m_predResultsRot[m_reqBranch*PREDICTION_BRANCHES + i];
            m_validResult[i] = m_predResultsValid[m_reqBranch*PREDICTION_BRANCHES + i];
		}

		m_result = m_currentFigure;

		SetHasData();

        m_currentFigure = m_randomBag.Next();

        for (int i = 0; i < PREDICTION_BRANCHES; i++)
        {
            if (m_validResult[i])
                GenPredictionMatrix(m_predMatrices[i], m_resultPos[i]);
        }

#ifdef DEBUG_PREDTHREADS
		for (int id = 0; id < PREDICTION_BRANCHES; id++)
		{
            if (m_validResult[id])
            {
                ProcessAI(m_predMatrices[id]
                    , (SPoint(*)[4])m_predResultsPos[id*PREDICTION_BRANCHES]
                    , &m_predResultsRot[id*PREDICTION_BRANCHES]
                    , m_currentFigure
                    , &m_predResultsValid[id*PREDICTION_BRANCHES]
                    , &m_predStopFlag[id] );
                m_predProcReady[id] = true;
            }
            else
            {
                for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
                    m_predResultsValid[id*PREDICTION_BRANCHES + i] = false;
            }
		}
#else
		StartAllPreds();
#endif
	}
}

void AI::PredThread(uint32_t id)
{
#ifndef _UNITTEST
	Engine::Instance().LogInformation("A branch has been created to "
		"predict outcomes");
#endif
	while (true)
	{
#ifndef _UNITTEST
		if (Engine::Instance().IsClosing())
			return;
#endif
        uint32_t deadlockprot = 0;

        do 
        {
            WaitPredStart(id, deadlockprot);
            if (deadlockprot >= 3)
            {
                SetPredFinished(id);
                deadlockprot = 0;
            }
        } while (deadlockprot >= 3);
        

		m_predProcReady[id] = false;
        
        if (m_validResult[id])
        {
            ProcessAI(m_predMatrices[id]
                , (SPoint(*)[4])m_predResultsPos[id*PREDICTION_BRANCHES]
                , &m_predResultsRot[id*PREDICTION_BRANCHES]
                , m_currentFigure
                , &m_predResultsValid[id*PREDICTION_BRANCHES]
                , &m_predStopFlag[id]);
        }
        else
        {
            for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
                m_predResultsValid[id*PREDICTION_BRANCHES + i] = false;
        }

        SetPredFinished(id);
		m_predProcReady[id] = true;
		
	}
}

uint32_t g_proc = 0;

void AI::ProcessAI(QuadSquare* m, SPoint res[PREDICTION_BRANCHES][4]
	, QuadRotation* rot, QuadKind fig, bool valid[2],bool* stopFlag)
{
    g_proc++;

    bool foundone = false;
    bool foundtwo = false;

	uint32_t maxvalue = 0;
	uint32_t secondmax = 0;

	QuadRotation maxrot = QuadRotation::DEFAULT;
	int maxx = 0;
	int maxw = 0;

    QuadRotation secmaxrot = QuadRotation::DEFAULT;
	int secmaxx = 0;

    UpdateMatrixLines(m);

	for (int r = 0; r < QuadRotation_TOTAL;r++)
	{
		QuadSize s = GetQuadSize(fig, (QuadRotation)r);
		for (int x = 0; x <= BOARD_WIDTH - s.W; x++)
		{
			uint32_t ev = EvaluateMatrix(m, x, fig, (QuadRotation)r);

            if (*stopFlag)
                break;

			if (ev > maxvalue)
			{
				maxrot = (QuadRotation)r;
				maxx = x;
				maxvalue = ev;
				maxw = s.W;
                foundone = true;
			}			
		}
	}


	for (int r = 0; r < QuadRotation_TOTAL; r++)
	{
		QuadSize s = GetQuadSize(fig, (QuadRotation)r);
		for (int x = BOARD_WIDTH - s.W; x >= 0; x--)
		{
			uint32_t ev = EvaluateMatrix(m, x, fig, (QuadRotation)r);

            if (*stopFlag)
                break;

			if (ev > secondmax)
			{
				if (x >= maxx + maxw || x + s.W <= maxx) 
				{
					secondmax = ev;
					secmaxrot = (QuadRotation)r;
					secmaxx = x;
                    foundtwo = true;
				}
			}
		}
	}
	

	for (int j = 0; j < 2; j++)
	{
		QuadSquare square[16];
		SPoint place[4];
		if (j == 0)
		{
            if (foundone)
            {
                CreateAndPlace(square, fig, maxrot, maxx, place);
                rot[j] = maxrot;
            }
            else
            {
                valid[j] = false;
                continue;
            }
                
		}
		else
		{
            if (foundtwo)
            {
                CreateAndPlace(square, fig, secmaxrot, secmaxx, place);
                rot[j] = secmaxrot;
            }
            else
            {
                valid[j] = false;
                continue;
            }
		}
		int32_t yy = GravityQuad(m, place);

		for (uint32_t i = 0; i < 4; i++)
		{
			place[i].Y += yy;
            assert(place[i].Y >= 0);
			res[j][i] = place[i];
		}

        valid[j] = true;
		
	}

    int a = 0;

}


void AI::GenPredictionMatrix(QuadSquare* m, SPoint p[4])
{
	memcpy(m, m_matrix, sizeof(QuadSquare)*BOARD_HEIGHT*BOARD_WIDTH);
	for (int i = 3; i >= 0; i--)
		m[p[i].X + p[i].Y * BOARD_WIDTH].Flags |= QuadSquare::ACTIVE;
}

int32_t AI::LowerPlaceColumn(const QuadSquare* mat, uint32_t col, uint32_t c)
{
	uint32_t max = 0;
	int32_t first = -1;
	for (uint32_t i = 0; i < BOARD_HEIGHT; i++)
	{
		const auto& val = mat[i*BOARD_WIDTH + col];
		if (!(val.Flags & QuadSquare::ACTIVE))
		{
			if (first < 0)
				first = i;

			max++;
			if (max == c)
				return first;
		}
		else
		{
			first = -1;
			max = 0;
		}
			
	}
	return -1;
	
}

int32_t AI::GravityQuad(const QuadSquare* mat, const SPoint q[4])
{
	
    int maxp = 0;
    for (uint32_t i = 0; i < 4; i++)
    {
        if (q[i].Y > maxp)
            maxp = q[i].Y;
    }

    int p = (BOARD_HEIGHT-1)-maxp;


	do
    {
        if (p < 0)
            return 0;

		SPoint np[4];
		for (int i = 3; i >= 0; i--)
		{
			np[i].Y = q[i].Y + p;
			np[i].X = q[i].X;
		}

		for (int i = 3; i >= 0; i--)
		{
			if (mat[np[i].X + np[i].Y * BOARD_WIDTH].Flags & QuadSquare::ACTIVE)
			{
                p++;
                for (int i = 3; i >= 0; i--)
                {
                    if (q[i].Y + p >= BOARD_HEIGHT - 1)
                        return -1;
                }
                return p;
			}
		}
        
        p--;        
	} while (true);
}

void AI::PlaceQuad(const QuadSquare* m, uint32_t x, uint32_t y, uint32_t w, uint32_t h, SPoint* p)
{
	uint32_t k = 0;
	for (uint32_t i = 0; i < h; i++)
	{
		for (uint32_t j = 0; j < w; j++)
		{
			if (m[i*w+j].Flags & QuadSquare::ACTIVE)
			{
				assert(k < 4);
				p[k].X = j + x;
				uint32_t yy = h - i;
				p[k].Y = yy + y-1;
				k++;
			}
		}
	}
	assert(k == 4);
}

uint32_t AI::NumberHoles(const QuadSquare* m)
{
	int clearLine = 0;
	int lineHoles = 0;
	int holes = 0;
	for (uint32_t i = 0; i < BOARD_HEIGHT-1; i++)
	{
		for (uint32_t j = 0; j < BOARD_WIDTH; j++)
		{
			if (!(m[i*BOARD_WIDTH + j].Flags & QuadSquare::ACTIVE))
			{
				clearLine++;
				if ((m[(i + 1)*BOARD_WIDTH + j].Flags & QuadSquare::ACTIVE))
					lineHoles++;
			}
				
		}
		if (clearLine == BOARD_WIDTH)
			return holes;
		else
			holes += lineHoles;
		clearLine = 0;
		lineHoles = 0;
	}
	return holes;
	
}

uint32_t AI::EvaluateMatrix(const QuadSquare* m, int x, QuadKind f, QuadRotation r)
{
	QuadSquare square[16];
	QuadSquare tm[BOARD_HEIGHT*BOARD_WIDTH];
	memcpy(tm, m, sizeof(QuadSquare)*BOARD_HEIGHT*BOARD_WIDTH);

	QuadSize size = GetQuadSize(f);
	CreateQuad(square, f);
	RotateQuad(square, size.W, size.H, r);

	SPoint place[4];
	PlaceQuad(square, x, 0, size.W, size.H, place);
	int32_t yy = GravityQuad(m, place);

	if (yy == -1)
		return 0;

	int k = 0;
    int16_t maxh = 0;
	for (uint32_t i = 0; i < 4; i++)
	{
		if (i > 2)
			k = 20;

		place[i].Y += yy;
        if (place[i].Y > maxh)
            maxh = place[i].Y;

		tm[place[i].Y*BOARD_WIDTH + place[i].X].Flags |= QuadSquare::ACTIVE;
	}

	int holes = NumberHoles(tm);
    int height = MaxHeight(tm);
    return (500 - holes * 10) + (BOARD_HEIGHT - height)*2 
        + (BOARD_HEIGHT - maxh);
}

void AI::CreateAndPlace(QuadSquare* square, QuadKind fig, QuadRotation rot
	,int x, SPoint * place)
{
	QuadSize size = GetQuadSize(fig);
	CreateQuad(square, fig);
	RotateQuad(square, size.W, size.H, rot);


	PlaceQuad(square, x, 0, size.W, size.H, place);
}

uint32_t AI::MaxHeight(const QuadSquare* m)
{

    int k = ColumnHeight(m, 0, 0);
    for (uint32_t i = 1; i < BOARD_WIDTH; i++)
        k = ColumnHeight(m, k, i);

    return k;
}

uint32_t AI::ColumnHeight(const QuadSquare* m, uint32_t s, uint32_t c)
{
    uint32_t k = 0;
    for (uint32_t i = s; i < BOARD_HEIGHT; i++)
    if (m[i*BOARD_WIDTH + c].IsActive())
        k++;
    else
        break;
    
    return k+s;
}

int32_t AI::CheckForLines(const QuadSquare* m)
{
    for (uint32_t i = 0; i < BOARD_HEIGHT; i++)
    {
        uint32_t linec = 0;
        for (uint32_t j = 0; j < BOARD_WIDTH; j++)
        {
            if (m[i*BOARD_WIDTH + j].IsActive())
                linec++;
        }

        if (linec == BOARD_WIDTH)
            return i;
    }

    return -1;
}

void AI::UpdateMatrixLines(QuadSquare* m,bool debug)
{
    int line = 0;
    line = CheckForLines(m);

    while (line >= 0)
    {   
        if (line < BOARD_HEIGHT - 1)
        {
            uint32_t kline = line + 1;

            do
            {
                for (uint32_t k = kline*BOARD_WIDTH;
                    k < kline*BOARD_WIDTH + BOARD_WIDTH; k++)
                {
                    assert((k - BOARD_WIDTH) >= 0);
                    assert(k < BOARD_WIDTH*BOARD_HEIGHT);
                    m[k - BOARD_WIDTH] = m[k];
                }
                kline++;
            } while (kline < BOARD_HEIGHT);
        }
        else
        {
            for (int32_t k = line*BOARD_WIDTH; k < line*BOARD_WIDTH + BOARD_WIDTH; k++)
            {
                m[k].Flags &= ~m[k].ACTIVE;
            }
        }
        line = CheckForLines(m);
    }
}

void AI::WaitForReqData()
{
	typedef std::chrono::milliseconds ms_t;
	ms_t exittimeout = ms_t(1500);
	std::unique_lock<std::mutex> lock(m_reqDataMutex);
	while (!m_reqDataGuard)
	{
		m_reqData.wait_for(lock, exittimeout, [this] {return m_reqDataGuard; });
#ifndef _UNITTEST
		if (Engine::Instance().IsClosing())
			return;
#endif
	}
		
	m_reqDataGuard = false; 
}

void AI::SetHasData()
{
	m_hasDataGuard = true;
	m_hasDataFlag = true;
	m_hasData.notify_one();
}

void AI::WaitConsumerDataFetch()
{
	std::unique_lock<std::mutex> lock(m_dataFetchedMutex);
	m_dataFetch.wait(lock, [this] {return m_dataFetchGuard; });
	m_dataFetchGuard = false;
}


void AI::WaitPredStart(uint32_t i,uint32_t& deadlockprotection )
{
	typedef std::chrono::milliseconds ms_t;
	ms_t exittimeout = ms_t(1500);
	std::unique_lock<std::mutex> lock(m_predMutexStart[i]);
	while (!m_predGuardStart[i])
	{
		m_predStart[i].wait_for(lock, exittimeout, [this,i] {return m_predGuardStart[i]; });

        if (deadlockprotection >= 3)
            return;

#ifndef _UNITTEST
		if (Engine::Instance().IsClosing())
			return;
#endif

        deadlockprotection++;
	}

	m_predGuardStart[i] = false;
}

void AI::StartAllPreds()
{
	for (int32_t i = PREDICTION_BRANCHES-1; i >= 0; i--)
	{
		m_predGuardStart[i] = true;
		m_predStart[i].notify_one();
	}
}

void AI::WaitForPredFinish(uint32_t i)
{
	typedef std::chrono::milliseconds ms_t;
	ms_t exittimeout = ms_t(1500);
	std::unique_lock<std::mutex> lock(m_predMutexReady[i]);
	while (!m_predGuardReady[i])
	{
        m_predReady[i].wait_for(lock, exittimeout, [this, i] {return m_predGuardReady[i]; });
#ifndef _UNITTEST
		if (Engine::Instance().IsClosing())
			return;
#endif
	}

	m_predGuardReady[i] = false;
}

void AI::SetPredFinished(uint32_t i)
{
    m_predGuardReady[i] = true;
    m_predReady[i].notify_one();
}

void AI::StopAllUneeded()
{
    for (uint32_t i = 0; i < PREDICTION_BRANCHES; i++)
    {
        if (i != m_reqBranch)
            m_predStopFlag[i] = true;        
    }
}

void AI::RestartAI()
{
    m_restartRequested = true;
    RequestData(0);
}
