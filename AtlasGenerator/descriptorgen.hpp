

inline void generatedescriptor(ilist list,const char* desc,abool verbose,auint size)
{
	const char* filename = "atlas.txt";
	char buffer[120];

	if (desc)
		filename = desc;

	FILE* file = fopen(filename,"w");
	if (!file)
	{
		fprintf(stderr,"Can't open %s file for writing",desc);
		exit(6);
	}

	fprintf(file,"%lu %lu\n",size,size);

	for (;list != 0;list = list->next)
	{
		const char* bs = basename(list->image);
		memcpy(buffer,bs,strlen(bs));
		char* pp = strchr(buffer,'.');
		*pp = 0;

		if (verbose)
			fprintf(stderr,"Adding %s to descriptor file\n",buffer);

		fprintf(file,"%s %lu %lu %lu %lu\n",buffer,list->x,list->y,list->w,list->h);
	}

	fclose(file);
}
