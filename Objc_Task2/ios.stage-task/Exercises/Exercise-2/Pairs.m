#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger arrayLenth = array.count;
    NSInteger result = 0;
    for (int i = 0; i < arrayLenth; i++) {
        for (int k = i + 1; k < arrayLenth; k++) {
            if (ABS([array[i] intValue] - [array[k] intValue]) == [number intValue]) {
                result++;
            }
        }
    }
    return result;
}

@end
