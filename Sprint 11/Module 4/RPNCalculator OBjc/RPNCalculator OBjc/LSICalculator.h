//
//  LSICalculator.h
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LSICalculatorOperator) {
    LSICalculatorOperatorAdd,
    LSICalculatorOperatorSubtract,
    LSICalculatorOperatorMultiply,
    LSICalculatorOperatorDivide
};

@interface LSICalculator : NSObject

-(void)pushNumber:(double)value;
- (void)applyOperator:(LSICalculatorOperator)operator;
- (void)clear;

@property (readonly) double topValue; //not on instructions
@end

NS_ASSUME_NONNULL_END

//.h file: - Create an enum for the operations that will be calculated using typedef NS_ENUM(rawType, nameOfEnum) {};. Inside the curly braces you will just need to separate each item with a comma. - Declare three methods - (void)pushNumber:(double)value;, - (void)applyOperator:(YourEnumType)operator; and - (void)clear;. - Also declare a topValue property that will be a computed property in your .m file.
