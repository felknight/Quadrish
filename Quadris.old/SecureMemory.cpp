#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <cassert>
#include "SecureMemory.h"
#include "Engine.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

template <>
void SecureMemory<uint32_t>::operator++(int)
{
    this->m_value++;
}

template <>
void SecureMemory<uint32_t>::operator--(int)
{
    this->m_value--;
}