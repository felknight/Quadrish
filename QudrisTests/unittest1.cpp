#include "CppUnitTest.h"
#include "../Quadris/AI.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;

namespace QudrisTests
{		
	TEST_CLASS(AILogic)
	{
	public:
		
		TEST_METHOD(LowerPlaceColumn)
		{
			QuadSquare* matrix = new QuadSquare[AI::BOARD_HEIGHT*AI::BOARD_WIDTH];
			int32_t res = AI::LowerPlaceColumn(matrix, 0, 4);
			Assert::AreEqual(0, res,L"Empty matrix", LINE_INFO());
			for (int i = 0; i < 4; i++)
				matrix[i*AI::BOARD_WIDTH].Flags |= QuadSquare::ACTIVE;
			res = AI::LowerPlaceColumn(matrix, 0, 2);
			Assert::AreEqual(4, res, L"Matrix with one line", LINE_INFO());
			res = AI::LowerPlaceColumn(matrix, 1, 2);
			Assert::AreEqual(0, res, L"Matrix with one line", LINE_INFO());

			for (int i = 2; i < 4; i++)
				matrix[i*AI::BOARD_WIDTH+1].Flags |= QuadSquare::ACTIVE;

			res = AI::LowerPlaceColumn(matrix, 1, 2);
			Assert::AreEqual(0, res, L"Search space of two", LINE_INFO());
			res = AI::LowerPlaceColumn(matrix, 1, 3);
			Assert::AreEqual(4, res, L"Search space of two", LINE_INFO());
			res = AI::LowerPlaceColumn(matrix, 1, 4);
			Assert::AreEqual(4, res, L"Search space of two", LINE_INFO());
			delete[] matrix;
		}

		TEST_METHOD(GravityQuad)
		{
			QuadSquare* matrix = new QuadSquare[AI::BOARD_HEIGHT*AI::BOARD_WIDTH];
			SPoint q[4] = { { 0, 0 }, { 1, 1 }, { 2, 1 }, { 0, 1 } };
			int32_t res = AI::GravityQuad(matrix, q);

			Assert::AreEqual(0, res, L"Empty Matrix", LINE_INFO());
			
			for (int i = 0; i < 4; i++)
				matrix[q[i].X + q[i].Y * AI::BOARD_WIDTH].Flags |= QuadSquare::ACTIVE;

			SPoint q0[4] = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 1, 1 } };
			res = AI::GravityQuad(matrix, q0);

			Assert::AreEqual(2, res, L"1 LQuad", LINE_INFO());

			for (int i = 0; i < 4; i++)
				q0[i].Y += res;

			for (int i = 0; i < 4; i++)
				matrix[q0[i].X + q0[i].Y * AI::BOARD_WIDTH].Flags |= QuadSquare::ACTIVE;

			SPoint q1[4] = { { 1, 1 }, { 2, 1 }, { 2, 0 }, { 2, 2 } };
			res = AI::GravityQuad(matrix, q1);

			Assert::AreEqual(3, res, L"2 Quads", LINE_INFO());

			for (int i = 0; i < 4; i++)
				q1[i].Y += res;

			for (int i = 0; i < 4; i++)
				matrix[q1[i].X + q1[i].Y * AI::BOARD_WIDTH].Flags |= QuadSquare::ACTIVE;

			SPoint q2[4] = { { 0, 0 }, { 0, 1 }, { 0, 2 }, { 1, 1 } };

			res = AI::GravityQuad(matrix, q2);

			Assert::AreEqual(4, res, L"3 Quads", LINE_INFO());
		}

	};
}