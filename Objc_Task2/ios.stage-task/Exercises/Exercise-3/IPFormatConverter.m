#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray.count == 0) {
        return @"";
    }
    if ([[numbersArray valueForKeyPath:@"@max.intValue"] intValue] > 255) {
        return @"The numbers in the input array can be in the range from 0 to 255.";
    }
    if ([[numbersArray valueForKeyPath:@"@min.intValue"] intValue] < 0) {
        return @"Negative numbers are not valid for input.";
    }
    NSMutableArray *mutableNumbersArray = [NSMutableArray arrayWithArray:numbersArray];
    while ([mutableNumbersArray count] < 4) {
        [mutableNumbersArray addObject:[NSNumber numberWithInt:0]];
    }
    return [NSString stringWithFormat:@"%@.%@.%@.%@",
    mutableNumbersArray[0],
    mutableNumbersArray[1],
    mutableNumbersArray[2],
    mutableNumbersArray[3]];
}

@end
