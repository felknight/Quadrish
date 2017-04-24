

enum ArgumentFlags
{
	VERBOSE 		= 0x0001ull
	,HASOUTPUT 		= 0x0002ull
	,HASSIZE		= 0x0004ull
	,HASDESCRIPTOR	= 0x0008ull
};

struct _argumentinfo
{
	DWORD flags;
	ilist images;
	auint   size;
	char* output;
	char* descriptor;
};

typedef struct _argumentinfo argumentinfo;
typedef argumentinfo* arginfo;

inline void printimagelist(ilist list)
{
	fprintf(stderr,"Parsing images: ");
	while (list != NULL)
	{
		fprintf(stderr,"%s ",list->image);
		list = list->next;
	}
	fprintf(stderr,"\n");
}

inline void printusage()
{
	fprintf(stderr,
	"AtlasGenerator for Quadrish 0.1.1 \n"
	"usage: \n"
	"atlasg -v [-s <size>] [-o <atlasfile>] [-d <atlasdescfile>] <images>\n\n");
	exit(1);
}

inline void parsearguments(int argc,char** argv,arginfo info)
{
	char opt;
	ilist images = NULL;
	ilist img = NULL;

	if (info == NULL)
		return;

	if (argc == 1)
		printusage();

	while ( (opt = getopt(argc,argv,"s:o:d:v")) != -1)
	{
		switch(opt)
		{
		case 's':
			info->size = atoi(optarg);
			if (info->size)
				info->flags |= HASSIZE;
			else
				printusage();
			break;
		case 'o':
			info->output = optarg;
			if (info->output)
				info->flags |= HASOUTPUT;
			else
				printusage();
			break;
		case 'd':
			info->descriptor = optarg;
			if (info->descriptor)
				info->flags |= HASDESCRIPTOR;
			else
				printusage();
			break;
		case 'v':
			info->flags |= VERBOSE;
			break;
		default:
			printusage();
		}
	}

	while (optind < argc)
	{

		if (images == NULL)
		{
			images = malloc(sizeof(imagelist));
			img = images;
		}
		else
		{
			img->next = malloc(sizeof(imagelist));
			img = img->next;
		}

		int len = strlen(argv[optind]);
		img->image = malloc(len);
		memcpy(img->image,argv[optind],len);
		img->next = NULL;

		optind++;
	}

	if (images == NULL)
		printusage();

	info->images = images;

	if (info->flags & VERBOSE)
	{
		printimagelist(images);
	}
}



