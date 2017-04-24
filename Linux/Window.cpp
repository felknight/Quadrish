#define GLFW_INCLUDE_NONE
#define GLEW_STATIC
#include <GLFW/glfw3.h>
#include <GL/glew.h>
#include <assert.h>
#include <thread>

#include "LibSymbols.h"

GLFWwindow*			eg_GLFWWindow;
bool				g_MarkForDestroy = false;
GLFWwindow*			g_MarkForDestroyW = nullptr;
bool				g_reasignContex = false;
bool				g_touchSent = false;
bool                g_emulClose = false;

void g_CreateWindow();
void g_LoadLibrary();

void g_LostContextTest(GLFWwindow* w, int action)
{
	if (action == GL_TRUE)
	{
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
		s_Touch(NULL,NULL,(int)x,(int)y);
		g_touchSent = true;
	}

	if (action == GLFW_RELEASE)
		g_touchSent = false;


}

void g_KeyPressed(GLFWwindow* win, int key, int scan, int action, int mod)
{
    if (key == GLFW_KEY_BACKSPACE && action == GLFW_RELEASE)
    {
        if (!s_Back(NULL,NULL))
        {
            g_emulClose = true;
        }
    }
}

void g_CreateWindow()
{
	glfwInit();
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 1);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
	glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);

	eg_GLFWWindow = glfwCreateWindow(600, 1000, "Quadris", NULL, NULL);
	assert(eg_GLFWWindow);

	glfwSetWindowIconifyCallback(eg_GLFWWindow, g_LostContextTest);
	glfwSetMouseButtonCallback(eg_GLFWWindow, g_MousePressed);
    glfwSetKeyCallback(eg_GLFWWindow, g_KeyPressed);
}



int main()
{
	g_LoadLibrary();
	g_CreateWindow();


	std::thread renderThread([]()
	{
		glfwMakeContextCurrent(eg_GLFWWindow);
		glewExperimental = true;
		glewInit();
		
		s_AndroidMain(NULL,NULL,600,1000);

		while (true)
		{
			if (glfwWindowShouldClose(eg_GLFWWindow) || g_emulClose)
				break;

			s_Loop(NULL,NULL);

			glfwSwapBuffers(eg_GLFWWindow);
			if (g_reasignContex)
			{
				glfwMakeContextCurrent(eg_GLFWWindow);
				s_SurfaceLost(NULL,NULL);
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
	s_CloseFunc(NULL,NULL);


	renderThread.join();

	return 0;
}
