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
@property CGFloat oldHeight;
@end

@implementation CalculatorButton

- (void)awakeFromNib {
    self.defaultBackground = self.backgroundColor;
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
    CGFloat height = self.frame.size.height;
    // work around interface builder getting into an infinite recursive cycle of layoutSubviews
    if (height == self.oldHeight)
        return;
    self.oldHeight = height;
    
    self.layer.cornerRadius = height / 2;
    CGFloat fontSize = height * 11 / 24;
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
    [super layoutSubviews];
}

@end
