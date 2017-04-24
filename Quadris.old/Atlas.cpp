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
#include <vector>
#include <sstream>
#include <stack>
#include <memory>
#include "Atlas.h"
#include "Image.h"
#include "Engine.h"
#include "gason.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

#include <gtx/transform.hpp>

Atlas::Atlas()
	:m_image(nullptr)
{

}

Atlas::~Atlas()
{
	if (m_image)
		delete m_image;
}

struct TreeNode
{
	typedef std::shared_ptr<TreeNode> TNPtr;

	std::shared_ptr<TreeNode> parent;
	JsonNode*				  node;
	const char*				  key;
};

typedef std::shared_ptr<TreeNode> TNPtr;

Atlas* Atlas::LoadFromStringName(const char* pathidx,const char* descidx)
{
	using namespace std;

	Atlas* newatlas = new Atlas;
	newatlas->m_image = Image::LoadFromStringName(pathidx);

	if (!newatlas->m_image)
		return nullptr;

	Engine::FileDescriptor* desc = Engine::OpenFileBinary(
			GET_CSTRING(descidx));

	size_t size = Engine::FileSize(desc);
	char* buffer = new char[size+1];

	Engine::ReadFile(desc,size,1,buffer);
	buffer[size] = 0;

	char *endptr;
	JsonValue value;
	JsonAllocator allocator;
	int status = jsonParse(buffer, &endptr, &value, allocator);
	if (status != JSON_OK) {
		Engine::Instance().LogError("Error while parsing %s", descidx);
		return nullptr;
	}

	JsonValue*	current = nullptr;
	const char*	key		= nullptr;
	JsonNode*	curNode = nullptr;
	TNPtr		parent = nullptr;
	std::stack<TNPtr> treestack;
	std::string name;
	current = &value;
	Subimage simg;
	Size	imgsize;

	while (true)
	{
		auto tag = current->getTag();

		switch (tag)
		{
		case JsonTag::JSON_OBJECT:
			curNode = current->toNode();
			do
			{
				if (strcmp("frames", curNode->key) == 0
					|| strcmp("frame", curNode->key) == 0
					|| strcmp("filename", curNode->key) == 0
					|| strcmp("x", curNode->key) == 0
					|| strcmp("y", curNode->key) == 0
					|| strcmp("h", curNode->key) == 0
					|| strcmp("w", curNode->key) == 0
					|| strcmp("meta", curNode->key) == 0
					|| strcmp("size", curNode->key) == 0
					)
				{
					TNPtr node = TNPtr(new TreeNode);
					node->node = curNode;
					node->key = curNode->key;
					node->parent = parent;

					treestack.push(node);
				}

				curNode = curNode->next;

			} while (curNode);
			break;
		case JsonTag::JSON_ARRAY:
			curNode = current->toNode();
			do
			{
				TNPtr node = TNPtr(new TreeNode);
				node->node = curNode;
				node->key = nullptr;
				node->parent = parent;

				treestack.push(node);
				curNode = curNode->next;
			} while (curNode);
			break;
		case JsonTag::JSON_STRING:
			if (strcmp("filename", key) == 0)
			{
				name = current->toString();
				size_t k = name.find('.');
				name = name.substr(0, k);
			}
				
			break;
		case JsonTag::JSON_NUMBER:
			if (strcmp("frame", parent->parent->key) == 0)
			{
				if (strcmp("h", key) == 0)
					simg.h = (float)current->toNumber();
				if (strcmp("w", key) == 0)
					simg.w = (float)current->toNumber();
				if (strcmp("y", key) == 0)
					simg.y = (float)current->toNumber();
				if (strcmp("x", key) == 0)
					simg.x = (float)current->toNumber();
			}
			else if (strcmp("size", parent->parent->key) == 0)
			{
				if (strcmp("h", key) == 0)
					imgsize.H = (float)current->toNumber();
				if (strcmp("w", key) == 0)
					imgsize.W = (float)current->toNumber();
			}
			break;
		}

		if (treestack.empty())
			break;

		current = &treestack.top()->node->value;

		if (treestack.top()->key)
		{
			key = treestack.top()->key;
			parent = treestack.top();
		}
		else
		{
			key = treestack.top()->parent->key;
			parent = treestack.top()->parent;

			//going through an array
			if (strcmp("frames", key) == 0)
			{
				if (!name.empty())
				{
					newatlas->m_subimageInfo.insert(SIPair(name, simg));
				}
			}
		}
	
		treestack.pop();
	}

	newatlas->m_subimageInfo.insert(SIPair(name, simg));

	for (auto& atl : newatlas->m_subimageInfo)
	{
		atl.second.h /= imgsize.H;
		atl.second.y /= imgsize.H;
		atl.second.w /= imgsize.W;
		atl.second.x /= imgsize.W;
	}

    delete[] buffer;
    Engine::CloseFile(desc);

	return newatlas;
}

void Atlas::LoadVideoMemory(bool clean)
{
	if (m_image)
		m_image->LoadVideoMemory(clean);
}

void Atlas::DrawAtlasImage(GemeotryPointer* ptr, const std::string& name)
{

	if (ptr && m_image)
	{
		auto& subimg = m_subimageInfo[name];
		auto trans = glm::translate(glm::vec3(subimg.x, subimg.y, 0.0f));
		trans = glm::scale(trans, glm::vec3(subimg.w, subimg.h, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceTextureMatrix(&trans[0][0]);

		auto world = glm::translate(glm::vec3(curX, curY, 0.0f));
		world = glm::scale(world, glm::vec3(scaleX, scaleY, 1.0f));
		Engine::Instance().GetRenderer()->ReplaceModelViewMatrix(&world[0][0]);

		m_image->Bind();
		Engine::Instance().GetRenderer()->RenderGeometry(ptr);
	}
}

void Atlas::SetCursor(float x,float y)
{
	curX = x;
	curY = y;
}

void Atlas::SetScale(float sc)
{
	scaleX = sc;
	scaleY = sc;
}

void Atlas::SetScale(float x, float y)
{
	scaleX = x;
	scaleY = y;
}