// El objetivo de este programa es tomar un numero n de imagenes
// y juntarlas en una sola textura con tamaño potencia de 2.

// La estructura del programa consisten en:
    // Parsear los argumentos de entrada
    // Cargar las imagenes
    // Calcular el arreglo de imagenes
    // Generar el atlas
    // Guardar el atlas en disco

//Planned usage
// atlasg [-s <size>] [-o <atlasfile>] [-d <atlasdescfile>] <images>


#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdint-gcc.h>
#include <math.h>
#include <IL/il.h>
#include <IL/ilu.h>
#include <IL/ilu_region.h>
#include <libgen.h>

#include "image.h"
#include "arguments.hpp"
#include "imageloader.hpp"
#include "arrange.hpp"
#include "atlasgenerator.hpp"
#include "descriptorgen.hpp"

int main(int argc,char** argv)
{
	argumentinfo info;
	auint size;
	ILuint atlas;

	memset(&info,0,sizeof(argumentinfo));
	parsearguments(argc,argv,&info);
	loadimages(info.images,info.flags & VERBOSE);
	size = arrengeimages(info.images,info.flags & VERBOSE,info.flags & HASSIZE,info.size);
	atlas = generateatlas(size,info.images,info.flags & VERBOSE);
	generatedescriptor(info.images,(info.flags & HASDESCRIPTOR) ? info.descriptor : NULL,info.flags & VERBOSE,size);

	ilBindImage(atlas);

	const char* savefile = "atlas.png";

	if (info.flags & HASOUTPUT)
		savefile = info.output;

	FILE* f = fopen(savefile,"r");
	if (f)
	{
		fclose(f);
		remove(savefile);
	}

	ilSaveImage(savefile);

	ILenum error = ilGetError();
	if (error != IL_NO_ERROR)
	{
		const char* errors = iluErrorString(error);
		fprintf(stderr,"error while saving the atlas: %s\n",errors);
		return 5;
	}

	return 0;
}
