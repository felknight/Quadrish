
#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#define GLFW_INCLUDE_NONE
#define GLEW_STATIC
#include <GLFW\glfw3.h>
#include <GL/glew.h>
#include <assert.h>
#include <thread>

#include "Engine.h"
#include "Quadris.h"

#include <crtdbg.h>

#ifdef _WIN32
#include <crtdbg.h>
#endif


#if defined(_DEBUG)
extern "C" __declspec(dllimport)
unsigned long __stdcall GetCurrentThreadId(void);
void SetThreadName(DWORD dwThreadID, char* threadName);
#endif

#ifdef _DEBUG
extern const QuadSquare*  g_renderedMatrix;
#endif

extern GLFWwindow*	eg_GLFWWindow;
bool				g_MarkForDestroy = false;
GLFWwindow*			g_MarkForDestroyW = nullptr;
bool				g_reasignContex = false;
bool				g_touchSent = false;
bool                g_emulClose = false;
bool				g_portrait = true;

void g_CreateWindow();

void g_LostContextTest(GLFWwindow* w, int action)
{
	if (action == GL_TRUE)
	{
		g_portrait = !g_portrait;
		g_CreateWindow();
		g_MarkForDestroyW = w;
		g_MarkForDestroy = true;
		g_reasignContex = true;
	}
}

void g_MousePressed(GLFWwindow* w, int, int action, int)
{
	double x, y;
	glfwGetCursorPos(w, &x, &y);

	if (action == GLFW_PRESS && !g_touchSent)
	{
		Engine::Instance().SendTouch((int)x, (int)y);
		g_touchSent = true;
	}

	if (action == GLFW_RELEASE)
		g_touchSent = false;
}

void g_KeyPressed(GLFWwindow* win, int key, int scan, int action, int mod)
{
    if (key == GLFW_KEY_BACKSPACE && action == GLFW_RELEASE)
    {
        if (!Engine::Instance().SendBack())
        {
            g_emulClose = true;
        }
    }

    if (key == GLFW_KEY_LEFT && action == GLFW_RELEASE)
        Engine::Instance().SendSwipe(Engine::RIGHTTOLEFT);

    if (key == GLFW_KEY_RIGHT && action == GLFW_RELEASE)
        Engine::Instance().SendSwipe(Engine::LEFTTORIGHT);
}

void g_CreateWindow()
{
	glfwInit();
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 1);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
	//glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);

	if (g_portrait)
	{
		eg_GLFWWindow = glfwCreateWindow(300, 600, "Quadris", NULL, NULL);
		Engine::Instance().SetWindowSize(Size((float)300, (float)600));
	}
	else
	{
		eg_GLFWWindow = glfwCreateWindow(900, 540, "Quadris", NULL, NULL);
		Engine::Instance().SetWindowSize(Size((float)900, (float)540));
	}
		

	assert(eg_GLFWWindow);

	glfwSetWindowIconifyCallback(eg_GLFWWindow, g_LostContextTest);
	glfwSetMouseButtonCallback(eg_GLFWWindow, g_MousePressed);
    glfwSetKeyCallback(eg_GLFWWindow, g_KeyPressed);
}

int __stdcall WinMain(void*, void*, const char*, int)
{
	//_crtBreakAlloc = 2625;
	auto se = new Engine;
	Engine::AssignInstance(se);

	auto sq = new Quadris;
	Quadris::AssignInstance(sq);

	g_CreateWindow();

	std::thread renderThread([]()
	{
#ifdef _DEBUG
		unsigned long id = GetCurrentThreadId();
		SetThreadName(id, "Render thread");
#endif
		glfwMakeContextCurrent(eg_GLFWWindow);
		glewExperimental = true;
		glewInit();
		Quadris::Instance().Start();
		while (true)
		{
			if (!Engine::Instance().MainLoop())
				break;
			glfwSwapBuffers(eg_GLFWWindow);
			if (g_reasignContex)
			{
				glfwMakeContextCurrent(eg_GLFWWindow);
				Engine::Instance().ReloadContex();
				g_reasignContex = false;
			}
		}
	});

	while (true)
	{
        if (glfwWindowShouldClose(eg_GLFWWindow) || g_emulClose)
			break;

		glfwWaitEvents();
		if (g_MarkForDestroy)
		{
			glfwDestroyWindow(g_MarkForDestroyW);
			g_MarkForDestroy = false;
		}
	}
#ifdef _DEBUG
    g_renderedMatrix = nullptr;
#endif

	Engine::Instance().Close();

	renderThread.join();

	delete sq;
	delete se;
	
	glfwTerminate();


    _CrtDumpMemoryLeaks();

	return 0;
}

#ifdef _DEBUG
//
// Usage: SetThreadName (-1, "MainThread");
//
const DWORD MS_VC_EXCEPTION = 0x406D1388;
typedef const char* LPCSTR;

extern "C" __declspec(dllimport)
void __stdcall
RaiseException(
DWORD dwExceptionCode,
DWORD dwExceptionFlags,
DWORD nNumberOfArguments,
const unsigned long * lpArguments
);

#pragma pack(push,8)
typedef struct tagTHREADNAME_INFO
{
	DWORD dwType; // Must be 0x1000.
	LPCSTR szName; // Pointer to name (in user addr space).
	DWORD dwThreadID; // Thread ID (-1=caller thread).
	DWORD dwFlags; // Reserved for future use, must be zero.
} THREADNAME_INFO;
#pragma pack(pop)

void SetThreadName(DWORD dwThreadID, char* threadName)
{
	THREADNAME_INFO info;
	info.dwType = 0x1000;
	info.szName = threadName;
	info.dwThreadID = dwThreadID;
	info.dwFlags = 0;

	__try
	{
		RaiseException(MS_VC_EXCEPTION, 0, sizeof(info) / sizeof(unsigned long)
			, (unsigned long*)&info);
	}
	__except (1)
	{
	}
}

#endif

#endif