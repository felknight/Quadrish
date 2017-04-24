inline ILuint generateatlas(auint size,ilist list,abool verbose)
{
	ILuint atlasname;

	atlasname = ilGenImage();
	ilBindImage(atlasname);

	ilTexImage(size,size,1,4,IL_RGBA,IL_UNSIGNED_BYTE,NULL);

	if (verbose)
		fprintf(stderr,"creating atlas of size: %lu\n",size);

	ilDisable(IL_BLIT_BLEND);

	auint datasize = sizeof(unsigned char)*4*size*size;
	void* tmpimagedata = malloc(datasize);
	memset(tmpimagedata,0,datasize);
	ilSetData(tmpimagedata);
	free(tmpimagedata);

	for (;list != 0;list = list->next)
	{
		ilOverlayImage(list->name,list->x,list->y,0);
	}

	return atlasname;
}
