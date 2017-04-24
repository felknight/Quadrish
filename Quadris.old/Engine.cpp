#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <string>
#include <thread>
#include <cassert>
#include <cstring>

#ifdef _WIN32
#define GLEW_STATIC
#include <GL\glew.h>
#else
#include <GLES/gl.h>
#endif

#include "Engine.h"
#include "Image.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif


std::thread*		g_AsyncInitThread;
Engine*				Engine::s_Instance = 0;




Engine::Engine()
: m_20Ready(false)
, m_asynInitStage(0)
, m_renderer(0)
, m_isClosing(false)
{
	EarlyInit();
	m_lastTime = m_clock.now();
}


Engine::~Engine()
{
	if (m_renderer)
		delete m_renderer;	
}

bool Engine::MainLoop()
{	
	if (Engine::Instance().IsClosing())
		return false;
	
	auto diff = m_clock.now() - m_lastTime;
	double num = Duration::period::num;
	double den = Duration::period::den;
	double frac = num / den;
	m_lastTime = m_clock.now();
	auto unittimes = diff.count();
	m_fps = 1.0/((double)unittimes*frac);

	for (TaskListI it = m_BeforeRenderTaskList.begin();
		it != m_BeforeRenderTaskList.end();)
	{
		auto task = *it;
		if (task())
			it = m_BeforeRenderTaskList.erase(it);
		else
			++it;
	}	

	glClear(GL_COLOR_BUFFER_BIT);		

	for (TaskListI it = m_RenderTaskList.begin();
		it != m_RenderTaskList.end();)
	{
		auto task = *it;
		if (task())
			it = m_RenderTaskList.erase(it);
		else
			++it;
	}

	for (TaskListI it = m_AfterRenderTaskList.begin();
		it != m_AfterRenderTaskList.end();)
	{
		auto task = *it;
		if (task())
			it = m_AfterRenderTaskList.erase(it);
		else
			++it;
	}
	
	return true;
}

void Engine::PrepareLoad(TaskList& loadtasks)
{
	LogInformation("Game started with size %d x %d",
		(int)m_WindowSize.W, (int)m_WindowSize.H);

	m_OpenGLVendor = glGetString(GL_VENDOR);
	m_OpenGLDriver = glGetString(GL_RENDERER);
	m_OpenGLVersion = glGetString(GL_VERSION);
	m_OpenGLExtensions = glGetString(GL_EXTENSIONS);

	glGetIntegerv(GL_MAX_TEXTURE_SIZE, &m_maxTextureSize);
	

	Engine::Instance().LogInformation("Context using Vendor: %s",m_OpenGLVendor);
	Engine::Instance().LogInformation("Context using Renderer: %s", m_OpenGLDriver);
	Engine::Instance().LogInformation("Context using Version: %s", m_OpenGLVersion);
	Engine::Instance().LogInformation("Context using Extension: %s", m_OpenGLExtensions);

	AddRenderTask(std::bind(&Engine::InitStageOne, this));

    m_asynInitStage = 0;
	g_AsyncInitThread = new std::thread(&Engine::AsyncInit, this, 
		std::ref(loadtasks));
}

void Engine::AsyncInit(TaskList& loadtasks)
{
	const char* version = strchr((const char*)m_OpenGLVersion, (int)'.');
	version--;
	if (*version > '2')
	{
		Engine::Instance().LogInformation("Using OpenGl ES 2.0");
		m_20Ready = true;
	}
		
	m_asynInitStage = 1;

	while (!loadtasks.empty())
	{
		for (TaskListI it = loadtasks.begin();
			it != loadtasks.end();)
		{
			auto task = *it;
			if (task())
				it = loadtasks.erase(it);
			else
				++it;
		}
	}

	m_asynInitStage = 2;
}

bool Engine::InitStageOne()
{
	if (m_asynInitStage >= 1)
	{
		if (m_renderer == nullptr)
		{
			if (m_20Ready)
				m_renderer = new FixedPipeline();
			else
				m_renderer = new FixedPipeline();

			m_renderer->Init();

			AddAfterRenderTask(std::bind(&Engine::InitStageTwo, this));
		}

		if (m_asynInitStage == 1 || m_asynInitStage == 2)
		{
			if (m_loadingRender)
				m_loadingRender();
			return false;
		}
		return true;
	}

	

	return false;
}

bool Engine::InitStageTwo()
{
	if (m_asynInitStage >= 2)
	{
		for (HandlerListI it = m_onLoadHandlers.begin();
			it != m_onLoadHandlers.end(); ++it)
			(*it)();

        m_onLoadHandlers.clear();
		m_asynInitStage = 3;

        g_AsyncInitThread->join();
        delete g_AsyncInitThread;
        g_AsyncInitThread = 0;

		return true;
	}
	return false;
}

void Engine::ReloadContex()
{
    //Invalidate renderer since context changed
    delete m_renderer;
    m_renderer = nullptr;

	for (HandlerListI it = m_onReloadHandlers.begin();
		it != m_onReloadHandlers.end(); ++it)
		(*it)();
}

void Engine::SendTouch(int x, int y)
{
	m_touchPoint.X = x;
	m_touchPoint.Y = y;

	for (HandlerListI it = m_onTouchHandlers.begin();
		it != m_onTouchHandlers.end(); ++it)
		(*it)();

	
}

bool Engine::SendBack()
{
    bool res = false;
    for (TaskListI it = m_onBackHandlers.begin();
        it != m_onBackHandlers.end(); ++it)
    {
        res |= (*it)();
    }

    return res;
}

void Engine::SendSwipe(SwipeDirection dir)
{
    m_swipeDirection = dir;
    for (HandlerListI it = m_onSwipeHandlers.begin();
        it != m_onSwipeHandlers.end(); ++it)
        (*it)();
}

void Engine::SetWindowSize(const Size& s)
{
    m_WindowSize = s;
    glViewport(0, 0, (GLsizei)s.W, (GLsizei)s.H);
}

void Engine::Close()
{
	m_isClosing = true;
	NativeClose();
	for (WaitThreadsListI it = m_waitingThreads.begin();
		it != m_waitingThreads.end(); ++it)
			(*it)->join();
}

GemeotryPointer::~GemeotryPointer()
{
    if (glBufferVertex > 0)
        glDeleteBuffers(1, &glBufferVertex);

    if (glBufferIndices > 0)
        glDeleteBuffers(1, &glBufferIndices);
}
