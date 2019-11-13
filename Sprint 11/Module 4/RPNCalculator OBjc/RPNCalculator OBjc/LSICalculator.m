//
//  LSICalculator.m
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "LSICalculator.h"
#import "LSIStack.h"
@interface LSICalculator()

@property (nonatomic, strong) LSIStack *stack;
@end
@implementation LSICalculator

-(instancetype)init
{
    self = [super init];
    if (self) {
        _stack = [[LSIStack alloc] init];
    }
    return self;
}

-(void)pushNumber:(double)value
{
    [self.stack pushValue:value];
}
- (void)applyOperator:(LSICalculatorOperator)operator
{
    double operand2 = [self.stack popLastValue];
    double operand1 = [self.stack popLastValue];
    
    double result = 0.0;
    switch (operator) {
        case LSICalculatorOperatorAdd:
            result = operand1 + operand2;
            break;
        case LSICalculatorOperatorSubtract:
            result = operand1 - operand2;
            break;
        case LSICalculatorOperatorMultiply:
            result = operand1 * operand2;
            break;
        case LSICalculatorOperatorDivide:
            result = operand1 / operand2;
            break;
    }
    
    [self pushNumber:result];
}
- (void)clear
{
    self.stack = [[LSIStack alloc] init];
}

-(double)topValue
{
    return [self.stack peekLastValue];
}

@end
//.m file: - Every Calculator should have one Stack and only that calculator should know about it's Stack. Create a property XXXStack *stack in this file that we will use to implement the methods. - Implement the methods in this file by accessing the methods on your Stack model.
