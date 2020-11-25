//
//  UIView+CDExtension.m
//  CodoonSport
//
//  Created by Jinxiao on 9/7/16.
//  Copyright © 2016 Codoon. All rights reserved.
//

#import "UIView+CDLayoutExtension.h"

@implementation UIView (CDLayoutExtension)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end


CGFloat horizontalAdaptedSize(CGFloat size375, CGFloat size414) {
    CGFloat width = UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height;

    CGFloat minimumSize = size375; // 375
    CGFloat maximumSize = size414; // 414
    CGFloat size = (width - 375.0)/(414.0 - 375.0)*(maximumSize - minimumSize) + minimumSize;
    return size;
}

CGFloat verticalAdaptedSize(CGFloat size667, CGFloat size896) {
    CGFloat height = UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;

    CGFloat minimumSize = size667; // 667
    CGFloat maximumSize = size896; // 896
    CGFloat size = (height - 667.0)/(896.0 - 667.0)*(maximumSize - minimumSize) + minimumSize;
    return size;
}
