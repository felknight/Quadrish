#ifndef ATLAS_H
#define ATLAS_H

#include <unordered_map>
#include "Math.hpp"

class Image;
class GemeotryPointer;

class Atlas
{
public:

	Atlas();
	~Atlas();

	Atlas(const Atlas&) = delete;
	Atlas(Atlas&&) = delete;

	Atlas operator = (const Atlas&) = delete;


	static Atlas* LoadFromPath(const char* path,const char* desc);
	static Atlas* LoadFromStringName(const char* pathidx,const char* descidx);

	void LoadVideoMemory(bool = false);
	void SetCursor(float x,float y);
	void SetScale(float sc);
	void SetScale(float x,float y);
	void DrawAtlasImage(GemeotryPointer* ptr, const std::string& name);

private:

	struct Subimage
	{
		float x;
		float y;
		float w;
		float h;
	};

	Image* m_image;
	typedef std::pair<std::string,Subimage> SIPair;
	std::unordered_map<std::string,Subimage> m_subimageInfo;

	float curX;
	float curY;
	float scaleX;
	float scaleY;
};

#endif

