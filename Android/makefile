#Enviroment
NDK  := /c/ndk
NDK_BIN := /c/ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin/
LOCAL_INCLUDE := /usr/local/include/
GCC_LIB := /lib/gcc/x86_64-unknown-linux-gnu/4.9.2/


FLAGSCOMMON := -fpic -no-canonical-prefixes -fomit-frame-pointer -fno-strict-aliasing -finline-limit=256 -Wl,--gc-sections -fvisibility=hidden
FLAGSCXX := -std=c++11 
FLAGSERROR := -Werror -Wa,--noexecstack -Wformat -Werror=format-security 
FLAGSDEBUG := -O0 -g -D_DEBUG
FLAGSDEFINE := -DANDROID
FLAGSOPTIMIZE := -O3 -flto -fuse-linker-plugin -Wl,--gc-sections -s -ffunction-sections -fdata-sections
FLAGSOPTLINK :=
FLAGSLOGS    := -D_LOGGING
INCLUDES := -Ijni -I../glm -I../lpng \
-I../freetype/include

ifeq ($(PLATFORM),android)
	INCLUDES += -I$(NDK)/platforms/android-9/arch-arm/usr/include  -I$(NDK)/sources/cxx-stl/gnu-libstdc++/4.9/include \
		 -I$(NDK)/sources/cxx-stl/system/include 
	ifeq ($(ANDROID),v7)
	FLAGSCOMMON += -march=armv7-a -mfpu=vfpv3-d16  -mhard-float -mfloat-abi=hard
	INCLUDES += -I$(NDK)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a-hard/include
	FLAGSDEFINE += -D_NDK_MATH_NO_SOFTFP=1
	else
	INCLUDES += -I$(NDK)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/include
	endif

else
	INCLUDES += -I$(LOCAL_INCLUDE)linux/
	FLAGSDEFINE	+= -DFALSE_ANDROID
endif



CFLAGS := $(FLAGSCOMMON) $(FLAGSERROR) $(FLAGSDEFINE) $(INCLUDES) $(FLAGSLOGS)
CXXFLAGS := $(FLAGSCOMMON) $(FLAGSERROR) $(FLAGSDEFINE) $(FLAGSCXX) $(INCLUDES) $(FLAGSLOGS)

LIBS := -lEGL -lGLESv1_CM -lc -lgcc -lstdc++
LINKFLAGS := -L. -nostdlib -shared -Wl,-soname -Wl,--no-undefined -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now  -Wl,--no-warn-mismatch

ifeq ($(PLATFORM),android)
	

	CXX := $(NDK_BIN)arm-linux-androideabi-g++
	C := $(NDK_BIN)arm-linux-androideabi-gcc
	AR := $(NDK_BIN)arm-linux-androideabi-ar rcs
	RANLIB := $(NDK_BIN)arm-linux-androideabi-ranlib
	OBJDUMP := $(NDK_BIN)arm-linux-androideabi-objdump

	LIBS += $(NDK)/platforms/android-9/arch-arm/usr/lib/crtbegin_so.o -landroid -llog
	LINKFLAGS += --sysroot=$(NDK)platforms/android-9/arch-arm -L$(NDK)/platforms/android-9/arch-arm/usr/lib


	ifeq ($(ANDROID),v7)
		LIBS += libm_hard_platform9_custom.a $(NDK)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a-hard/libgnustl_static.a
	else
		LIBS += -lm $(NDK)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/libgnustl_static.a
	endif

else
	CXX 	:= g++
	C 		:= gcc
	AR 		:= ar rcs
	RANLIB 	:= ranlib
	OBJDUMP := objdump

	LIBS += $(GCC_LIB)/crtbeginS.o $(GCC_LIB)/crtendS.o
endif

QUADRIS_ROOT :=../Quadris/
QUADRIS_CFILES := $(wildcard $(QUADRIS_ROOT)*.cpp)
QUADRIS_OBJS := $(addprefix obj/,$(notdir $(QUADRIS_CFILES:.cpp=.o)))

ZLIB_ROOT := ../zlib/
ZLIB_CFILES := $(wildcard $(ZLIB_ROOT)*.c)
ZLIB_OBJS := $(addprefix obj/,$(notdir $(ZLIB_CFILES:.c=.o)))
ZLIB_FLAGS := 

LPNG_ROOT := ../lpng/
LPNG_CFILES := $(wildcard $(LPNG_ROOT)*.c)
LPNG_OBJS := $(addprefix obj/,$(notdir $(LPNG_CFILES:.c=.o)))
LPNG_FLAGS := 

FREETYPE_ROOT := ../freetype/
FREETYPE_BASE := $(FREETYPE_ROOT)src/base/
FREETYPE_SRC_BASE := ftbase.c \
ftbitmap.c \
ftfstype.c \
ftgasp.c \
ftglyph.c \
ftinit.c \
ftstroke.c \
ftsystem.c \
ftbbox.c \
ftmm.c \
ftpfr.c \
ftsynth.c \
ftwinfnt.c \
ftlcdfil.c \
ftgxval.c \
ftotval.c \
ftpatent.c \
ftdebug.c \

FREETYE_ALL_SRC = $(FREETYPE_SRC_BASE)


FREETYPE_OBJS := $(addprefix obj/,$(notdir $(FREETYE_ALL_SRC:.c=.o)))
FREETYPE_OBJS += obj/truetype.o obj/sfnt.o obj/raster.o obj/smooth.o obj/ftgzip.o

#FREETYPE_FLAGS := -I$(FREETYPE_ROOT) -I$(FREETYPE_ROOT)include/ -D_DEBUG -D_LIB -DFT_DEBUG_LEVEL_ERROR -DFT_DEBUG_LEVEL_TRACE \
#-DFT2_BUILD_LIBRARY

FREETYPE_FLAGS :=  -I$(FREETYPE_ROOT) -I$(FREETYPE_ROOT)include/ -DNDEBUG -D_LIB -DFT2_BUILD_LIBRARY

LINUX_ROOT := ../Linux/
LINUX_CFILES := $(wildcard $(LINUX_ROOT)*.cpp)
LINUX_OBJS := $(addprefix obj/,$(notdir $(LINUX_CFILES:.cpp=.o)))

.PHONY: release
.PHONY: debug
.PHONY: all
.PHONY: clean
.PHONY: ai_dis
.PHONY: font_dis
.PHONY: font_cpp
.PHONY: dis

release: CFLAGS += $(FLAGSOPTIMIZE)
release: CXXFLAGS += $(FLAGSOPTIMIZE)
release: all

debug: CFLAGS += $(FLAGSDEBUG)
debug: CXXFLAGS += $(FLAGSDEBUG)
debug: all


ifeq ($(PLATFORM),android)


ifeq ($(ANDROID),v7)
all: ./app/src/main/jniLibs/armeabi-v7a/libgame.so

./app/src/main/jniLibs/armeabi-v7a/libgame.so : libgame.so
	cp libgame.so ./app/src/main/jniLibs/armeabi-v7a/libgame.so
else
all: ./app/src/main/jniLibs/armeabi/libgame.so

./app/src/main/jniLibs/armeabi/libgame.so : libgame.so
	cp libgame.so ./app/src/main/jniLibs/armeabi/libgame.so
endif



else
all: liblinuxgame.so linuxgame

liblinuxgame.so : libgame.so
	cp libgame.so liblinuxgame.so

linuxgame: $(LINUX_OBJS)
	$(CXX) $(CXXFLAGS) $(LINUX_OBJS) -lglfw -lGLEW -ldl -o linuxgame

endif

libgame.so: $(QUADRIS_OBJS) $(FREETYPE_OBJS) $(LPNG_OBJS) $(ZLIB_OBJS)
	$(CXX) $(CXXFLAGS) $(LINKFLAGS) $(FLAGSOPTLINK) $(QUADRIS_OBJS) $(ZLIB_OBJS) $(LPNG_OBJS) $(FREETYPE_OBJS) -o libgame.so $(LIBS)
	
obj/%.o: $(QUADRIS_ROOT)%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

obj/%.o: $(ZLIB_ROOT)%.c
	$(C) $(CFLAGS) $(ZLIB_FLAGS) -c -o $@ $<

obj/%.o: $(LPNG_ROOT)%.c
	$(C) $(CFLAGS) $(LPNG_FLAGS) -c -o $@ $<

obj/%.o: $(FREETYPE_BASE)%.c
	$(C) $(CFLAGS) $(FREETYPE_FLAGS) -c -o $@ $<

obj/%.o: $(LINUX_ROOT)%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f obj/*
	rm -f libgame.so

ai_dis:
	$(CXX) -O3 $(FLAGSCOMMON) $(FLAGSERROR) $(FLAGSDEFINE) $(FLAGSCXX) $(INCLUDES) -c -o obj/AI.o ../Quadris/AI.cpp
	$(OBJDUMP) -d obj/AI.o > AI.s

font_dis:
	$(CXX) -O3 $(FLAGSCOMMON) $(FLAGSERROR) $(FLAGSDEFINE) $(FLAGSCXX) $(INCLUDES) -c -o obj/Font.o ../Quadris/Font.cpp
	$(OBJDUMP) -D obj/Font.o > Font.s

statestack_dis:
	$(CXX) -O3 $(FLAGSCOMMON) $(FLAGSERROR) $(FLAGSDEFINE) $(FLAGSCXX) $(INCLUDES) -c -o obj/StateStack.tmp.o ../Quadris/StateStack.cpp
	$(OBJDUMP) -D obj/StateStack.tmp.o > StateStack.s

font_cpp:
	$(CXX) -O3 $(FLAGSCOMMON) $(FLAGSERROR) $(FLAGSDEFINE) $(FLAGSCXX) $(INCLUDES) -E -o Font.i ../Quadris/Font.cpp

dis:
	$(OBJDUMP) -d libgame.so > libgame.s


include freetypemodules

