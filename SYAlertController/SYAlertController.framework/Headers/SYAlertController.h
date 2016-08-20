//
//  SYAlertController.h
//  SYAlertViewControllerDemo
//
//  Created by 孙宇 on 16/8/19.
//  Copyright © 2016年 孙宇. All rights reserved.
//
//  GitHub: https://github.com/1102210843/SYAlertController
//

#import <UIKit/UIKit.h>

@class SYAlertAction;

typedef NS_ENUM(NSInteger, SYAlertStyle) {
    /* 默认风格 */
    SYAlertStyleDefault,
    /* ActionSheet 风格 */
    SYAlertStyleActionSheet,
};


typedef NS_ENUM(NSInteger, SYActionStyle) {
    SYActionStyleCancel,
    SYActionStyleDefault,
    SYActionStyleDestructive
};

typedef void(^SYActionBlock)(SYAlertAction *action);

@interface SYAlertAction : UIButton

@property (nonatomic, assign) SYActionStyle style;

+ (instancetype)actionWithTitle:(NSString *)title style:(SYActionStyle)style handler:(SYActionBlock)handler;

+ (instancetype)actionWithTitle:(NSString *)title titleColor:(UIColor *)titleColor style:(SYActionStyle)style handler:(SYActionBlock)handler;

@end

@interface SYAlertController : UIViewController

+ (instancetype)sharedWithTitle:(NSString *)title message:(NSString *)message style:(SYAlertStyle)style;

- (void)addAlertAction:(SYAlertAction *)action;
- (void)addAlertActions:(NSArray <SYAlertAction *>*)actions;

- (void)show;

@end
