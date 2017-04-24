#pragma once

#ifndef ENGINE_H
#define ENGINE_H

#include <stddef.h>
#include <stdint.h>
#include <list>
#include <functional>
#include <unordered_map>
#include <cstdarg>
#include <chrono>
#include <thread>

#include "Math.hpp"
#include "Renderer.h"
#include "FixedPipeline.h"
#include "Model2D.h"
#include "StringManager.h"

class SimpleGeometry;

class Engine
{
public:
//Type definitions
	typedef std::function<bool()> TaskCallback;
	typedef std::list <TaskCallback> TaskList;
	typedef TaskList::iterator    TaskListI;

	typedef std::function<void()> HandlerCallback;
	typedef std::list <HandlerCallback> HandlerList;
	typedef HandlerList::iterator    HandlerListI;

	typedef std::list <std::thread*>	WaitThreadsList;
	typedef WaitThreadsList::iterator   WaitThreadsListI;

	typedef std::chrono::high_resolution_clock HighResClock;	
	typedef std::chrono::high_resolution_clock::duration Duration;
	typedef std::chrono::high_resolution_clock::time_point Time;
//Constructor/Destructor
	Engine();
	~Engine();

//Instance Management
	static void AssignInstance(Engine* s)
	{
		s_Instance = s;
	}
	static Engine& Instance()
	{
		return *s_Instance;
	}
	static bool HasInstance()
	{
		return s_Instance != nullptr;
	}

//Member access
	StringManager& GetStringManager()
	{
		return m_stringManager;
	}
	VertexRenderer* GetRenderer()
	{
		return m_renderer;
	}
	bool EngineVersion20()
	{
		return m_20Ready;
	}
	int MaxTextureSize()
	{
		return m_maxTextureSize;
	}
	double LastMeasureFPS()
	{
		return m_fps;
	}

	double AverageFPS()
	{
		return m_normalAverageFPS;
	}
	bool IsClosing()
	{
		return m_isClosing;
	}

//Tasks and loading
	void AddAfterRenderTask(TaskCallback callback)
	{
		m_AfterRenderTaskList.push_back(callback);
	}
	void AddBeforeRenderTask(TaskCallback callback)
	{
		m_BeforeRenderTaskList.push_back(callback);
	}
	void AddRenderTask(TaskCallback callback)
	{
		m_RenderTaskList.push_back(callback);
	}
	void PrepareLoad(TaskList& loadtasks);
	void SetLoadingRender(HandlerCallback render)
	{
		m_loadingRender = render;
	}
	void AddWaitThread(std::thread* thread)
	{
		m_waitingThreads.push_back(thread);
	}
//Logging
#ifdef _LOGGING
	void LogInformation(const char* string, ...);
	void LogWarning(const char* string, ...);
	void LogError(const char* string, ...);
	void LogError(const char* string, va_list);
#else
	void LogInformation(const char* string, ...){}
	void LogWarning(const char* string, ...){}
	void LogError(const char* string, ...){}
	void LogError(const char* string, va_list){}
#endif

//Files
	enum class FileSeekPos
	{
		CUR
		,START
		,END
	};
	struct FileDescriptor;
	static FileDescriptor* OpenFileBinary(const char* file);
	static size_t ReadFile(FileDescriptor* f, size_t unit, size_t count, void* buffer);
	static size_t FileSeek(FileDescriptor* f, size_t offset, FileSeekPos pos = FileSeekPos::END);
	static size_t FileSize(FileDescriptor* f);
	static void CloseFile(FileDescriptor*);

//Window
	void Close();
	void NativeClose();
	void ReloadContex();
	bool MainLoop();
	void SendTouch(int x, int y);
    bool SendBack();
    void SetWindowSize(const Size& s);

    enum SwipeDirection
    {
        LEFTTORIGHT
        ,RIGHTTOLEFT
    };
    void SendSwipe(SwipeDirection);
    SwipeDirection GetSwipeDirection()
    {
        return m_swipeDirection;
    }
//Window Inlines
	void AddOnLoadHandle(HandlerCallback callback)
	{
		m_onLoadHandlers.push_back(callback);
	}
	void AddOnTouchHandle(HandlerCallback callback)
	{
		m_onTouchHandlers.push_back(callback);
	}
    void ClearOnTouchHandlers()
    {
        m_onTouchHandlers.clear();
    }
    void AddOnBackHandle(TaskCallback callback)
    {
        m_onBackHandlers.push_back(callback);
    }
	void AddOnReloadHandle(HandlerCallback callback)
	{
		m_onReloadHandlers.push_back(callback);
	}
    void AddOnSwipeHandle(HandlerCallback callback)
    {
        m_onSwipeHandlers.push_back(callback);
    }
	SPoint GetTouchPoint()
	{
		return m_touchPoint;
	}
	const Size& GetWindowSize()
	{
		return m_WindowSize;
	}
    double GetFrameDelta()
    {
        return 1.0 / m_fps;
    }
	
//Misc
	void UserError(const char* error, ...)
	{
		va_list ap;
		va_start(ap, error);
		LogError(error, ap);
	}
private:
	void EarlyInit();

	void AsyncInit(TaskList&);
	bool InitStageOne();
	bool InitStageTwo();

private:
//General
	static Engine*			s_Instance;
	int						m_asynInitStage;
	VertexRenderer*			m_renderer;
	StringManager			m_stringManager;
	bool					m_isClosing;
	WaitThreadsList			m_waitingThreads;
//Window
	Size					m_WindowSize;
	TaskList				m_AfterRenderTaskList;
	TaskList				m_BeforeRenderTaskList;
	TaskList				m_RenderTaskList;
	HandlerList				m_onLoadHandlers;
	HandlerList				m_onReloadHandlers;
	HandlerList				m_onTouchHandlers;
    HandlerList				m_onSwipeHandlers;
    TaskList			    m_onBackHandlers;
	HandlerCallback			m_loadingRender;
	SPoint					m_touchPoint;
    SwipeDirection          m_swipeDirection;
//OpenGL Context
	const unsigned char*	m_OpenGLVendor;
	const unsigned char*	m_OpenGLDriver;
	const unsigned char*	m_OpenGLVersion;
	const unsigned char*	m_OpenGLExtensions;
	bool					m_20Ready;
	int						m_maxTextureSize;
//Performance
	double					m_fps;
	double					m_normalAverageFPS;
	Time					m_lastTime;
	HighResClock			m_clock;

};

#define GET_STRING(X) Engine::Instance().GetStringManager().ReturnString(X)
#define GET_CSTRING(X) GET_STRING(X).c_str()

#endif //ENGINE_H
