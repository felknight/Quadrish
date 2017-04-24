#pragma once
#include <list>
#include <cassert>
#include <memory>
#include <functional>

class StateStack
{
public:
 

    class State
    {
    public:
        typedef std::function<bool()> Functor;
        typedef std::function<void(State&)> InitFunctor;

        State(Functor f,bool unique)
            : m_func(f)
            , m_uniq(unique)
            , m_init(nullptr)
            , m_hasinit(false)
            , UserFlags(0)
        {

        }

        void SetInit(InitFunctor f)
        {
            m_init = f;
        }

        void Refresh()
        {
            m_hasinit = false;
        }

        void Init()
        {
            if (m_init && !m_hasinit)
            {
                m_hasinit = true;
                m_init(*this);
            }
                
        }

        bool operator ()()
        {
            return m_func();
        }

        operator bool()
        {
            return m_uniq;
        }
    
        uint32_t UserFlags;
    private:
        Functor     m_func;
        InitFunctor m_init;
        bool        m_uniq;
        bool        m_hasinit;
    };

    typedef std::unique_ptr<State> StatePtr;

    StateStack();
    ~StateStack();

    State& PushState(State::Functor f, bool unique = true);
    State& PushState(State::Functor f, State::InitFunctor m_init, bool unique = true);
    bool CallStates();
    bool LastState()
    {
        return m_states.size() == 1;
    }

    bool IsClean()
    {
        return m_states.empty();
    }

    void RefreshLast()
    {
        assert(!m_states.empty());
        m_states.back()->Refresh();
    }

    void PopState();
    State& CurrentState()
    {
        return *m_states.back();
    }
private:
    std::list<StatePtr> m_states;
};

typedef StateStack::State SSState;

