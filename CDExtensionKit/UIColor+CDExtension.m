//
//  UIColor+CDExtension.h
//  CDExtensionKit
//
//  Created by Jinxiao on 9/18/16.
//  Copyright © 2016 Codoon. All rights reserved.
//

#import "UIColor+CDExtension.h"

@implementation UIColor (CDExtension)

- (UIColor *)colorByApplyingAlpha:(CGFloat)alpha {
    CGColorRef oldColor = CGColorCreateCopyWithAlpha([self CGColor], alpha);
    UIColor *newColor = [UIColor colorWithCGColor:oldColor];
    CGColorRelease(oldColor);
    
    return newColor;
}

+ (UIColor *)colorFromRGBHex:(UInt32)hex {
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
    
	return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

@end
