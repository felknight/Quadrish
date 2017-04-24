inline auint arrengeimages(ilist list,abool verbose,abool req_size,auint sizer)
{
	auint size,carrx = 0,carry = 0, ii = 0, jj = 0;
	int exp;
	aint lastsize = -1;
	double f,area = 0.0;
	ilist root = list;


	for (;list != 0;list = list->next)
	{
		ilBindImage(list->name);
		int width = ilGetInteger(IL_IMAGE_WIDTH);
		int height = ilGetInteger(IL_IMAGE_HEIGHT);
		if (width != height)
		{
			fprintf(stderr,"atlasg doesn't support no square images\n");
			exit(3);
		}
		if (lastsize == -1)
			lastsize = width;
		else
		{
			if (lastsize != width)
			{
				fprintf(stderr,"atlasg doesn't support different size images\n");
				exit(3);
			}
		}

		area += (double)width*height;
	}

	if (!req_size)
	{
		f = sqrt(area);
		if (frexp(f, &exp) != 0.5) {
			f = ldexp(1.0, exp);
		}
		size = (uint)f;

		if (verbose)
				fprintf(stderr,"size of atlas calculated to: %lu\n",size);
	}
	else
		size = sizer;


	for (list = root;list != 0;list = list->next)
	{
		if (carrx + lastsize <= size)
		{
			list->x = carrx;
			list->y = carry;
			list->i = ii;
			list->j = jj;
			list->w = lastsize;
			list->h = lastsize;
			carrx += lastsize;
			ii++;
		}
		else
		{
			carrx = 0;
			carry += lastsize;
			ii = 0;
			jj++;

			list->x = carrx;
			list->y = carry;
			list->i = ii;
			list->j = jj;
			list->w = lastsize;
			list->h = lastsize;
		}

		if (verbose)
			fprintf(stderr,"placing %s at %lu, %lu. With index %lu,%lu\n",list->image,list->x,list->y,list->i,list->j);

	}

	return size;

}
