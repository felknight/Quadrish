#ifndef SECUREMEMORY_H
#define SECUREMEMORY_H


//TODO: Actually implement this class

template <class T>
class SecureMemory
{
public:
    SecureMemory(const T& cpy)
    {
        m_value = cpy;
    }

    operator const T() const
    {
        return m_value;
    }

    void operator ++(int);
    void operator --(int);
private:
    T m_value;
};

#endif