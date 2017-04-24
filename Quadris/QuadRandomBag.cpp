#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <map>
#include <cstring>

#include "QuadRandomBag.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif


//TODO: AI Watchdog
//TODO: AI pred thread deadlock fix
//TODO: AI not second piece available position found
 
const uint32_t g_quadKindPoolMax[QuadKind::QuadKind_Total+1] =
{
    3//TQuad
    , 2//Square
    , 2//ZQuad
    , 2//SQuad
    , 2//LQuad
    , 2//FQuad
    , 4//Line
};

const uint32_t g_quadPoolMaxTotal = 17;


QuadRandomBag::QuadRandomBag(RandomEngine& eng, RandomDist& dist)
: m_engine(eng)
, m_dist(dist)
{
   
}


QuadRandomBag::~QuadRandomBag()
{

}


QuadKind QuadRandomBag::Next()
{
    using namespace std;
    if (m_bag.empty())
        Suffle();

    auto res = m_bag.back();
    m_bag.pop_back();
    return res;  
    
}

void QuadRandomBag::Clear()
{
    Suffle();
}

void QuadRandomBag::Suffle()
{
    m_bag.clear();
    std::vector<QuadKind> tmp_vector;
    tmp_vector.reserve(g_quadPoolMaxTotal);

    auto itend = tmp_vector.end();

    for (uint32_t i = 0; i < QuadKind_Total; i++)
    {
        tmp_vector.insert(itend, g_quadKindPoolMax[i], (QuadKind)i);
        itend = tmp_vector.end();
    }
        
    while (!tmp_vector.empty())
    {
        uint32_t p = m_dist(m_engine) % tmp_vector.size();
        QuadKind v = tmp_vector[p];
        m_bag.push_back(v);
        tmp_vector.erase(tmp_vector.begin() + p);
    }
}
