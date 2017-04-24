#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG
#endif

#include "StateStack.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

StateStack::StateStack()
{
    
}


StateStack::~StateStack()
{

}


StateStack::State& StateStack::PushState(State::Functor f, bool unique)
{
    State* state = new State(f, unique);
    m_states.push_back(StatePtr(state));
    return *state;
}

StateStack::State& StateStack::PushState(State::Functor f
    , State::InitFunctor m_init, bool unique)
{
    State* state = new State(f, unique);
    state->SetInit(m_init);
    m_states.push_back(StatePtr(state));
    return *state;
}

bool StateStack::CallStates()
{
    for (auto it = m_states.rbegin(); it != m_states.rend(); it++)
    {
        auto& state = *it->get();
        state.Init();

        if (state)
        {
            return state();
        }
        else
        {
            state();
        }
    }
    return false;
}

void StateStack::PopState()
{
    if (!m_states.empty())
    {
        m_states.pop_back();
        m_states.back()->Refresh();
    }
     
}