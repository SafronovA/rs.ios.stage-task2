#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array.count == 0) {
        return @[];
    }
    NSMutableArray *numbersArray = [[NSMutableArray alloc] init];
    NSMutableArray *stringsArray = [[NSMutableArray alloc] init];
    for (NSArray *subArray in array) {
        if (![subArray isKindOfClass:[NSArray class]]) {
            return @[];
        }
        if ([subArray count] == 0) {
            continue;
        }
        for (NSObject *object in subArray) {
            if ([object isKindOfClass:[NSNumber class]]) {
                [numbersArray addObject:object];
            }
            if ([object isKindOfClass:[NSString class]]) {
                [stringsArray addObject:object];
            }
        }
        
    }
    if ([numbersArray count] > 0 && [stringsArray count] == 0) {
        return [numbersArray sortedArrayUsingSelector:@selector(compare:)];
    }
    if ([numbersArray count] == 0 && [stringsArray count] > 0) {
        return [stringsArray sortedArrayUsingSelector:@selector(compare:)];
    }
    if ([numbersArray count] > 0 && [stringsArray count] > 0) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
        return @[
            [numbersArray sortedArrayUsingSelector:@selector(compare:)],
            [stringsArray sortedArrayUsingDescriptors:@[sortDescriptor]]
        ];
        
    }
    return @[numbersArray, stringsArray];
}

@end
