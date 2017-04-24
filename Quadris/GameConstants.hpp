#ifndef GAMECONSTANTS_H
#define GAMECONSTANTS_H

#include <cstdint>

class GameConstants
{
public:
	static const int        BOARD_WIDTH = 8;
	static const int        BOARD_HEIGHT = 20;
    static const int        LEVEL_RATIO_NUM = 1;
    static const int        LEVEL_RATIO_DEN = 2;

    static const int        LEVEL_DEC_RATIO_NUM = 1;
    static const int        LEVEL_DEC_RATIO_DEN = 1000;


	static const uint16_t   SAVE_XOR_KEY = 17750u;
};


#endif