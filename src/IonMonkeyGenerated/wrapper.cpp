#include <stdint.h>
#include <algorithm>
#include <cmath>
namespace math {
    using namespace std;
    int32_t exp(double x) {
        int32_t e;
        frexp(x, &e);
        return e;
    }
}
struct range;

uint32_t countLeadingZeroes(uint32_t x);
range newInt32Range(int32_t l, int32_t u);
range newUInt32Range(uint32_t l, uint32_t u);
range setLowerInit(int64_t, range &);
range setUpperInit(int64_t, range &);
bool canBeInfiniteOrNan(range &r);
bool missingAnyInt32Bounds(range &, range &);
uint16_t numBits(range &);
bool canHaveSignBitSet(range &);
range Range3(int64_t, int64_t, bool);
range Range4(int64_t, int64_t, bool, bool, uint16_t);
range Range6(int64_t, bool, int64_t, bool, bool, bool, uint16_t);
bool canBeZero(range &r);
bool canBeNan(range &r);
bool isFiniteNonNegative(range &);
bool isFiniteNegative(range &);
bool hasInt32Bounds(range &);
uint16_t exponentImpliedByInt32Bounds(range &);
range nullRange(bool);

#include "code.cpp"
