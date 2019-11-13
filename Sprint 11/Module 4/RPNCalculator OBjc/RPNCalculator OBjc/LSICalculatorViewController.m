//
//  LSICalculatorViewController.m
//  RPNCalculator OBjc
//
//  Created by Stephanie Bowles on 11/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "LSICalculatorViewController.h"
#import "LSICalculator.h"
#import "LSIDigitAccumulator.h"
@interface LSICalculatorViewController ()

@property (nonatomic, strong) LSICalculator *calculator;

@property (nonatomic, strong) LSIDigitAccumulator *digitAccumulator;

@property (nonatomic, readonly) NSNumberFormatter *numberFormatter;
@end

@implementation LSICalculatorViewController

- (void)commonInit
{
    _calculator = [[LSICalculator alloc] init];
    _digitAccumulator = [[LSIDigitAccumulator alloc] init];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)numberButtonTapped:(UIButton *)sender
{
    [self.digitAccumulator addDigitWithNumericValue:sender.tag];
    [self updateTextFieldWithValue:self.digitAccumulator.value];
}
- (IBAction)decimalButtonTapped:(UIButton *)sender
{
    [self.digitAccumulator addDecimalPoint];
    [self updateTextFieldWithValue:self.digitAccumulator.value];
}
- (IBAction)returnButtonTapped:(UIButton *)sender {
    double value = self.digitAccumulator.value;
    [self.calculator pushNumber:value];
    [self.digitAccumulator clear];
    [self updateTextFieldWithValue:self.digitAccumulator.value];
}
- (IBAction)plusButtonTapped:(UIButton *)sender {
    [self.calculator applyOperator:LSICalculatorOperatorAdd];
    [self updateTextFieldWithValue:self.calculator.topValue];
}
- (IBAction)minusButtonTapped:(UIButton *)sender {
    [self.calculator applyOperator:LSICalculatorOperatorSubtract];
    [self updateTextFieldWithValue:self.calculator.topValue];
}
- (IBAction)multiplyButtonTapped:(UIButton *)sender {
    [self.calculator applyOperator:LSICalculatorOperatorMultiply];
        [self updateTextFieldWithValue:self.calculator.topValue];
 
}
- (IBAction)divideButtonTapped:(UIButton *)sender {
    [self.calculator applyOperator:LSICalculatorOperatorDivide];
    [self updateTextFieldWithValue:self.calculator.topValue];
}

-(void)updateTextFieldWithValue: (double)value
{
    self.textField.text = [self.numberFormatter stringFromNumber:@(value)];
}

@synthesize numberFormatter = _numberFormatter;
- (NSNumberFormatter *)numberFormatter
{
    if (!_numberFormatter) {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.allowsFloats = YES;
        _numberFormatter.maximumIntegerDigits = 20;
        _numberFormatter.minimumFractionDigits = 0;
        _numberFormatter.maximumFractionDigits = 20;
    }
    return _numberFormatter;
}

@end
