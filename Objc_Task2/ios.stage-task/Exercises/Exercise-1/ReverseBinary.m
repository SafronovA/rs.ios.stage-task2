#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    int bitsCount = 8;
    UInt8 result = 0;
    for (int i = 0; i < bitsCount; ++i) {
        result += (n & 1)<<(bitsCount - 1 - i);
        n >>= 1;
    }
    return result;
}
