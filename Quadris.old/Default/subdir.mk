################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../AI.cpp \
../ColorManager.cpp \
../Engine.cpp \
../Font.cpp \
../FontManager.cpp \
../Image.cpp \
../PlatformEngine.cpp \
../Quad.cpp \
../QuadManager.cpp \
../QuadRandomBag.cpp \
../Quadris.cpp \
../StateStack.cpp \
../_Android.cpp \
../_Win32.cpp 

OBJS += \
./AI.o \
./ColorManager.o \
./Engine.o \
./Font.o \
./FontManager.o \
./Image.o \
./PlatformEngine.o \
./Quad.o \
./QuadManager.o \
./QuadRandomBag.o \
./Quadris.o \
./StateStack.o \
./_Android.o \
./_Win32.o 

CPP_DEPS += \
./AI.d \
./ColorManager.d \
./Engine.d \
./Font.d \
./FontManager.d \
./Image.d \
./PlatformEngine.d \
./Quad.d \
./QuadManager.d \
./QuadRandomBag.d \
./Quadris.d \
./StateStack.d \
./_Android.d \
./_Win32.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -DANDROID -O0 -g -Wall -c -fmessage-length=0 -fPIC -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


