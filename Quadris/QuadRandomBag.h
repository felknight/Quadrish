#pragma once

#include <random>
#include <list>

#include "Quad.h"

class QuadRandomBag
{
public:
    typedef std::mt19937 RandomEngine;
    typedef std::uniform_int_distribution<uint32_t> RandomDist;

    QuadRandomBag(RandomEngine&, RandomDist&);
    ~QuadRandomBag();

    QuadKind Next();
    void Clear();

private:
    void Suffle();

    RandomEngine&                       m_engine;
    RandomDist&                         m_dist;
    std::list<QuadKind>                 m_bag;
};

