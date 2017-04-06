//
//  UIColor+CDExtension.h
//  CDExtensionKit
//
//  Created by Jinxiao on 9/18/16.
//  Copyright © 2016 Codoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Alpha)

- (UIColor *)colorByApplyingAlpha:(CGFloat)alpha;

+ (UIColor *)colorFromRGBHex:(UInt32)hex;

@end
