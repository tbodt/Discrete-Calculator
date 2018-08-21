//
//  ViewController.h
//  Discrete Calculator
//
//  Created by Theodore Dubois on 7/23/18.
//  Copyright © 2018 Theodore Dubois. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef unsigned long long CalcNumber;
#define CALC_ERR -1ull

typedef NS_ENUM(NSUInteger, CalcOperator) {
    OpNone = 0,
    OpAdd = 1,
    OpSub = 2,
    OpMul = 3,
    OpDiv = 4,
    OpPow = 5,
};

@interface ViewController : UIViewController <UITextFieldDelegate>

@end

