//
//  CalculatorLabel.m
//  Mod Calculator
//
//  Created by Theodore Dubois on 8/31/18.
//  Copyright © 2018 Theodore Dubois. All rights reserved.
//

#import "DisplayLabel.h"

@interface DisplayLabel ()
@property UIView *highlightView;
@end

@implementation DisplayLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    self.highlightView = [UIView new];
    self.highlightView.backgroundColor = self.highlightedBackgroundColor;
    self.highlightView.layer.cornerRadius = 16;
    self.highlightView.hidden = YES;
    [self.superview addSubview:self.highlightView];
    [self.superview sendSubviewToBack:self.highlightView];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        CGRect textRect = [self textRectForBounds:self.bounds limitedToNumberOfLines:self.numberOfLines];
        textRect.origin = self.frame.origin;
        textRect = CGRectInset(textRect, -16, 4);
        self.highlightView.frame = textRect;
    }
    self.highlightView.hidden = !highlighted;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:))
        return YES;
    return NO;
}

- (void)copy:(id)sender {
    [[UIPasteboard generalPasteboard] setString:self.text];
}

- (BOOL)becomeFirstResponder {
    if (![super becomeFirstResponder])
        return NO;
    self.highlighted = YES;
    return YES;
}

- (BOOL)resignFirstResponder {
    if (![super resignFirstResponder])
        return NO;
    self.highlighted = NO;
    return YES;
}

@end
