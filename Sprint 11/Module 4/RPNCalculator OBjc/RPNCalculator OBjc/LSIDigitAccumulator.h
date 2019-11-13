//
//  LSIDigitAccumulator.h
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIDigitAccumulator : NSObject

-(void)addDigitWithNumericValue:(NSInteger)value;
-(BOOL)addDecimalPoint;
-(void)clear;

@property (readonly) double value;

@end

NS_ASSUME_NONNULL_END
//.h file - Your XXXDigitAccumulator class should have three methods and one property: - -addDigitWithNumericValue: - -addDecimalPoint - -clear - value - a readonly double property
