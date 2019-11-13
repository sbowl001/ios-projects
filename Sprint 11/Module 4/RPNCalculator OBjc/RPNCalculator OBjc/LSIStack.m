//
//  LSIStack.m
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "LSIStack.h"
@interface LSIStack()
@property NSMutableArray *values;

@end

@implementation LSIStack

-(instancetype)init
{
    return [self initWithArray:@[]];
}

-(instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self){
        _values = [array mutableCopy];
    }
    return self;
}

-(void)pushValue:(double)value
{
    [self.values addObject:@(value)];
}
-(double)popLastValue
{
    if ([self.values count] <1) {return 0;}
    double result = [[self.values lastObject] doubleValue];
    [self.values removeLastObject];
    return result;
}
-(double)peekLastValue
{
    return [[self.values lastObject] doubleValue];
}
@end
//.m file: - Create a private NSMutableArray property called values that will be used every time your methods are called. - Implement the methods you declared in your .h file to alter your values array. - Inside of your initWith... initializer assign a mutableCopy of your array property to your internal values array.
