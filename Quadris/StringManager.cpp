#ifdef _WIN32
#define _CRTDBG_MAP_ALLOC

#ifdef _DEBUG
#ifndef DBG_NEW
#define DBG_NEW new ( _NORMAL_BLOCK , __FILE__ , __LINE__ )
#define new DBG_NEW
#endif
#endif  // _DEBUG

#endif

#include <cassert>
#include "StringManager.h"

#ifdef _WIN32
#include <crtdbg.h>
#endif

StringManager::StringManager()
{
	m_values.insert(Pair("resourceError","No se puede encontrar el recurso %s. "
		"O no se puede leer. Intenta reinstalar la aplicación"));
	m_values.insert(Pair("lowSquare", "square_r0.2d"));
	m_values.insert(Pair("midSquare", "square_r1.2d"));
	m_values.insert(Pair("higSquare", "square_r2.2d"));
	m_values.insert(Pair("colorFile", "colors.bin"));
	m_values.insert(Pair("backgroundFile1", "bk1.png"));
	m_values.insert(Pair("backgroundFile2", "bk2.png"));
	m_values.insert(Pair("backgroundFile3", "bk3.png"));
	m_values.insert(Pair("mainFont",  "walkway.ttf"));
	m_values.insert(Pair("titleFont", "garageshockextended.ttf"));
	m_values.insert(Pair("fontProblem", "Existe un problema con las fuentes"));
	m_values.insert(Pair("atlasPath", "atlas.png"));
	m_values.insert(Pair("atlasDesc", "atlas.json"));
    m_values.insert(Pair("level", "Nivel: "));
    m_values.insert(Pair("lowgrat", "Genial"));
    m_values.insert(Pair("midgrat", "Excelente"));
    m_values.insert(Pair("higgrat", "Maravilloso"));
    m_values.insert(Pair("supgrat", "Supremo"));
	m_values.insert(Pair("roundrect", "roundedrect.2d"));
	m_values.insert(Pair("buttonsFont", "faemoot4o.ttf"));
	m_values.insert(Pair("playButton", "Jugar"));
	m_values.insert(Pair("buyButton", "Comprar"));
	m_values.insert(Pair("achivButton", "Logros"));
	m_values.insert(Pair("finishText", "Quadrish"));
	m_values.insert(Pair("achievFile", "achiv.csv"));
	m_values.insert(Pair("achivFrame", "achivframe.png"));
	m_values.insert(Pair("quitButton", "Abandonar"));
	m_values.insert(Pair("freeMoney", "Dinero Gratis"));
	m_values.insert(Pair("Power1Name", "Linea"));
	m_values.insert(Pair("Power1Desc", "Cambia la pieza actual por una linea. "
										"Costo: $50 por uso."));
	m_values.insert(Pair("Power2Name", "NivelArriba"));
	m_values.insert(Pair("Power2Desc", "Sube un nivel. La barra de nivel no se altera. El costo "
										"depende del nivel actual. Costo: $10 * Nivel Actual"));
    m_values.insert(Pair("Power1Name", "RachaLineas"));
    m_values.insert(Pair("Power1Desc", "Cambia la pieza actual por una linea. "
                                        "Despues apareceran 3 lineas consecutivamente. "
                                        "Costo: $80 por uso. Usarlo mientras el efecto aún "
                                        "esta activo reinicia el poder y lo cobra una vez más."));


    m_values.insert(Pair("PowerLvlName", "Pacificador"));
    m_values.insert(Pair("PowerLvlDesc", "Reduce la velocidad con la que la barra de nivel se reduce. Nivel %d"));

    m_values.insert(Pair("PowerLUpName", "Acelerador"));
    m_values.insert(Pair("PowerLUpDesc", "Aumenta la velocidad con la que la barra de nivel se llena al completar lineas. Nivel %d"));


	m_values.insert(Pair("requiredAchiv", "Requiere logro > "));
    m_values.insert(Pair("buyConfirmButton", "Confirmar compra"));
	m_values.insert(Pair("alreadyBought", "Comprado"));
}

const std::string& StringManager::ReturnString(const char* idx)
{
	return m_values[idx];
}
