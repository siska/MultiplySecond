//
//  ViewController.m
//  MultipleSecond
//
//  Created by S on 1/12/15.
//  Copyright (c) 2015 Ryan Siska. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property NSInteger finalValue;
@property (strong, nonatomic) IBOutlet UISlider *valueSlider;
@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberTextField.keyboardType = UIKeyboardTypeDecimalPad;
}

- (IBAction)onCalculateButtonPressed:(id)sender {
    [self calculateFinalValue];
    [self setBackgroundColor];
    //self.numberTextField.text = @"";
    [self.view endEditing:YES];
}

- (IBAction)onSliderDragged:(id)sender {
    self.finalValue = floorf(self.valueSlider.value);
    self.multiplierLabel.text = [NSString stringWithFormat:@"%ld", (long)self.finalValue];
}

-(void)calculateFinalValue
{
    NSInteger textFieldNumber = self.numberTextField.text.integerValue;
    NSInteger multiplierLabelNumber = self.multiplierLabel.text.integerValue;

    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        self.finalValue = textFieldNumber * multiplierLabelNumber;
    }
    else
    {
        self.finalValue = textFieldNumber / multiplierLabelNumber;
    }

    NSLog(@"%ld", (long)self.finalValue);

    [self showFinalValue];
}

-(void)showFinalValue
{
    if (self.finalValue % 5 == 0 && self.finalValue % 3 == 0)
    {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if (self.finalValue % 5 == 0)
    {
        self.answerLabel.text = @"buzz";
    }
    else if (self.finalValue % 3 == 0)
    {
        self.answerLabel.text = @"fizz";
    }
    else
    {
        self.answerLabel.text = [NSString stringWithFormat:@"%ld", (long)self.finalValue];
    }
}

-(void)setBackgroundColor
{
    if (self.finalValue >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


@end
