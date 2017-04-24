#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include "Engine.h"

#include <stdarg.h>

#ifdef _WIN32
#define GLFW_INCLUDE_NONE
#define GLEW_STATIC
#include <GLFW\glfw3.h>
#include <GL/glew.h>
#include <cassert>
#include <mutex>

#ifdef _WIN32
#include <crtdbg.h>
#endif


extern "C"__declspec(dllimport) void __stdcall OutputDebugStringA(const char*);

FILE*				g_logFile;
GLFWwindow*			eg_GLFWWindow;

void Engine::EarlyInit()
{
	fopen_s(&g_logFile, "log.txt", "w");
	assert(g_logFile);
}

void Engine::NativeClose()
{
	if (!g_logFile)
		return;

	fclose(g_logFile);
}

struct Engine::FileDescriptor
{
	FILE* file;
};

Engine::FileDescriptor* Engine::OpenFileBinary(const char* file)
{
	FileDescriptor* desc = new FileDescriptor();
	if (fopen_s(&desc->file, file, "rb") != 0)
	{
		delete desc;
		return nullptr;
	}
		
	return desc;
}

size_t Engine::ReadFile(FileDescriptor* f, size_t unit, size_t count, void* buffer)
{
	return fread(buffer, unit, count, f->file);
}

void Engine::CloseFile(FileDescriptor* f)
{
	fclose(f->file);
	delete f;
}

size_t Engine::FileSeek(FileDescriptor* f, size_t offset, FileSeekPos pos)
{
	int ps = SEEK_SET;
	switch (pos)
	{
	case Engine::FileSeekPos::CUR:
		ps = SEEK_CUR;
		break;
	case Engine::FileSeekPos::END:
		ps = SEEK_END;
		break;
	default:
		break;
	}
	return fseek(f->file, offset, ps);
}

size_t Engine::FileSize(FileDescriptor* f)
{
	size_t apos = ftell(f->file);
	int sucess = fseek(f->file, 0, SEEK_END);
	if (sucess != 0)
	{
		Engine::Instance().LogError("Error while seeking on a file");
		assert(false);
	}
	size_t fsize = ftell(f->file);
	fseek(f->file, apos, SEEK_SET);
	return fsize;
}

#ifdef _LOGGING

static char log_buffer[4096];

inline void g_LogToDebug(const char* string, va_list ap, char c)
{
	
	log_buffer[0] = '(';
	log_buffer[1] = c;
	log_buffer[2] = ')';
	log_buffer[3] = ' ';
	vsnprintf_s(log_buffer + 4, 4095-5, _TRUNCATE, string, ap);
	size_t len = strlen(log_buffer);
	if (len < 2048)
	{
		log_buffer[len] = '\n';
		log_buffer[len + 1] = 0;
	}
	
	OutputDebugStringA(log_buffer);
}

std::mutex g_logMutex;

void Engine::LogInformation(const char* string, ...)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	va_list ap;
	va_start(ap,string);
	fprintf_s(g_logFile, "(I): ");
	vfprintf_s(g_logFile, string, ap);
	fprintf_s(g_logFile, "\n");
	va_start(ap, string);
	g_LogToDebug(string, ap, 'I');
}

void Engine::LogWarning(const char* string, ...)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	va_list ap;
	va_start(ap, string);
	fprintf_s(g_logFile, "(W): ");
	vfprintf_s(g_logFile, string, ap);
	fprintf_s(g_logFile, "\n");
	g_LogToDebug(string, ap, 'W');
}

void Engine::LogError(const char* string, ...)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	va_list ap;
	va_start(ap, string);
	fprintf_s(g_logFile, "(E): ");
	vfprintf_s(g_logFile, string, ap);
	fprintf_s(g_logFile, "\n");
	g_LogToDebug(string, ap, 'E');
}

void Engine::LogError(const char* string, va_list ap)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	fprintf_s(g_logFile, "(E): ");
	vfprintf_s(g_logFile, string, ap);
	fprintf_s(g_logFile, "\n");
}

#endif

#endif

#if defined(ANDROID) && !defined(FALSE_ANDROID)

#include <jni.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>
#include <stdarg.h>
#include <android/log.h>
#include <EGL/egl.h>

#define LOG_TAG "Quadris"

AAssetManager* g_assetmanager;

void Engine::EarlyInit()
{
	
}

void Engine::NativeClose()
{
	
}

struct Engine::FileDescriptor
{
	AAsset* asset;
};

Engine::FileDescriptor* Engine::OpenFileBinary(const char* file)
{
	FileDescriptor* desc = new FileDescriptor;
	desc->asset = AAssetManager_open(g_assetmanager,file,AASSET_MODE_STREAMING);
	if (!desc->asset)
	{
		delete desc;
		return nullptr;
	}

	return desc;
		
}

size_t Engine::ReadFile(FileDescriptor* f, size_t unit, size_t count, void* buffer)
{
	size_t total = unit*count;
	size_t read = AAsset_read(f->asset,buffer,total);
	return read/unit;
}

void Engine::CloseFile(FileDescriptor* f)
{
	AAsset_close(f->asset);
	delete f;
}

size_t Engine::FileSeek(FileDescriptor* f, size_t offset, FileSeekPos pos)
{
	int ps = SEEK_SET;
	switch (pos)
	{
	case Engine::FileSeekPos::CUR:
		ps = SEEK_CUR;
		break;
	case Engine::FileSeekPos::END:
		ps = SEEK_END;
		break;
	default:
		break;
	}
	int seek = AAsset_seek(f->asset, offset, ps);
	if (seek == -1)
	{
		Engine::Instance().LogError("Error while seeking on a file");
		return 0;
	}
	return seek;
}

size_t Engine::FileSize(FileDescriptor* f)
{
	return AAsset_getLength(f->asset);
}


#ifdef _LOGGING
void Engine::LogInformation(const char* string, ...)
{
	va_list ap;
	va_start(ap,string);
	__android_log_vprint(ANDROID_LOG_INFO,LOG_TAG,string,ap);
}

void Engine::LogWarning(const char* string, ...)
{
	va_list ap;
	va_start(ap, string);
	__android_log_vprint(ANDROID_LOG_WARN,LOG_TAG,string,ap);
}

void Engine::LogError(const char* string, ...)
{
	va_list ap;
	va_start(ap, string);
	__android_log_vprint(ANDROID_LOG_ERROR,LOG_TAG,string,ap);
}

void Engine::LogError(const char* string, va_list ap)
{
	__android_log_vprint(ANDROID_LOG_ERROR,LOG_TAG,string,ap);
}

#endif

extern "C" JNIEXPORT void JNICALL Java_com_saldabi_quadris_GameActivity_assetmanager(JNIEnv * env, jobject thiz, jobject am)
{
	g_assetmanager = AAssetManager_fromJava(env, am);
}


#endif



#ifdef FALSE_ANDROID
#include <cassert>
#include <mutex>
#include <iostream>
#include <cstdio>
#include <cstring>

FILE*				g_logFile;

void Engine::EarlyInit()
{
	g_logFile = fopen("log.txt", "w");
	assert(g_logFile);
}

void Engine::NativeClose()
{
	if (!g_logFile)
		return;

	fclose(g_logFile);
}

struct Engine::FileDescriptor
{
	FILE* file;
};

Engine::FileDescriptor* Engine::OpenFileBinary(const char* file)
{
	FileDescriptor* desc = new FileDescriptor();
	if ( !(desc->file = fopen(file, "rb")) )
	{
		delete desc;
		return nullptr;
	}

	return desc;
}

size_t Engine::ReadFile(FileDescriptor* f, size_t unit, size_t count, void* buffer)
{
	return fread(buffer, unit, count, f->file);
}

void Engine::CloseFile(FileDescriptor* f)
{
	fclose(f->file);
	delete f;
}

size_t Engine::FileSeek(FileDescriptor* f, size_t offset, FileSeekPos pos)
{
	int ps = SEEK_SET;
	switch (pos)
	{
	case Engine::FileSeekPos::CUR:
		ps = SEEK_CUR;
		break;
	case Engine::FileSeekPos::END:
		ps = SEEK_END;
		break;
	default:
		break;
	}
	return fseek(f->file, offset, ps);
}

size_t Engine::FileSize(FileDescriptor* f)
{
	size_t apos = ftell(f->file);
	int sucess = fseek(f->file, 0, SEEK_END);
	if (sucess != 0)
	{
		Engine::Instance().LogError("Error while seeking on a file");
		assert(false);
	}
	size_t fsize = ftell(f->file);
	fseek(f->file, apos, SEEK_SET);
	return fsize;
}

#ifdef _LOGGING

static char log_buffer[2049];

inline void g_LogToDebug(const char* string, va_list ap, char c)
{

	log_buffer[0] = '(';
	log_buffer[1] = c;
	log_buffer[2] = ')';
	log_buffer[3] = ' ';
	vsnprintf(log_buffer + 4, 2048-4, string, ap);
	size_t len = strlen(log_buffer);
	if (len < 2048)
	{
		log_buffer[len] = '\n';
		log_buffer[len + 1] = 0;
	}

	std::cout << log_buffer;
}

std::mutex g_logMutex;

void Engine::LogInformation(const char* string, ...)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	va_list ap;
	va_start(ap,string);
	fprintf(g_logFile, "(I): ");
	vfprintf(g_logFile, string, ap);
	fprintf(g_logFile, "\n");
	va_start(ap, string);
	g_LogToDebug(string, ap, 'I');
}

void Engine::LogWarning(const char* string, ...)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	va_list ap;
	va_start(ap, string);
	fprintf(g_logFile, "(W): ");
	vfprintf(g_logFile, string, ap);
	fprintf(g_logFile, "\n");
	g_LogToDebug(string, ap, 'W');
}

void Engine::LogError(const char* string, ...)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	va_list ap;
	va_start(ap, string);
	fprintf(g_logFile, "(E): ");
	vfprintf(g_logFile, string, ap);
	fprintf(g_logFile, "\n");
	g_LogToDebug(string, ap, 'E');
}

void Engine::LogError(const char* string, va_list ap)
{
	std::lock_guard<std::mutex> guard(g_logMutex);
	fprintf(g_logFile, "(E): ");
	vfprintf(g_logFile, string, ap);
	fprintf(g_logFile, "\n");
}

#endif

#endif
