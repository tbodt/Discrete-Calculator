//
//  CalculatorButton.m
//  Discrete Calculator
//
//  Created by Theodore Dubois on 7/24/18.
//  Copyright © 2018 Theodore Dubois. All rights reserved.
//

#import "CalculatorButton.h"

@interface CalculatorButton ()
@property UIColor *defaultBackground;
@end

@implementation CalculatorButton

- (void)awakeFromNib {
    self.defaultBackground = self.backgroundColor;
    self.layer.cornerRadius = self.frame.size.height / 2;
    [super awakeFromNib];
}

- (void)setHighlighted:(BOOL)highlighted {
    if (!highlighted) {
        [UIView animateWithDuration:0.5
                              delay:0 options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             self.backgroundColor = self.defaultBackground;
                         }
                         completion:nil];
    } else {
        self.backgroundColor = self.highlightedBackground;
    }
    [super setHighlighted:highlighted];
}

- (void)layoutSubviews {
    self.layer.cornerRadius = self.frame.size.height / 2;
    [super layoutSubviews];
}

@end
