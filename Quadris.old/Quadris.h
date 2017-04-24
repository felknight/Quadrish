#pragma once

#ifndef QUADRIS_H
#define QUADRIS_H

#include <map>
#include <array>
#include <mutex>

#include "GameConstants.hpp"
#include "Math.hpp"
#include "Engine.h"
#include "Quad.h"
#include "ColorManager.h"
#include "QuadManager.h"
#include "AI.h"
#include "Font.h"
#include "StateStack.h"
#include "LevelManager.h"
#include "Atlas.h"
#include "SecureMemory.h"
#include "SaveManager.h"
#include "ButtonUI.h"
#include "PowerManager.h"

//TODO: On pause sleep the main thread

class QuadManager;
class Image;

class Quadris
{
public:
	friend class SaveManager;

//Constants
	static const int BOARD_WIDTH = GameConstants::BOARD_WIDTH;
	static const int BOARD_HEIGHT = GameConstants::BOARD_HEIGHT;

//Types
	class AchivDraw
	{
	public:
		float LeftTime;

		AchivDraw()
			:LeftTime(1.0f)
		{

		}
	};

    typedef std::poisson_distribution<uint32_t>		PoissonDist;
	typedef std::uniform_int_distribution<uint32_t> UniformIntDist;
	typedef std::shared_ptr<AchivDraw>				ADrawPtr;

//Constructor
	Quadris();
	~Quadris();
//Instance Management
	static void AssignInstance(Quadris* s)
	{
		s_Instance = s;
	}
	static Quadris& Instance()
	{
		return *s_Instance;
	}
//Member access
	QuadManager* GetQuadManager()
	{
		return &m_quadManager;
	}

	SaveManager& GetSaveManager()
	{
		return m_saveManager;
	}
//Game methods
	void Start();
	void Clean();
private:
//Game logic methods
	SPoint			ScreenToPoint(SPoint point);
	void			ClearAICells(int idx);
	bool			CheckForAI();
    void            CheckLines();
	GameColorSet	ColorForAIFloating(int idx);
	GameColorSet	ColorForAICell(int idx);
	GameColorSet	ColorCellToFloating(GameColorSet);
	bool			CheckTouchOnQuad();
	void			CreateAICells();
	void			CopyAIResults();
	void			FloatArrived(QuadManager::FloatingQuad & f);
    void            LinesFilled(uint32_t n);
    void            GetNewFigure();
	void			ClearCurrentGameFigure();
	bool			DrawAchievement(AchievementManager::Achievement *, ADrawPtr);
	void			RewardLevel();
	void			MainInterfaceRenderBackground();
	void			PowerSent(PowerManager::Power);
	void			IncreaseLevel();
    void            BuyCurrentItem();
    void            ConfirmPurchase();
//Loading methods
	bool LoadSquareColors();
	bool LoadRasterFonts();
	bool LoadSave();
	void LoadingAnimation();
	void ReloadAll();
	void BuildAllGeometry();
	void StartAI();
    void BuildStateStack();
	bool LoadButtons();
	bool LoadStore();
//Game events
    void MainScreenTouch();
    void LevelSelectionTouch();
	void TouchEvent();
    bool BackEvent();
    void CleanBoard();
    void SwipeEvent();
	void LevelSelectionButton(uint32_t level);
//Game render
	bool RenderBoardBackground();
	bool TestRender();
    bool StateRender();
//Game states
    bool MainScreen();
    bool TestInitScreen();
    bool BackState();
    bool GamePlayState();
    void GamePlayStateInit(SSState&);
    bool PauseScreen();
    void PauseInit(SSState&);
    bool LoseState();
	void StartGamePlayState();
	bool StoreState();
	void StoreTouchState();
	void StoreStateStart();


	static Quadris*				s_Instance;
	Engine::TaskList			m_LoadList;
	Model2D						m_square;
	GemeotryPointer*			m_squareGeom;
	QuadManager					m_quadManager;
	SizeOffsetPointer*			m_colorGameColorSet;
	Image*						m_background;
	Image*						m_mainScreenBackground;
	Image*						m_storeBackground;
	Model2D 					m_texRect;
	GemeotryPointer*			m_texRectGeom;
	AI							m_ai;
	bool						m_quitOnReload;
	bool						m_hasRenderTasks;
	bool						m_requestAI;
	SPoint						m_currentResults[AI::PREDICTION_BRANCHES][4];
    QuadKind                    m_currentKind;
    bool						m_validResults[AI::PREDICTION_BRANCHES];
	ColorManager				m_color;
	bool						m_falling;
	bool						m_alreadyCleared;
	Font						m_mainFont;
	Font						m_titleFont;
	std::string					m_debugTxt;
	int							m_debugCounterRefresh;
	int							m_resultBelong;
    int                         m_squareColorsLoadPhase;
    bool                        m_coloredMatrix;
    StateStack                  m_states;
	AchievementManager			m_achievementManager;
    LevelManager                m_levelManager;
	StoreItemManager			m_storeManager;
    bool                        m_aiStarted;
    bool                        m_startLevelFirstTime;
    Atlas*						m_iconatlasManager;
    Font						m_floatingFont;
    SecureMemory<uint32_t>      m_money;
    bool                        m_firstseed;
    std::ranlux24               m_randEngine;
    PoissonDist                 m_poissonDist;
    Model2D						m_colorSquare;
    GemeotryPointer*			m_colorSquareGeom;
    double                      m_curLevel;
    double                      m_levelRatio;
    double                      m_levelDescreaseRatio;
    SecureMemory<uint32_t>      m_currentLevel;
    SecureMemory<uint32_t>      m_lineStreak;
    bool                        m_savedFigure;
    QuadKind                    m_savedKind;
	bool						m_turnChange; 
	SaveManager					m_saveManager;
	UniformIntDist				m_uniformDist;
	ButtonUI					m_mainScreenButtons[3];
	ButtonUI					m_levelSelectionButtons[9];
	ButtonUI					m_pauseButtons[3];
    ButtonUI					m_storeButtons[2];
	uint32_t					m_expectedLevel;
	uint32_t					m_expectedLevelIdx;
	bool						m_stopPlay;
	PowerManager				m_powerManager;
	uint32_t					m_storeIdx;
    float                       m_freeCashScale;
    bool                        m_freeCashScaleDirection;
    double                      m_trasactionTimer;
    int32_t                     m_currentTransaction;
	
};

#endif

