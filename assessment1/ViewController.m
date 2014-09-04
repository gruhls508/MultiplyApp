//
//  ViewController.m
//  assessment1
//
//  Created by Glen Ruhl on 7/24/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNumber;
@property (weak, nonatomic) IBOutlet UITextField *secondNumber;
@property (weak, nonatomic) IBOutlet UILabel *multiplicationSign;
@property (weak, nonatomic) IBOutlet UILabel *resultsDisplay;
@property (weak, nonatomic) IBOutlet UIButton *multiplyButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.firstNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.secondNumber.keyboardType = UIKeyboardTypeNumberPad;
}


- (IBAction)onMultiplyButtonPressed:(id)sender {
    //    NSString *theAnswer = [[NSString alloc] init];
    self.resultsDisplay.text = [NSString stringWithFormat: @"%i",
                                [self multiply]];

    [self.firstNumber resignFirstResponder];
    [self.secondNumber resignFirstResponder];

    if ([self multiply] < 0) {

        self.resultsDisplay.textColor = [UIColor redColor];

    } else if([self multiply] >= 0){

        self.resultsDisplay.textColor = [UIColor greenColor];
    }


    if (([self multiply] % 3) == 0 && ([self multiply] % 5) != 0) {

        self.resultsDisplay.text = @"fizz";

    } else if (([self multiply] % 5) == 0 && ([self multiply] % 3) != 0) {

        self.resultsDisplay.text = @"buzz";

    } else if ((([self multiply] % 3) == 0) && (([self multiply] % 5) == 0)) {

        self.resultsDisplay.text = @"fizzbuzz";
    }
}


- (int)multiply {
    return (self.firstNumber.text.intValue * self.secondNumber.text.intValue);
}


@end
