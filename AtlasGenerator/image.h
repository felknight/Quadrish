#ifndef _IMAGE_H
#define _IMAGE_H

typedef uint32_t	   QWORD;
typedef uint64_t 	   DWORD;
typedef uint64_t	   auint;
typedef int64_t	   	   aint;
typedef int64_t	   	   abool;

struct _imagelist
{
	char* image;
	struct _imagelist* next;
	ILuint	name;
	auint	i;
	auint 	j;
	auint 	x;
	auint   y;
	auint 	w;
	auint 	h;
};

typedef struct _imagelist imagelist;
typedef imagelist* ilist;

#endif
