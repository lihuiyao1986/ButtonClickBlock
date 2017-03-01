//
//  UIButton+ClickBlock.h
//  Test
//
//  Created by jk on 2017/3/1.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)(UIButton *btn);

@interface UIButton (ClickBlock)

@property(nonatomic,weak)ButtonClickBlock clickBlock;

-(void)clickWithCompletion:(ButtonClickBlock)completion;

@end
