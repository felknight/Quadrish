#ifdef ANDROID

#include <cstring>

#include "Engine.h"
#include "Quadris.h"

#include <jni.h>

static Engine* g_EngineInstance;
static Quadris* g_QuadrisInstance;

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameSurface_android_1main(JNIEnv * env, jobject obj, jint w, jint h)
{
	g_EngineInstance = new Engine;
	Engine::AssignInstance(g_EngineInstance);

	g_QuadrisInstance = new Quadris;
	Quadris::AssignInstance(g_QuadrisInstance);

	Engine::Instance().SetWindowSize(Size((float)w, (float)h));
	Quadris::Instance().Start();
}

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameSurface_loop(JNIEnv * env, jobject obj)
{
	Engine::Instance().MainLoop();
}

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameSurface_surface_1lost(JNIEnv * env, jobject obj)
{
	if (Engine::HasInstance())
	{
		Engine::Instance().LogWarning("Surface lost about to being recreated");
		Engine::Instance().ReloadContex();
	}
}


extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameActivity_touch(JNIEnv * env, jobject thiz, jint x, jint y)
{
	if (&Engine::Instance())
		Engine::Instance().SendTouch((int)x, (int)y);
}

extern "C" JNIEXPORT bool JNICALL Java_com_saldabi_quadris_GameActivity_back(JNIEnv * env, jobject thiz)
{
    if (&Engine::Instance())
        return Engine::Instance().SendBack();
    return false;
}


extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameActivity_close(JNIEnv * env, jobject obj, jint w, jint h)
{
	Engine::Instance().Close();
	delete g_EngineInstance;
	delete g_QuadrisInstance;
}

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameSurface_surface_1changed(JNIEnv * env, jobject obj,jint w,jint h)
{
    Engine::Instance().LogWarning("Surface was changed: %d,%d", w, h);
    Engine::Instance().SetWindowSize(Size((float)w, (float)h));
}

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameActivity_swipe(JNIEnv * env, jobject obj,jint d)
{
    if (&Engine::Instance())
        return Engine::Instance().SendSwipe((Engine::SwipeDirection)d);
}

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameSurface_save_1data(JNIEnv * env, jobject obj,jstring javaString)
{
	const char *nativeString = env->GetStringUTFChars(javaString, JNI_FALSE);

	Quadris::Instance().GetSaveManager().SetSavePath(nativeString);

	env->ReleaseStringUTFChars(javaString, nativeString);
}

#endif 
