//
//  UIButton+ClickBlock.m
//  Test
//
//  Created by jk on 2017/3/1.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "UIButton+ClickBlock.h"
#import <objc/runtime.h>

static void *clickBlockKey = @"clickBlockKey";

@implementation UIButton (ClickBlock)

-(void)setClickBlock:(ButtonClickBlock)clickBlock{
    objc_setAssociatedObject(self, &clickBlockKey, clickBlock, OBJC_ASSOCIATION_ASSIGN);
}

-(ButtonClickBlock)clickBlock{
    return objc_getAssociatedObject(self, &clickBlockKey);
}

-(void)clickWithCompletion:(ButtonClickBlock)completion{
    self.clickBlock = completion;
    [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClicked:(UIButton*)sender{
    if (self.clickBlock) {
        self.clickBlock(sender);
    }
}

@end
