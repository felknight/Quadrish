#define ANDROID_MAIN 	"Java_com_saldabi_quadris_GameSurface_android_1main"
#define LOOP		 	"Java_com_saldabi_quadris_GameSurface_loop"
#define TOUCH			"Java_com_saldabi_quadris_GameActivity_touch"
#define BACK			"Java_com_saldabi_quadris_GameActivity_back"
#define SURFACE_LOST	"Java_com_saldabi_quadris_GameSurface_surface_1lost"
#define CLOSE			"Java_com_saldabi_quadris_GameActivity_close"




typedef void (*ANDROID_MAIN_FUNC)(void*,void*,int,int);
typedef void (*LOOP_FUNC)(void*,void*);
typedef void (*TOUCH_FUNC)(void*,void*,int,int);
typedef bool (*BACK_FUNC)(void*,void*);
typedef bool (*SURFACE_LOST_FUNC)(void*,void*);
typedef void (*CLOSE_FUNC)(void*,void*);

extern ANDROID_MAIN_FUNC 	s_AndroidMain;
extern LOOP_FUNC 		 	s_Loop;
extern TOUCH_FUNC 		 	s_Touch;
extern BACK_FUNC			s_Back;
extern SURFACE_LOST_FUNC    s_SurfaceLost;
extern CLOSE_FUNC		    s_CloseFunc;
