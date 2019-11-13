//
//  LSIDigitAccumulator.m
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "LSIDigitAccumulator.h"

@interface LSIDigit : NSObject
+ (instancetype)decimalPoint;
+ (instancetype)digitWithNumericValue:(NSInteger)value;
- (instancetype)initWithNumericValue:(NSInteger)value isDecimalPoint:(BOOL)isDecimalPoint;
@property (readonly, getter=isDecimalPoint) BOOL decimalPoint;
@property (readonly) NSInteger numericValue;
@property (readonly) NSString *stringValue;
@end

@implementation LSIDigit

+ (instancetype)decimalPoint
{
    return [[self alloc] initWithNumericValue:-1 isDecimalPoint:YES];
}

+ (instancetype)digitWithNumericValue:(NSInteger)value
{
    return [[self alloc] initWithNumericValue:value isDecimalPoint:NO];
}
- (instancetype)initWithNumericValue:(NSInteger)value isDecimalPoint:(BOOL)isDecimalPoint
{
    self = [super init];
    if (self) {
        _decimalPoint = isDecimalPoint;
        if (!isDecimalPoint) {
            _numericValue = value;
        }
    }
    return self;
}


- (NSUInteger)hash
{
    return self.isDecimalPoint ? NSUIntegerMax : self.numericValue;
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[LSIDigit class]]) { return NO; }
    LSIDigit *digit = (LSIDigit *)object;
    if (digit.isDecimalPoint && self.isDecimalPoint) { return YES; }
    return digit.numericValue == self.numericValue;
}

- (NSString *)stringValue
{
    if (self.isDecimalPoint) { return @"."; }
    return [@(self.numericValue) stringValue];
}

@end

@interface LSIDigitAccumulator()

@property NSMutableArray *digits;

@end

@implementation LSIDigitAccumulator

-(instancetype)init
{
    self = [super init];
    if (self){
        _digits = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)addDigitWithNumericValue:(NSInteger)value
{
    [self.digits addObject:[LSIDigit digitWithNumericValue:value]];
    
}
-(BOOL)addDecimalPoint
{
    LSIDigit *decimal = [LSIDigit decimalPoint];
    if ([self.digits containsObject:decimal]){
        return NO;
    }
    [self.digits addObject:decimal];
    return YES;
}
-(void)clear{
    [self.digits removeAllObjects];
}

-(double)value
{
    NSMutableString *digitsAsString = [NSMutableString string];
    for (LSIDigit *digit in self.digits){
        [digitsAsString appendString:digit.stringValue];
    }
    return [digitsAsString doubleValue];
}
@end
//.m file - Implement the digit accumulator. Use the Swift version for inspiration. Note that the Swift version uses an enum with associated values for digits, which you can't do directly in Objective-C. You'll have to come up with another solution! Note: For now, for simplicity, you can ignore the error handling that the Swift version does. Ignore repeated decimal digits instead of throwing an error, and assume that values will be in the range 0-9.
