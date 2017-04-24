#include <iostream>
#include <dlfcn.h>

#include "LibSymbols.h"

#define LIBNAME "liblinuxgame.so"

ANDROID_MAIN_FUNC 	s_AndroidMain;
LOOP_FUNC 		 	s_Loop;
TOUCH_FUNC 		 	s_Touch;
BACK_FUNC			s_Back;
SURFACE_LOST_FUNC   s_SurfaceLost;
CLOSE_FUNC		    s_CloseFunc;

void g_LoadLibrary()
{
	using namespace std;

	cout << "Loading " << LIBNAME << "..." << endl;
	void* handle = dlopen(LIBNAME,RTLD_NOW);
	if (!handle)
	{
		cerr << "Loading failed: " << dlerror() << endl;
		exit(1);
	}
	else
	{
		cout << "Loaded correctly " << endl;

		cout << "Solving... " << ANDROID_MAIN  << endl;
		s_AndroidMain = (ANDROID_MAIN_FUNC)dlsym(handle,ANDROID_MAIN);
		if (!s_AndroidMain)
		{
			cout << ANDROID_MAIN << " not found" << endl;
			exit(2);
		}

		cout << "Solving... " << LOOP  << endl;
		s_Loop = (LOOP_FUNC)dlsym(handle,LOOP);
		if (!s_Loop)
		{
			cout << LOOP << " not found" << endl;
			exit(2);
		}

		cout << "Solving... " << TOUCH  << endl;
		s_Touch = (TOUCH_FUNC)dlsym(handle,TOUCH);
		if (!s_Touch)
		{
			cout << TOUCH << " not found" << endl;
			exit(2);
		}

		cout << "Solving... " << BACK  << endl;
		s_Back = (BACK_FUNC)dlsym(handle,BACK);
		if (!s_Back)
		{
			cout << BACK << " not found" << endl;
			exit(2);
		}

		cout << "Solving... " << SURFACE_LOST  << endl;
		s_SurfaceLost = (SURFACE_LOST_FUNC)dlsym(handle,SURFACE_LOST);
		if (!s_SurfaceLost)
		{
			cout << SURFACE_LOST << " not found" << endl;
			exit(2);
		}

		cout << "Solving... " << CLOSE  << endl;
		s_CloseFunc = (CLOSE_FUNC)dlsym(handle,CLOSE);
		if (!s_CloseFunc)
		{
			cout << CLOSE << " not found" << endl;
			exit(2);
		}


	}
}
