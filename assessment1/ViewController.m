//
//  ViewController.m
//  assessment1
//
//  Created by Glen Ruhl on 7/24/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "ViewController.h"

#pragma initial setup

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNumber;
@property (weak, nonatomic) IBOutlet UILabel *myMultiplier;
@property (weak, nonatomic) IBOutlet UILabel *resultsDisplay;
@property (weak, nonatomic) IBOutlet UIButton *multiplyButton;

@end


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.firstNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.resultsDisplay.hidden = YES;
}



#pragma methods

- (IBAction)onMultiplyButtonPressed:(id)sender {

    [self.firstNumber resignFirstResponder];
    [self.myMultiplier resignFirstResponder];


    self.resultsDisplay.text = ([self multiply] % 3 == 0 && [self multiply] % 5 != 0) ?

                                                                              @"fizz" :

                               ([self multiply] % 3 != 0 && [self multiply] % 5 == 0) ?

                                                                              @"buzz" :

                               ([self multiply] % 3 == 0 && [self multiply] % 5 == 0) ?

                                                                           @"fizzbuzz":

                                    [NSString stringWithFormat: @"%i",[self multiply]];


    self.view.backgroundColor = ([self multiply] > 20) ? [UIColor greenColor]: [UIColor whiteColor];

    self.resultsDisplay.hidden = (self.resultsDisplay.hidden) ? NO : NO ;
}


- (int)multiply {
    return (self.firstNumber.text.intValue * self.myMultiplier.text.intValue);
}

- (IBAction)onSliderChanged:(UISlider *)slider{

    int i = slider.value;
    self.myMultiplier.text = [NSString stringWithFormat:@"%i", i];
}

@end
