//
//  UIControl+Blocks.m
//  CodoonSport
//
//  Created by gaoyongyue on 7/27/14.
//  Copyright (c) 2014 codoon.com. All rights reserved.
//

#import "UIControl+CDBlockExtension.h"

#import <objc/runtime.h>

@interface CDUIControlTarget : NSObject

@property (nonatomic, copy) void (^block) (UIControl *control);

+ (id)targetWithAction:(void (^)(UIControl *control))aBlock;
- (id)initWithAction:(void (^)(UIControl *control))aBlock;
- (void)eventReceiver:(id)sender;

@end

@implementation CDUIControlTarget

+ (id)targetWithAction:(void (^)(UIControl *control))aBlock {
    return [[CDUIControlTarget alloc] initWithAction:aBlock];
}

- (id)initWithAction:(void (^)(UIControl *control))aBlock {
    self = [self init];
    if (self) {
        self.block = aBlock;
    }
    
    return self;
}

- (void)eventReceiver:(id)sender {
    if(_block) {
        _block(sender);
    }
}

@end

@interface UIControl (CDBlockExtension_)
@property (nonatomic, retain) NSMutableArray *cd_blocks;
@end

@implementation UIControl (CDBlockExtension)

- (void)addActionBlock:(void (^)(UIControl *control))actionBlock forControlEvents:(UIControlEvents)event {
    NSMutableArray *actions = self.blocks;
    CDUIControlTarget *target = [CDUIControlTarget targetWithAction:actionBlock];
    [self addTarget:target action:@selector(eventReceiver:) forControlEvents:event];
    [actions addObject:target];
}

- (void)setActionBlock:(void (^)(UIControl *control))actionBlock forControlEvents:(UIControlEvents)event {
    NSMutableArray *actions = self.blocks;
    [actions removeAllObjects];
    [self removeTarget:nil action:NULL forControlEvents:event];
    CDUIControlTarget *target = [CDUIControlTarget targetWithAction:actionBlock];
    [self addTarget:target action:@selector(eventReceiver:) forControlEvents:event];
    [actions addObject:target];
}

- (void)setBlocks:(NSMutableArray *)blocks {
    objc_setAssociatedObject(self, "CDBlockExtension_BlocksKey", blocks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)blocks {
    NSMutableArray *blocks = objc_getAssociatedObject(self, "CDBlockExtension_BlocksKey");
    if (!blocks) {
        blocks = [NSMutableArray array];
        self.blocks = blocks;
    }
    return blocks;
}

@end

