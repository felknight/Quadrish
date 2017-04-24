#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG
#endif

//TODO: If not using shaders move matrix calculation to GPU
//TODO: Re-do layout for landscape

#include <cassert>
#include <sstream>
#include <cstring>
#include <gtx/transform.hpp>
#include "Quadris.h"
#include "Image.h"
#include "SimpleGeometry.hpp"
#include "FontManager.h"
#include "FloatingText.h"
#include "ButtonUI.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

//TODO: Check colors for high res model

Quadris* Quadris::s_Instance = 0;
const QuadSquare* g_renderedMatrix = nullptr;

Quadris::Quadris()
: m_colorGameColorSet(nullptr)
, m_background(nullptr)
, m_mainScreenBackground(nullptr)
, m_storeBackground(nullptr)
, m_texRectGeom(nullptr)
, m_quitOnReload(false)
, m_hasRenderTasks(false)
, m_falling(false)
, m_alreadyCleared(false)
, m_debugCounterRefresh(0)
, m_squareColorsLoadPhase(0)
, m_resultBelong(0)
, m_coloredMatrix(false)
, m_aiStarted(false)
, m_startLevelFirstTime(true)
, m_iconatlasManager(nullptr)
, m_money(0)
, m_firstseed(false)
, m_curLevel(0.0f)
, m_levelRatio(GameConstants::LEVEL_RATIO_NUM / (double)GameConstants::LEVEL_RATIO_DEN)
, m_levelDescreaseRatio(GameConstants::LEVEL_DEC_RATIO_NUM / (double)GameConstants::LEVEL_DEC_RATIO_DEN)
, m_currentLevel(1)
, m_lineStreak(0)
, m_savedFigure(false)
, m_turnChange(false)
, m_stopPlay(false)
, m_levelManager(m_achievementManager)
, m_freeCashScale(1.0f)
, m_freeCashScaleDirection(true)
, m_currentTransaction(-1)
{
	m_ai.Start(m_quadManager.GetMatrix());
	Image::LastBinding = 0;
}


Quadris::~Quadris()
{
	Clean();
}

void Quadris::Start()
{
	m_requestAI = true;
	m_powerManager.PowerSentHandler(std::bind(&Quadris::PowerSent, this,std::placeholders::_1));

	m_LoadList.push_back(std::bind(&Quadris::LoadStore, this));
	m_LoadList.push_back(std::bind(&Quadris::LoadSquareColors,this));
	m_LoadList.push_back(std::bind(&Quadris::LoadRasterFonts, this));
	m_LoadList.push_back(std::bind(&Quadris::LoadSave, this));
	m_LoadList.push_back(std::bind(&Quadris::LoadButtons, this));

	Engine::Instance().SetLoadingRender(std::bind(&Quadris::LoadingAnimation, this));
	Engine::Instance().AddOnLoadHandle(std::bind(&Quadris::BuildAllGeometry, this));
    Engine::Instance().AddOnLoadHandle(std::bind(&Quadris::BuildStateStack, this));
	Engine::Instance().AddOnReloadHandle(std::bind(&Quadris::ReloadAll, this));
    Engine::Instance().AddOnBackHandle(std::bind(&Quadris::BackEvent, this));
    Engine::Instance().AddOnSwipeHandle(std::bind(&Quadris::SwipeEvent, this));
	Engine::Instance().PrepareLoad(m_LoadList);
}

void Quadris::Clean()
{
#define SAFE_DELETE_ARRAY(X) if (X){delete[] X; X = nullptr;}
#define SAFE_DELETE(X) if (X){delete X; X = nullptr;}


	SAFE_DELETE_ARRAY(m_colorGameColorSet);
	SAFE_DELETE(m_background);
	SAFE_DELETE(m_texRectGeom);
	SAFE_DELETE(m_squareGeom);
	SAFE_DELETE(m_iconatlasManager);
	SAFE_DELETE(m_mainScreenBackground);
	SAFE_DELETE(m_storeBackground);
	SAFE_DELETE(m_colorSquareGeom);
	SAFE_DELETE(m_texRectGeom);	


	m_mainFont  = Font();
	m_floatingFont = Font();
	m_titleFont = Font();
	m_powerManager.Clean();

	FloatingText::DeleteInstance();
	ButtonUI::StaticDataClean();
	FontManager::Clean();

}


SPoint Quadris::ScreenToPoint(SPoint point)
{
	float w = m_quadManager.GetBoardWidth();
	float h = m_quadManager.GetBoardHeight();

	float xcell = (float)BOARD_WIDTH / w*(float)point.X;
	float ycell = (float)BOARD_HEIGHT / h*(float)point.Y+1.0f;
	SPoint cell((int16_t)xcell, BOARD_HEIGHT-(int16_t)ycell);
	assert(cell.X >= 0);
	if (cell.X >= BOARD_WIDTH || cell.Y >= BOARD_HEIGHT
		|| cell.Y < 0)
	{
		return SPoint(-1, -1);
	}
	
	return cell;
}

void Quadris::ClearAICells(int idx)
{
	if (m_alreadyCleared)
		return;

	for (int r = 0; r < AI::PREDICTION_BRANCHES; r++)
	{
        if (m_validResults[r])
        {
            if (r != idx)
            for (int i = 0; i < 4; i++)
                m_quadManager.SetInactive(m_currentResults[r][i].X,
                m_currentResults[r][i].Y);
        }
	}
}

bool Quadris::CheckForAI()
{
	static bool oneframe = true;
	if (oneframe)
	{
		oneframe = false;			
		return false;
	}

	if (m_hasRenderTasks || !m_requestAI || m_stopPlay)
		return false;

	m_ai.RequestData(m_resultBelong);
	m_ai.WaitForData(500);

	if (!m_ai.HasData())
		return false;

	CopyAIResults();
	CreateAICells();

	m_ai.SetDataFetch();
	m_hasRenderTasks = true;
	m_requestAI = false;


	return false;
}

void Quadris::CheckLines()
{
    QuadSquare* m = m_quadManager.BeginEditMatrix();

    int numberlines = 0;
    float y = 0.0f;

    for (uint32_t i = 0; i < BOARD_HEIGHT;)
    {
        uint32_t linec = 0;
        for (uint32_t j = 0; j < BOARD_WIDTH; j++)
        {
            
            if (m[i*BOARD_WIDTH + j].IsActive())
                linec++;
        }

        if (linec == BOARD_WIDTH)
        {
            uint32_t line = i;

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
                for (uint32_t k = line*BOARD_WIDTH; k < line*BOARD_WIDTH * +BOARD_WIDTH; k++)
                {
                    m[k].Flags &= ~m[k].ACTIVE;
                }
            }
            y = m_quadManager.GetBoardHeight() - m_quadManager.GetSquareSize()*i;

            i = 0;
            numberlines++;
        }
        else
            i++;
    }

    m_lineStreak = m_lineStreak + numberlines;
    LinesFilled(numberlines);
    m_quadManager.EndEditMatrix();
}

GameColorSet Quadris::ColorForAIFloating(int idx)
{
	GameColorSet color;
	switch (idx)
	{
	case 0:
		color = LEFT_OPAQUE;
		break;
	case 1:
		color = RIGHT_OPAQUE;
		break;
	default:
		color = LEFT_OPAQUE;
		break;
	}
	return color;
}

GameColorSet Quadris::ColorForAICell(int idx)
{
	GameColorSet color;
	switch (idx)
	{
	case 0:
		color = LEFT_TRANSPARENT;
		break;
	case 1:
		color = RIGHT_TRANSPARENT;
		break;
	default:
		color = LEFT_TRANSPARENT;
		break;
	}
	return color;
}

GameColorSet Quadris::ColorCellToFloating(GameColorSet c)
{
	switch (c)
	{
	case LEFT_TRANSPARENT:
		return LEFT_OPAQUE;
		break;
	case RIGHT_TRANSPARENT:
		return RIGHT_OPAQUE;
		break;
	default:
		return LEFT_OPAQUE; 
		break;
	}
}

void Quadris::CreateAICells()
{
    bool oneresult = false;

	for (int i = 0; i < AI::PREDICTION_BRANCHES; i++)
	{
        if (m_ai.IsValidResult(i))
        {
            auto color = ColorForAIFloating(i);
            auto& f = m_quadManager.CreateFloating(m_ai.GetResult(), color
                , m_ai.GetResultRotation(i));

            auto pos = m_ai.GetResultPosition(i);
            int16_t minX = std::numeric_limits<int16_t>::max();
            for (int j = 0; j < 4; j++)
            if (pos[j].X < minX)
                minX = pos[j].X;

            int16_t maxY = std::numeric_limits<int16_t>::min();
            for (int j = 0; j < 4; j++)
            if (pos[j].Y > maxY)
                maxY = pos[j].Y;

            float sqs = m_quadManager.GetSquareSize();
            float bh = m_quadManager.GetBoardHeight();
            f.X = sqs * (float)minX;
            f.Y = -(float)f.H * sqs;
            f.UserFloating = bh - ((float)maxY + 1.0f)*sqs;
            f.UserInteger = i;

            color = ColorForAICell(i);

            for (int j = 0; j < 4; j++)
                m_quadManager.SetActive(pos[j].X, pos[j].Y, color, f.ID);

            oneresult = true;
        }
	}

    if (!oneresult)
    {
		Engine::Instance().ClearOnTouchHandlers();
        m_states.PushState(std::bind(&Quadris::LoseState, this),
            StateStack::State::InitFunctor([this](SSState& thiz)
        {
            Engine::Instance().LogInformation("Entering Lose State");
            Engine::Instance().GetRenderer()->ClearColor(0.2f, 0.0f, 0.0f);
        }));
		m_stopPlay = true;
    }

	m_alreadyCleared = false;
}

void Quadris::CopyAIResults()
{
	for (int i = 0; i < AI::PREDICTION_BRANCHES; i++)
	{
		auto pos = m_ai.GetResultPosition(i);
        m_validResults[i] = m_ai.IsValidResult(i);
		memcpy(m_currentResults[i], pos , sizeof(SPoint)* 4);
	}

    m_currentKind = m_ai.GetResult();
}

void Quadris::FloatArrived(QuadManager::FloatingQuad&f )
{
	auto pos = m_currentResults[f.UserInteger];

	GameColorSet currentColor = static_cast<GameColorSet>(
		m_quadManager.GetColor(pos[0].X, pos[0].Y));
	GameColorSet color = ColorCellToFloating(currentColor);

    for (int i = 0; i < 4; i++)
    {
        m_quadManager.SetActive(pos[i].X, pos[i].Y, color);
        m_quadManager.SetTimer(pos[i].X, pos[i].Y, 15);
    }
		

	m_resultBelong = f.UserInteger;
	ClearAICells(f.UserInteger);
    m_quadManager.ClearFloating(-1, true, -1);
	m_hasRenderTasks	= false;
	m_requestAI			= true;
	m_falling			= false;
	m_turnChange		= false;

    int laststreak = m_lineStreak;
    CheckLines();
    if (laststreak == m_lineStreak)
        m_lineStreak = 0;
}


bool Quadris::CheckTouchOnQuad()
{
	if (m_falling)
		return true;

	auto p = ScreenToPoint(Engine::Instance().GetTouchPoint());
	if (p.X >= 0)
	{
		auto cell = m_quadManager.GetMatrix()[p.Y * BOARD_WIDTH + p.X];
		bool belongs = false;
		if (!(cell.Flags & QuadSquare::ACTIVE) || cell.FloatEquivalent < 0)
			return true;

		for (int r = 0; r < AI::PREDICTION_BRANCHES; r++)
		{
			for (int i = 0; i < 4 && !belongs; i++)
			{
				if (m_currentResults[r][i].X == p.X
					&& m_currentResults[r][i].Y == p.Y)
				{
					belongs = true;
					m_resultBelong = r;
					break;
				}
			}
		}

		if (belongs)
		{
			assert(cell.FloatEquivalent >= 0);
			m_quadManager.ClearFloating(cell.FloatEquivalent,true,-1);
			ClearAICells(m_resultBelong);
			m_falling = true;
			m_alreadyCleared = true;
		}
	}

	return true;
}

bool Quadris::LoadSquareColors()
{
	typedef Model2D Model;
	static Model* tmpModel;
    switch (m_squareColorsLoadPhase)
	{
	case 0:
		//Load square geometry
		tmpModel = new Model;
		if (!tmpModel->Load(GET_CSTRING("midSquare")))
		{
			Engine::Instance().UserError(GET_CSTRING("resourceError"), 
				GET_CSTRING("midSquare"));
			return true;
		}
        m_squareColorsLoadPhase++;
		break;
	case 1:
	{
        if (!m_color.IsLoaded())
            m_color.LoadFromFile(GET_CSTRING("colorFile"));
            
        m_squareColorsLoadPhase++;
		break;
	}
	case 2:
	{
		m_colorGameColorSet = new SizeOffsetPointer[GAMECOLORSET_SIZE];
		uint32_t gsize = tmpModel->IndexCount();
		uint32_t curroffset = 0;

#define AdvanceOffset(X) m_colorGameColorSet[X].Size = gsize; \
		m_colorGameColorSet[X].Offset = curroffset; \
		curroffset += gsize*sizeof(uint16_t);

		assert(tmpModel->GetType() == Model2D::RGBA2D);

		//Repeat geometry for different colors
		Model m1 = *tmpModel;
		Color left[] = { LEFT_BORDER, LEFT_LIGHT, LEFT_FILL };
		m_color.ColorGeometry(m1, left, 255);
		AdvanceOffset(LEFT_OPAQUE);
		Model m2 = *tmpModel;
		m_color.ColorGeometry(m2, left);
		AdvanceOffset(LEFT_TRANSPARENT);
		Model m3 = *tmpModel;
		Color right[] = { RIGHT_BORDER, RIGHT_LIGHT, RIGHT_FILL };
		m_color.ColorGeometry(m3, right, 255);
		AdvanceOffset(RIGHT_OPAQUE);
		Model m4 = *tmpModel;
		m_color.ColorGeometry(m4, right);
		AdvanceOffset(RIGHT_TRANSPARENT);
		Model m5 = *tmpModel;
		Color stand[] = { STAND_BORDER, STAND_LIGHT, STAND_FILL };
		m_color.ColorGeometry(m5, stand);
		AdvanceOffset(STAND);
        Model m6 = *tmpModel;
        Color onwait[] = { ONWAIT, STAND_LIGHT, STAND_LIGHT };
        m_color.ColorGeometry(m6, onwait);
        AdvanceOffset(ONWAIT_SET);

		m_square = m1 + m2 + m3 + m4 + m5 + m6;
		delete tmpModel;
        m_squareColorsLoadPhase++;
		break;
	}
    case 3:
    {
		m_texRect = SimpleGeometry::TextureSquare();
        m_colorSquare = SimpleGeometry::Square();
        Color stand[] = { LEVEL_BAR, LEVEL_BAR, LEVEL_BAR };
        m_color.ColorGeometry(m_colorSquare, stand);

        Model2D tmp = SimpleGeometry::Square();
        Color stand2[] = { LEVEL_FILL, LEVEL_FILL, LEVEL_FILL };
        m_color.ColorGeometry(tmp, stand2);

		Model2D tmp2 = SimpleGeometry::Square();
		m_color.ColorGeometry(tmp2,Color32(0,0,0));

        m_colorSquare = m_colorSquare + tmp + tmp2;

		 m_squareColorsLoadPhase++;
    }
		break;
	case 4:
		m_iconatlasManager = Atlas::LoadFromStringName("atlasPath","atlasDesc");
		m_powerManager.SetAtlas(m_iconatlasManager);
		m_squareColorsLoadPhase++;
		break;
	case 5:
		ButtonUI::LoadStaticGeometry(m_color);
		m_squareColorsLoadPhase++;
		break;
	case 6:
		m_background = Image::LoadFromStringName("backgroundFile1");
		m_mainScreenBackground = Image::LoadFromStringName("backgroundFile2");
		m_storeBackground = Image::LoadFromStringName("backgroundFile3");
		m_squareColorsLoadPhase++;
		break;
	case 7:
		m_powerManager.Load();
		return true;
	}
	return false;
}

bool Quadris::LoadRasterFonts()
{

	FontManager::Load();
	m_mainFont = FontManager::CreateFont(GET_CSTRING("mainFont"));
	if (m_mainFont)
	{
        size_t s = 0;
        auto size = Engine::Instance().GetWindowSize();
        if (size.W > size.H)
            s = (size_t)(size.H * 0.08f);
        else
            s = (size_t)(size.W * 0.08f);
		m_mainFont.SetSize(s);
		for (int i = 32; i < 128;i++)
			m_mainFont.BufferChar((uint8_t)i);
		const char* extracharsforspanish = "áéíóúÁÉÍÓÚñÑ";
		for (size_t i = 0; i < strlen(extracharsforspanish); i++)
			m_mainFont.BufferChar((uint8_t)extracharsforspanish[i]);
	}

	m_floatingFont = FontManager::CreateFont(GET_CSTRING("mainFont"));
	if (m_floatingFont)
	{
		size_t s = (size_t)(Engine::Instance().GetWindowSize().W * 0.16f);
		m_floatingFont.SetSize(s);
		for (int i = 36; i <= 57;i++)
			m_floatingFont.BufferChar((uint8_t)i);
	}

	m_titleFont = FontManager::CreateFont(GET_CSTRING("titleFont"));
	if (m_titleFont)
	{
		size_t s = (size_t)(Engine::Instance().GetWindowSize().W * 0.17f);
		m_titleFont.SetSize(s);
		const char* titlechars = "Quadrish";
		for (size_t i = 0; i < strlen(titlechars); i++)
			m_titleFont.BufferChar((uint8_t)titlechars[i]);
	}

	ButtonUI::LoadStaticFonts();

	return true;
}

bool Quadris::LoadSave()
{
	m_saveManager.LoadGame(this);
	m_powerManager.UpdateStoreItems(m_storeManager);
	return true;
}

void g_RenderSquare(float x, float y, GemeotryPointer* gp,
	float squareSize, SizeOffsetPointer color)
{
	auto tras = glm::translate(glm::vec3(x, y, 0.0f));
	tras = glm::scale(tras, glm::vec3(squareSize, squareSize, 0.0f));
	Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&tras[0][0]);
	Engine::Instance().GetRenderer()->RenderGeometry(gp, color.Size,
		color.Offset);
}

bool Quadris::RenderBoardBackground()
{
	if (m_quitOnReload)
		return true;

	if (m_texRectGeom && m_background)
	{
		auto size = Engine::Instance().GetWindowSize();
		auto scale = glm::scale(glm::vec3(size.W, size.H, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&scale[0][0]);

		auto texscale = glm::translate(glm::vec3(-0.5f, 1.0f, 1.0f));
		texscale = glm::scale(texscale,glm::vec3(0.5, 1.0f, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceTextureMatrix(&texscale[0][0]);

		m_background->Bind();
		Engine::Instance().GetRenderer()->RenderGeometry(m_texRectGeom);
	}
	
	return false;
}


bool Quadris::TestRender()
{
	typedef QuadManager::FloatingQuad Floating;
	if (m_quitOnReload)
		return true;

	bool floatArrived = false;
	Floating* floating;
	m_quadManager.ForEachFloating([this, &floatArrived, &floating](Floating& f)
	{
        if (f.UserInteger == -1)
        {

        }
        else
        {        
            if (m_falling)
                f.Y += m_quadManager.GetBoardHeight()*2.0f
                * (float)Engine::Instance().GetFrameDelta();
            else
                f.Y += (float)m_currentLevel*m_quadManager.GetBoardHeight()/60.0f
                * (float)Engine::Instance().GetFrameDelta();

		    if (f.Y > f.UserFloating)
		    {
			    floating = &f;
			    floatArrived = true;
		    }
        }
			
	});

    m_quadManager.TimedTransition(LEFT_OPAQUE, STAND);
    m_quadManager.TimedTransition(RIGHT_OPAQUE, STAND);

	if (floatArrived)
		FloatArrived(*floating);

	m_quadManager.DrawMatrix(g_RenderSquare, m_squareGeom);
	m_quadManager.DrawAllFloating(g_RenderSquare, m_squareGeom);

    float h = m_quadManager.GetBoardHeight();
    float w = m_quadManager.GetBoardWidth();
    float sc = Engine::Instance().GetWindowSize().H*0.08f;
    float sc2 = sc / 2.0f;
    float numb = m_mainFont.NumberHeight();
    float barsize = Engine::Instance().GetWindowSize().H*0.02f;
    
    auto tras = glm::translate(glm::vec3(0.0f, h, 0.0f));
    tras = glm::scale(tras, glm::vec3(w, barsize, 1.0f));
    Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&tras[0][0]);

    Engine::Instance().GetRenderer()->RenderGeometry(m_colorSquareGeom,6
        ,0);

    tras = glm::translate(glm::vec3(0.0f, h, 0.0f));
    tras = glm::scale(tras, glm::vec3(w*m_curLevel, barsize, 1.0f));
    Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&tras[0][0]);

    Engine::Instance().GetRenderer()->RenderGeometry(m_colorSquareGeom, 6
        , 6 * sizeof(uint16_t));
    
	if (m_debugCounterRefresh < 0)
	{
		double fps = Engine::Instance().LastMeasureFPS();
		std::stringstream ss;
		ss << "FPS: " << fps;
		m_debugTxt = std::move(ss.str());
		m_debugCounterRefresh = 60;
	}

	m_mainFont.SetCursor(0.0f, 40.0f);
	m_mainFont.DrawString(m_debugTxt.c_str());
	m_debugCounterRefresh--;


    std::stringstream ss;
    ss << m_money;

    std::stringstream lss;
    lss << Engine::Instance().GetStringManager().ReturnString("level") << m_currentLevel;

    std::stringstream lsss;
    lsss << m_lineStreak;

    m_iconatlasManager->SetCursor(10, h - sc2 + numb + barsize/2.0f);
    m_iconatlasManager->SetScale(sc);
    m_iconatlasManager->DrawAtlasImage(m_texRectGeom, "cash");

    
    Engine::Instance().GetRenderer()->BlendColor(m_color.GetColor(MONEY_COLOR));
    m_mainFont.SetCursor(10 + sc, h + numb * 1.5f + barsize/2.0f);
    m_mainFont.DrawString(ss.str()); 
    Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f);

    Engine::Instance().GetRenderer()->BlendColor(m_color.GetColor(LEVEL_FILL));
    m_mainFont.SetCursor(w-numb*5.0f, h + numb * 1.5f + barsize / 2.0f);
    m_mainFont.DrawString(lss.str());
    Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f);

	if (!m_stopPlay)
	{
		if (m_curLevel > 0.0f)
			m_curLevel -= (float)Engine::Instance().GetFrameDelta()
			*m_levelDescreaseRatio;
		else
		{
			if (m_currentLevel > 1)
			{
				m_curLevel =
					1.0f - (float)Engine::Instance().GetFrameDelta()
					*m_levelDescreaseRatio;

				m_currentLevel--;

				m_levelRatio =
					(double)GameConstants::LEVEL_RATIO_NUM
					/ (double)GameConstants::LEVEL_RATIO_DEN
					/ ((double)m_currentLevel*(double)m_currentLevel);
			}
			else
				m_curLevel = 0.0f;
		}
	}

	if (m_texRectGeom)
		m_powerManager.Draw(m_texRectGeom);
     
	if (m_stopPlay && m_currentLevel >= m_expectedLevel)
	{
		auto size = Engine::Instance().GetWindowSize();
		float f = size.H*0.08f;
		
		m_iconatlasManager->SetCursor(size.W / 2.0f-f*2.0f, size.H / 2.0f-f);
		m_iconatlasManager->SetScale(f);
		m_iconatlasManager->DrawAtlasImage(m_texRectGeom,"cashbag");

		Color32 woncolor = m_color.GetColor(Color::LEFT_FILL);
		woncolor.A = 255;
		Engine::Instance().GetRenderer()->BlendColor(woncolor);

		m_titleFont.SetCursor(size.W / 2.0f
			- m_titleFont.StringWidth(GET_STRING("finishText"))/2.0f
			, size.H *.40f);
		
		m_titleFont.DrawString(GET_STRING("finishText"));

		m_mainFont.SetCursor(size.W / 2.0f - f * 0.85f
			, size.H / 2.0f - (f / 2.0f) + m_mainFont.Height()/2.0f );

		Engine::Instance().GetRenderer()->BlendColor(Color32(255, 255, 255));

		auto level = m_levelManager.GetLevel(m_expectedLevelIdx);

		std::stringstream str;
		str << level.MoneyReward;
		m_mainFont.DrawString(str.str());

	}

	FloatingText::DrawAll(*m_iconatlasManager, m_texRectGeom, m_floatingFont, m_mainFont);

	return false;
}

void Quadris::BuildAllGeometry()
{
	if (m_square.GetType() != 0 && m_colorGameColorSet)
	{
		if (m_background)
		{
			m_background->LoadVideoMemory(true);
			m_texRectGeom = m_texRect.BuildGeometry();
			m_texRect = Model2D();
		}

		if (m_mainScreenBackground)
			m_mainScreenBackground->LoadVideoMemory(true);

		if (m_storeBackground)
			m_storeBackground->LoadVideoMemory(true);

        m_colorSquareGeom = m_colorSquare.BuildGeometry();
        m_colorSquare = Model2D();

		if (m_mainFont)
			m_mainFont.LoadVideoMemory(true);

		if (m_floatingFont)
			m_floatingFont.LoadVideoMemory(true);

		if (m_titleFont)
			m_titleFont.LoadVideoMemory(true);

		ButtonUI::LoadStaticVideoMemory();

		m_squareGeom = m_square.BuildGeometry();
		m_square = Model2D();

        if (m_coloredMatrix)
        {
            //Don't do this agin on context reload
            m_quadManager.ColorMatrix(STAND);
            m_coloredMatrix = true;
        }

        if (m_iconatlasManager)
        	m_iconatlasManager->LoadVideoMemory(true);
		
		m_quadManager.SetGeometryColors(m_colorGameColorSet);
		m_quadManager.RequestSize(Engine::Instance().GetWindowSize().W,
			Engine::Instance().GetWindowSize().H*.93f);

		m_powerManager.CreateLayout(m_quadManager.GetBoardWidth()
			, m_quadManager.GetSquareSize()*4.0f
			, Engine::Instance().GetWindowSize().W - m_quadManager.GetBoardWidth()
			, Engine::Instance().GetWindowSize().H - m_quadManager.GetSquareSize()*4.0f);

		m_powerManager.LoadVideoMemory();
		
        m_quitOnReload = false;		
#ifdef _DEBUG
        g_renderedMatrix = m_quadManager.GetMatrix();
#endif
	}

}

void Quadris::StartAI()
{
    if (!m_aiStarted)
    {
        Engine::Instance().AddBeforeRenderTask(std::bind(&Quadris::CheckForAI, this));
        m_aiStarted = true;
    }
	    
}

void Quadris::BuildStateStack()
{
    if (m_states.IsClean())
    {
        m_states.PushState(std::bind(&Quadris::MainScreen, this),
            StateStack::State::InitFunctor([this](SSState& thiz)
        {
            Engine::Instance().LogInformation("Entering MainScreen State");
			Engine::Instance().GetRenderer()->ClearColor(m_color.GetColor(MAINSCREEN_COLOR));
            Engine::Instance().ClearOnTouchHandlers();
            Engine::Instance().AddOnTouchHandle(std::bind(&Quadris::MainScreenTouch, this));
        }
        ));
    }
    else
        m_states.RefreshLast();

    Engine::Instance().AddRenderTask(std::bind(&Quadris::StateRender, this));
}

bool Quadris::StateRender()
{
    if (m_quitOnReload)
        return true;

    return m_states.CallStates();
}

#ifdef _WIN32
#define GLEW_STATIC
#include <GL\glew.h>
#else
#include <GLES/gl.h>
#endif

bool Quadris::MainScreen()
{
	if (!m_titleFont)
		return true;


	if (m_texRectGeom && m_mainScreenBackground)
	{
		auto size = Engine::Instance().GetWindowSize();
		auto scale = glm::scale(glm::vec3(size.W, size.H, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&scale[0][0]);

		float tx, ty, sx, sy;

		if (size.W > size.H)
		{
			float rat = size.H / size.W;
			float pos = (1 - rat) / 2.0f;
			tx = 0.0f;
			ty = pos;
			sx = 1.0f;
			sy = rat;
		}
		else
		{
			float rat = size.W / size.H;
			float pos = (1 - rat) / 2.0f;
			tx = pos;
			ty = 0.0f;
			sx = rat;
			sy = 1.0f;
		}
			

		auto texscale = glm::translate(glm::vec3(tx, ty, 0.0f));
		texscale = glm::scale(texscale,glm::vec3(sx, sy, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceTextureMatrix(&texscale[0][0]);

		m_mainScreenBackground->Bind();
		Engine::Instance().GetRenderer()->RenderGeometry(m_texRectGeom);
	}


	auto size = Engine::Instance().GetWindowSize();
	float f = m_titleFont.StringWidth("Quadrish");
	float af = (size.W - f)/2.0f;

	m_titleFont.SetCursor(af, m_titleFont.Height());
	m_titleFont.DrawString("Quadrish");

	
	for (uint32_t i = 0; i < sizeof(m_mainScreenButtons) / sizeof(ButtonUI); i++)
		m_mainScreenButtons[i].Draw();

    return false;
}

bool Quadris::TestInitScreen()
{
	MainInterfaceRenderBackground();

	for (uint32_t i = 0; i < sizeof(m_levelSelectionButtons) / sizeof(ButtonUI); i++)
		m_levelSelectionButtons[i].Draw();

    return false;
}

bool Quadris::BackState()
{
	if (m_states.CurrentState().UserFlags == 0xA5 && !m_stopPlay)
	{
		//Gameplay state
		m_states.PushState(std::bind(&Quadris::PauseScreen, this)
		, std::bind(&Quadris::PauseInit, this,std::placeholders::_1));
	}
	else
		m_states.PopState();
    return true;
}

void Quadris::LoadingAnimation()
{
	
}

void Quadris::ReloadAll()
{
	Clean();

	m_quitOnReload = true;
	Engine::Instance().LogInformation("Reloading game resources...");

    m_squareColorsLoadPhase = 0;

    m_LoadList.push_back(std::bind(&Quadris::LoadSquareColors, this));
    m_LoadList.push_back(std::bind(&Quadris::LoadRasterFonts, this));
	m_LoadList.push_back(std::bind(&Quadris::LoadButtons, this));

    Engine::Instance().AddOnLoadHandle(std::bind(&Quadris::BuildAllGeometry, this));
    Engine::Instance().AddOnLoadHandle(std::bind(&Quadris::BuildStateStack, this));
    Engine::Instance().PrepareLoad(m_LoadList);
    
}

void Quadris::TouchEvent()
{
	Engine::Instance()
		.AddBeforeRenderTask(std::bind(&Quadris::CheckTouchOnQuad, this));
}

void Quadris::MainScreenTouch()
{
	Engine::Instance()
		.AddBeforeRenderTask([this]
	{
		SPoint point = Engine::Instance().GetTouchPoint();

		for (uint32_t i = 0; i < sizeof(m_mainScreenButtons) / sizeof(ButtonUI); i++)
		{
			m_mainScreenButtons[i].Touch(point.X, point.Y);
		}
		return true;
	});	
		
}

void Quadris::LevelSelectionTouch()
{
	Engine::Instance()
		.AddBeforeRenderTask([this]
	{
		SPoint point = Engine::Instance().GetTouchPoint();

		for (uint32_t i = 0; i < 9; i++)
			m_levelSelectionButtons[i].Touch(point.X, point.Y);

		return true;
	});
}

bool Quadris::BackEvent()
{
    bool result = !m_states.LastState();
    if (result)
    {
        Engine::Instance()
            .AddBeforeRenderTask(std::bind(&Quadris::BackState, this));
    }
    return result;
}

bool Quadris::GamePlayState()
{
    RenderBoardBackground();
    TestRender();

    return false;
}

void Quadris::GamePlayStateInit(SSState& thiz)
{
    Engine::Instance().GetRenderer()->ClearColor(1.0f,1.0f,1.0f);

    Engine::Instance().LogInformation("Entering GamePlay State");
    Engine::Instance().ClearOnTouchHandlers();
	m_powerManager.RegisterTouch();
    Engine::Instance().AddOnTouchHandle(
        std::bind(&Quadris::TouchEvent, this));

    StartAI();
}

bool Quadris::PauseScreen()
{
	MainInterfaceRenderBackground();

	for (uint32_t i = 0; i < sizeof(m_pauseButtons) / sizeof(ButtonUI); i++)
	{
		m_pauseButtons[i].Draw();
	}

    return false;
}

void Quadris::PauseInit(SSState& thiz)
{
    Engine::Instance().LogInformation("Entering Pause State");

	Engine::Instance().ClearOnTouchHandlers();
	Engine::Instance().AddOnTouchHandle([this]
	{
		Engine::Instance().AddBeforeRenderTask([this]
		{
			auto point = Engine::Instance().GetTouchPoint();

			for (uint32_t i = 0; i < sizeof(m_pauseButtons) / sizeof(ButtonUI); i++)
				m_pauseButtons[i].Touch(point.X, point.Y);

			return true;
		});
		
	});
}

void Quadris::CleanBoard()
{
    m_quadManager.ClearBoard();
    m_hasRenderTasks = false;
    m_requestAI = true;
    m_ai.RestartAI();
    m_currentLevel = 0;
    m_curLevel = 0.0f;
    m_levelRatio = GameConstants::LEVEL_RATIO_NUM / (float)GameConstants::LEVEL_RATIO_DEN;
    m_levelDescreaseRatio = GameConstants::LEVEL_DEC_RATIO_NUM / (float)GameConstants::LEVEL_DEC_RATIO_DEN;

}

void Quadris::SwipeEvent()
{
    if (m_states.CurrentState().UserFlags == 0xA5)
    {
        Engine::Instance()
            .AddBeforeRenderTask(
            [this]
        {
            GetNewFigure();
            return true;
        });
    }
    else if (m_states.CurrentState().UserFlags == 0xA6)
    {
        auto swipe = Engine::Instance().GetSwipeDirection();
        if (swipe == Engine::LEFTTORIGHT)
        {
            if (m_storeIdx < m_storeManager.GetItemList().size()-1)
                    m_storeIdx++;
        }
        else if (swipe == Engine::RIGHTTOLEFT)
        {
            if (m_storeIdx > 0)
                m_storeIdx--;
        }

        m_currentTransaction = -1;
        m_storeButtons[1].SetEnabled(false);
    }
}

bool Quadris::LoseState()
{
    if (m_debugCounterRefresh < 0)
    {
        double fps = Engine::Instance().LastMeasureFPS();
        std::stringstream ss;
        ss << "FPS: " << fps;
        m_debugTxt = std::move(ss.str());
        m_debugCounterRefresh = 60;
    }

    m_mainFont.SetCursor(0.0f, 40.0f);
    m_mainFont.DrawString(m_debugTxt.c_str());

    m_mainFont.SetCursor(30.0f, 180.0f);
    m_mainFont.DrawString("Nivel fallido");

    m_debugCounterRefresh--;

    return false;
}


void Quadris::LinesFilled(uint32_t n)
{
    if (n == 0)
        return;

    if (!m_firstseed)
    {
        m_randEngine = std::ranlux24(Engine::Instance().GetTouchPoint().X);
        m_poissonDist = PoissonDist(1.0f);
        m_firstseed = true;
    }
    int money = m_poissonDist(m_randEngine);
    if (n == 4)
        money++;

    if (m_lineStreak >= 4)
    {
        const std::string* grate = 
            &Engine::Instance().GetStringManager().ReturnString("lowgrat");

        if (m_lineStreak >= 16)
        {
            grate = &Engine::Instance().GetStringManager().ReturnString("supgrat");
            money += 3;
        }
        else if (m_lineStreak >= 12)
        {
            grate = &Engine::Instance().GetStringManager().ReturnString("higgrat");
            money += 2;
        }
        else if (m_lineStreak >= 8)
        {
            grate = &Engine::Instance().GetStringManager().ReturnString("midgrat");
            money += 1;
        }
            

        FloatingText::AddFloating(FloatingText::GREAT
            ,*grate
            ,Engine::Instance().GetTouchPoint().X
            , Engine::Instance().GetTouchPoint().Y+m_floatingFont.Height()*1.25f);
    }
 
    if (money >= 5)
    {
        std::stringstream str;
        str << n*(50 * (money - 3)) + m_lineStreak*20;
        FloatingText::AddFloating(FloatingText::SUPERCASH, str.str(),
            Engine::Instance().GetTouchPoint().X
            , Engine::Instance().GetTouchPoint().Y);

        m_money = m_money + n * (50 * (money - 3)) + m_lineStreak*20;
		m_saveManager.SaveGame(this);
    }
    else if (money >= 3)
    {
        std::stringstream str;
        str << n*(2 + money) + m_lineStreak;
        FloatingText::AddFloating(FloatingText::CASHBAG, str.str(),
            Engine::Instance().GetTouchPoint().X
            , Engine::Instance().GetTouchPoint().Y);

        m_money = m_money + n*(2 + money) + m_lineStreak;
		m_saveManager.SaveGame(this);
    }
    else if (money >= 1)
    {
        std::stringstream str;
        str << n + m_lineStreak;
        FloatingText::AddFloating(FloatingText::MONEY, str.str(),
             Engine::Instance().GetTouchPoint().X
            ,Engine::Instance().GetTouchPoint().Y);
        m_money = m_money + n + m_lineStreak;
		m_saveManager.SaveGame(this);
    }

    m_curLevel += m_levelRatio*(double)n*n*m_lineStreak;
    if (m_curLevel >= 1.0)
    {
        m_curLevel -= 1.0;
        if (m_curLevel >= 1.0)
            m_curLevel = 0.99;

		IncreaseLevel();
    }

	if (m_currentLevel >= m_expectedLevel)
	{
		m_stopPlay = true;
		ClearCurrentGameFigure();
		RewardLevel();
	}
}

void Quadris::GetNewFigure()
{
	if (m_turnChange)
		return;

	ClearCurrentGameFigure();

    if (m_savedFigure)
        m_ai.RequestSpecificFigure(m_savedKind);
    else
        m_ai.RequestChangeFigure();
    

    auto& floating = m_quadManager.CreateFloating(m_currentKind, GameColorSet::ONWAIT_SET);
    floating.Y = 0.0f;
    floating.X = m_quadManager.GetBoardWidth();
    floating.UserInteger = -1;

    m_hasRenderTasks = false;
    m_requestAI = true;
    m_savedFigure = true;
    m_savedKind = m_currentKind;
	m_turnChange = true;
}

void Quadris::StartGamePlayState()
{
	Engine::Instance().ClearOnTouchHandlers();
	m_states.CurrentState().UserFlags = 0;

	m_states.PushState(std::bind(&Quadris::TestInitScreen, this),
	StateStack::State::InitFunctor([this](SSState& thiz)
	{
		Engine::Instance().LogInformation("Entering TestInitScreen State");
		Engine::Instance().ClearOnTouchHandlers();
		Engine::Instance().AddOnTouchHandle(
		std::bind(&Quadris::LevelSelectionTouch, this));
		Engine::Instance().GetRenderer()->ClearColor(1.0f, 1.0f, 1.0f);

		for (uint32_t i = 0; i < 9; i++)
		{
			if ((m_levelManager.GetLockFlags() & (1 << i)))
				m_levelSelectionButtons[i].SetEnabled(true);
		}

	}));
}

bool Quadris::StoreState()
{
	MainInterfaceRenderBackground();
	auto list = m_storeManager.GetItemList();
	auto size = Engine::Instance().GetWindowSize();

	auto& item = list[m_storeIdx];

	if (!item.Icon.empty())
	{

        float iconr = size.H *.20f;
        float iconx = (size.W - iconr) / 2.0f;
        float icony = size.H * 0.05f;

		if (item.Requierment)
		if (!m_achievementManager.IsWon(item.Requierment))
			Engine::Instance().GetRenderer()->BlendColor(0.2f, 0.2f, 0.2f, 0.3f);

		m_iconatlasManager->SetCursor(iconx, icony);
		m_iconatlasManager->SetScale(iconr);
		m_iconatlasManager->DrawAtlasImage(m_texRectGeom, item.Icon);

		Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f, 1.0f);
	}


    std::stringstream ss;
    ss << m_money;

    float sc = size.H*0.08f;
    float yy = -(sc / 6.0f);

    m_iconatlasManager->SetCursor(5.0f,yy);
    m_iconatlasManager->SetScale(sc);
    m_iconatlasManager->DrawAtlasImage(m_texRectGeom, "cash");

    Engine::Instance().GetRenderer()->BlendColor(m_color.GetColor(MONEY_COLOR));
    m_mainFont.SetCursor(5.0f + sc*1.05f,m_mainFont.Height());
    m_mainFont.DrawString(ss.str()); 
    Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f);

	float tw = m_mainFont.StringWidth(item.Name);
	m_mainFont.SetCursor((size.W - tw)/2.0f, size.H * 0.30f);
	m_mainFont.DrawString(item.Name);

	if (item.Requierment)
	{
        if (!m_achievementManager.IsWon(item.Requierment))
        {
            if (size.W > size.H)
            {
                std::stringstream str;
                str << GET_STRING("requiredAchiv") << item.Requierment->Name;
                tw = m_mainFont.StringWidth(str.str());
                m_mainFont.SetCursor((size.W - tw) / 2.0f, size.H * 0.30f + m_mainFont.Height()*1.30f);
                m_mainFont.DrawString(str.str());
            }
            else
            {
                tw = m_mainFont.StringWidth(GET_STRING("requiredAchiv"));
                m_mainFont.SetCursor((size.W - tw) / 2.0f, size.H * 0.30f + m_mainFont.Height()*1.30f);
                m_mainFont.DrawString(GET_STRING("requiredAchiv"));
                tw = m_mainFont.StringWidth(item.Requierment->Name);
                m_mainFont.SetCursor((size.W - tw) / 2.0f, size.H * 0.30f + m_mainFont.Height()*2.30f);
                m_mainFont.DrawString(item.Requierment->Name);
            }


            m_storeButtons[0].SetEnabled(false);
        }
        else
            goto text;
	}
    else
    {
    text:

        float yy = size.H*0.35f;
        m_mainFont.SetCursor(0.0f, yy);
        m_mainFont.CenterText(item.Desc, size.W);

        std::stringstream str;
        str << "$" << item.Price;

        m_mainFont.SetCursor(0.0f, size.H * 0.95f);
        m_mainFont.CenterText(str.str(), size.W);

        if (m_currentTransaction == -1)
            m_storeButtons[0].SetEnabled(true);
    }
	
	std::stringstream str;
	str << m_storeIdx + 1 << "/" << list.size();
	float w = m_mainFont.StringWidth(str.str())*1.10f;

	m_mainFont.SetCursor(size.W - w, size.H-m_mainFont.Height()*.10f);
	m_mainFont.DrawString(str.str());

    float iconr = (size.H *.10f)*m_freeCashScale;
    float iconx = 0.0f;
    float icony = size.H - iconr;

	m_iconatlasManager->SetCursor(iconx, icony);
	m_iconatlasManager->SetScale(iconr);
	m_iconatlasManager->DrawAtlasImage(m_texRectGeom, "freecash");

    for (unsigned i = 0; i < sizeof(m_storeButtons) / sizeof(ButtonUI); i++)
        m_storeButtons[i].Draw();

    
    if (m_freeCashScaleDirection)
    {
        m_freeCashScale -= (float)Engine::Instance().GetFrameDelta()*0.50f;
        if (m_freeCashScale <= .90f)
            m_freeCashScaleDirection = false;
    }
    else
    {
        m_freeCashScale += (float)Engine::Instance().GetFrameDelta()*0.50f;
        if (m_freeCashScale >= 1.0f)
            m_freeCashScaleDirection = true;
    }

    if (m_currentTransaction >= 0)
    {
        m_trasactionTimer -= Engine::Instance().GetFrameDelta();
        if (m_trasactionTimer <= 0.0f)
        {
            m_storeButtons[1].SetEnabled(true);
        }
    }

	return false;
}

void Quadris::StoreTouchState()
{
    auto point = Engine::Instance().GetTouchPoint();

    for (unsigned i = 0; i < sizeof(m_storeButtons) / sizeof(ButtonUI); i++)
        m_storeButtons[i].Touch(point.X, point.Y);


    //if 

}

void Quadris::StoreStateStart()
{
	Engine::Instance().ClearOnTouchHandlers();
	m_states.CurrentState().UserFlags = 0;

	m_states.PushState(std::bind(&Quadris::StoreState, this),
		StateStack::State::InitFunctor([this](SSState& thiz)
	{
		Engine::Instance().LogInformation("Entering StoreState");
		Engine::Instance().ClearOnTouchHandlers();
		Engine::Instance().AddOnTouchHandle(
			std::bind(&Quadris::StoreTouchState, this));
		Engine::Instance().GetRenderer()->ClearColor(1.0f, 1.0f, 1.0f);
		m_storeIdx = 0;
        thiz.UserFlags = 0xA6;
        m_currentTransaction = -1;
        m_storeButtons[1].SetEnabled(false);
	}));
}

bool Quadris::LoadButtons()
{
	m_mainScreenButtons[0] = ButtonUI(ButtonUI::ROWS3, m_titleFont.Height()*1.3f);
	m_mainScreenButtons[0].SetText(Engine::Instance().GetStringManager().ReturnString("playButton"));
	auto playfunc = std::bind(&Quadris::StartGamePlayState, this);
	m_mainScreenButtons[0].AddTouchHandler(playfunc);

	m_mainScreenButtons[1] = ButtonUI(ButtonUI::ROWS3, m_mainScreenButtons[0]);
	m_mainScreenButtons[1].SetText(Engine::Instance().GetStringManager().ReturnString("buyButton"));
	auto storefunc = std::bind(&Quadris::StoreStateStart, this);
	m_mainScreenButtons[1].AddTouchHandler(storefunc);

	m_mainScreenButtons[2] = ButtonUI(ButtonUI::ROWS3, m_mainScreenButtons[1]);
	m_mainScreenButtons[2].SetText(Engine::Instance().GetStringManager().ReturnString("achivButton"));


	m_pauseButtons[0] = ButtonUI(ButtonUI::ROWS3, Engine::Instance().GetWindowSize().H*0.5f);
	m_pauseButtons[0].SetText(Engine::Instance().GetStringManager().ReturnString("quitButton"));
	m_pauseButtons[0].TextColor(Color32(0, 0, 0));
	m_pauseButtons[0].AddTouchHandler([this]{
		m_states.PopState();
		m_states.PopState();
	});

	m_pauseButtons[1] = ButtonUI(ButtonUI::ROWS3, m_pauseButtons[0]);
	m_pauseButtons[1].SetText(Engine::Instance().GetStringManager().ReturnString("buyButton"));
	m_pauseButtons[1].TextColor(Color32(0, 0, 0));
	m_pauseButtons[1].AddTouchHandler(storefunc);

	m_pauseButtons[2] = ButtonUI(ButtonUI::ROWS3, m_pauseButtons[1]);
	m_pauseButtons[2].SetText(Engine::Instance().GetStringManager().ReturnString("freeMoney"));
	m_pauseButtons[2].TextColor(Color32(0, 0, 0));

	for (uint32_t i = 0; i < 9; i++)
	{
		if (i == 0)
			m_levelSelectionButtons[i] = ButtonUI(ButtonUI::GRID3X3, 0.0f);
		else
			m_levelSelectionButtons[i] = ButtonUI(ButtonUI::GRID3X3, m_levelSelectionButtons[i-1]);

		std::stringstream str;
		if (i != 8)
		{
			str << m_levelManager.GetLevel(i).ExpectedLevel << " - " 
				<< m_levelManager.GetLevel(i).LevelTitle;
			m_levelSelectionButtons[i].SetText(str.str());
		}
		else
			m_levelSelectionButtons[i].SetText(m_levelManager.GetLevel(i).LevelTitle);	

		if (!(m_levelManager.GetLockFlags() & (1 << i)))
			m_levelSelectionButtons[i].SetEnabled(false);

		m_levelSelectionButtons[i].TextColor(Color32(0, 0, 0));
		auto func = std::bind(&Quadris::LevelSelectionButton,this, i);
		m_levelSelectionButtons[i].AddTouchHandler(func);
	}

    m_storeButtons[0] = ButtonUI(ButtonUI::ROWS3, Engine::Instance().GetWindowSize().H*.60f);
    m_storeButtons[0].SetText(Engine::Instance().GetStringManager().ReturnString("buyButton"));
    m_storeButtons[0].TextColor(Color32(0, 0, 0));
    auto buyitem = std::bind(&Quadris::BuyCurrentItem, this);
    m_storeButtons[0].AddTouchHandler(buyitem);

    m_storeButtons[1] = ButtonUI(ButtonUI::ROWS3, m_storeButtons[0]);
    m_storeButtons[1].SetText(Engine::Instance().GetStringManager().ReturnString("buyConfirmButton"));
    m_storeButtons[1].SetEnabled(false);
    m_storeButtons[1].TextColor(Color32(0, 0, 0));
    auto confirmpurch = std::bind(&Quadris::ConfirmPurchase, this);
    m_storeButtons[1].AddTouchHandler(confirmpurch);

	return true;
}

void Quadris::LevelSelectionButton(uint32_t level)
{
	  Engine::Instance()
	.AddBeforeRenderTask([this,level]
	{
		Engine::Instance().ClearOnTouchHandlers();
		m_states.CurrentState().UserFlags = 0;

		if (!m_startLevelFirstTime)
		{
			m_stopPlay = false;
			CleanBoard();
		}


		auto state = std::bind(&Quadris::GamePlayState, this);
		auto init = std::bind(&Quadris::GamePlayStateInit, this
			, std::placeholders::_1);

		auto&playstate = m_states.PushState(state, init);
		playstate.UserFlags = 0xA5;

		//m_states.PushState(std::bind(&Quadris::PauseScreen, this)
		//, std::bind(&Quadris::PauseInit, this,std::placeholders::_1));

		m_startLevelFirstTime = false;
		m_expectedLevel = m_levelManager.GetLevel(level).ExpectedLevel;
		m_expectedLevelIdx = level;
		return true;
	});
}

void Quadris::ClearCurrentGameFigure()
{
	m_quadManager.ClearFloating();

	for (int r = 0; r < AI::PREDICTION_BRANCHES; r++)
	{
		if (m_validResults[r])
		{
			for (int i = 0; i < 4; i++)
				m_quadManager.SetInactive(m_currentResults[r][i].X,
				m_currentResults[r][i].Y);
		}
	}
}

bool Quadris::LoadStore()
{
	m_achievementManager.Load();
	m_storeManager.Generate(m_achievementManager);
	return true;
}

bool Quadris::DrawAchievement(AchievementManager::Achievement * achiv, ADrawPtr ptr)
{
	auto size = Engine::Instance().GetWindowSize();
	float fh = m_mainFont.Height();
	float fw = m_mainFont.StringWidth(achiv->Name);
	float hh = fh * 1.35f;
	float ww = fw * 1.25f;

	Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f, ptr->LeftTime);

	m_iconatlasManager->SetCursor(size.W - ww, size.H - hh);
	m_iconatlasManager->SetScale(ww, hh);
	m_iconatlasManager->DrawAtlasImage(m_texRectGeom, "achivframe");

	m_mainFont.SetCursor(size.W - ww + fw*0.1f
		, size.H - hh + fh);

	m_mainFont.DrawString(achiv->Name);
	Engine::Instance().GetRenderer()->BlendColor(1.0f, 1.0f, 1.0f, 1.0f);

	if (ptr->LeftTime <= 0.0f)
		return true;
	
	ptr->LeftTime -= (float)(Engine::Instance().GetFrameDelta()/2.0);

	return false;
}

void Quadris::RewardLevel()
{
	auto level = m_levelManager.GetLevel(m_expectedLevelIdx);
	uint32_t lkflags = m_levelManager.GetLockFlags();
	lkflags |= 1 << (m_expectedLevelIdx + 1);
	m_levelManager.SetUnlockFlags(lkflags);

	if (!m_achievementManager.IsWon(level.Achievement))
	{
		m_achievementManager.SetWon(level.Achievement);

		Engine::Instance().AddRenderTask(std::bind(&Quadris::DrawAchievement, 
		this, level.Achievement, ADrawPtr(new AchivDraw)));
	}

	m_money = m_money + level.MoneyReward;
	m_saveManager.SaveGame(this);
}

void Quadris::MainInterfaceRenderBackground()
{
	if (m_texRectGeom && m_storeBackground)
	{
		auto size = Engine::Instance().GetWindowSize();
		auto scale = glm::scale(glm::vec3(size.W, size.H, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&scale[0][0]);

		float tx, ty, sx, sy;

		if (size.W > size.H)
		{
			float rat = size.H / size.W;
			float pos = (1 - rat) / 2.0f;
			tx = 0.0f;
			ty = pos;
			sx = 1.0f;
			sy = rat;
		}
		else
		{
			float rat = size.W / size.H;
			float pos = (1 - rat) / 2.0f;
			tx = pos;
			ty = 0.0f;
			sx = rat;
			sy = 1.0f;
		}

		auto texscale = glm::translate(glm::vec3(tx, ty, 0.0f));
		texscale = glm::scale(texscale, glm::vec3(sx, sy, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceTextureMatrix(&texscale[0][0]);

		m_storeBackground->Bind();
		Engine::Instance().GetRenderer()->RenderGeometry(m_texRectGeom);
	}
}

void Quadris::PowerSent(PowerManager::Power p)
{
	if (m_stopPlay)
		return;

	uint32_t cost = m_powerManager.GetPowerCost(p);
	switch (p)
	{
	case PowerManager::LINESTREAK:
		if (m_money >= cost)
		{

		}
		break;
	case PowerManager::LEVELUP:
		cost *= m_currentLevel;

		if (m_money >= cost)
		{
			m_money = m_money - cost;
			IncreaseLevel();
			m_saveManager.SaveGame(this);
		}
		break;
	case PowerManager::POWER3:
		break;
	case PowerManager::POWER4:
		break;
	case PowerManager::POWER5:
		break;
	case PowerManager::POWER6:
		break;
	case PowerManager::POWER7:
		break;
	case PowerManager::POWER8:
		break;
	case PowerManager::POWER9:
		break;
	case PowerManager::POWER_COUNT:
		break;
	default:
		break;
	}
}

void Quadris::IncreaseLevel()
{
	m_currentLevel++;
	m_levelRatio =
		(double)GameConstants::LEVEL_RATIO_NUM
		/ (double)GameConstants::LEVEL_RATIO_DEN
		/ ((double)m_currentLevel*(double)m_currentLevel);
	m_levelDescreaseRatio += (double)m_currentLevel * 0.0001;
}

void Quadris::BuyCurrentItem()
{
    uint32_t price = m_storeManager.GetItemList()[m_storeIdx].Price;
    
    if ((uint32_t)m_money >= price)
    {
        m_currentTransaction = m_storeIdx;
        m_trasactionTimer = 2.0f;
        m_storeButtons[0].SetEnabled(false);
    }
    
}

void Quadris::ConfirmPurchase()
{
    uint32_t price = m_storeManager.GetItemList()[m_storeIdx].Price;

    if ((uint32_t)m_money >= price)
    {
        m_storeButtons[1].SetEnabled(false);

        m_money = m_money - price;
        m_storeManager.Unlock(m_storeIdx);
    }
}