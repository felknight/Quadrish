
inline void loadimages(ilist list, abool verbose)
{
	ILboolean loaded;
	ILenum error;
	const char* error_str;

	ilInit();
	iluInit();
	iluSetLanguage(ILU_ENGLISH);

	while(list != NULL)
	{
		list->name = ilGenImage();
		ilBindImage(list->name);
		loaded = ilLoadImage(list->image);
		if (loaded)
		{
			if (verbose)
				fprintf(stderr,"Loaded %s correctly\n",list->image);
		}
		else
		{
			ilDeleteImage(list->name);
			error = ilGetError();
			error_str = iluErrorString(error);
			fprintf(stderr,"%s load failed: %s\n",list->image,error_str);
			exit(2);
		}

		list = list->next;
	}
}
