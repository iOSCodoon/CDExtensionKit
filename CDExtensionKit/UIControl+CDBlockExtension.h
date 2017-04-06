//
//  UIControl+Blocks.h
//  CodoonSport
//
//  Created by gaoyongyue on 7/27/14.
//  Copyright (c) 2014 codoon.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (CDBlockExtension)

- (void)addActionBlock:(void (^)(UIControl *control))actionBlock forControlEvents:(UIControlEvents)event;
- (void)setActionBlock:(void (^)(UIControl *control))actionBlock forControlEvents:(UIControlEvents)event;

@end
