#ifndef STRINGMANAGER_H
#define STRINGMANAGER_H

#include <string>
#include <unordered_map>

class StringManager
{
public:
	StringManager();
	const std::string& ReturnString(const char* idx);
private:
	typedef std::unordered_map<std::string, std::string>	Values;
	typedef std::pair<std::string, std::string>				Pair;

	Values m_values;
};

#endif