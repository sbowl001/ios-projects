//
//  LSIStack.h
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIStack : NSObject

-(instancetype)initWithArray:(NSArray *)array;

-(void)pushValue:(double)value;
-(double)popLastValue;
-(double)peekLastValue;
@end

//.h file: - Declare the methods to push, pop and peek the stack. - Declare an initWith initalizer that takes an NSArray.
NS_ASSUME_NONNULL_END
