//
//  SYAlertController.h
//  SYAlertViewControllerDemo
//
//  Created by 孙宇 on 16/8/19.
//  Copyright © 2016年 孙宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SYAlertAction;

/**
 *  弹窗风格
 */
typedef NS_ENUM(NSInteger, SYAlertStyle) {
    /**
     *  默认风格
     */
    SYAlertStyleDefault,
    /**
     *  ActionSheet 风格
     */
    SYAlertStyleActionSheet,
};

/**
 *  按钮风格
 */
typedef NS_ENUM(NSInteger, SYActionStyle) {
    /**
     *  取消按钮风格
     */
    SYActionStyleCancel,
    /**
     *  默认按钮风格
     */
    SYActionStyleDefault,
    /**
     *  危害性按钮风格
     */
    SYActionStyleDestructive
};

typedef void(^SYActionBlock)(SYAlertAction *action);

@interface SYAlertAction : UIButton

/**
 *  按钮风格
 */
@property (nonatomic, assign) SYActionStyle style;

/**
 *  普通创建方法
 *
 *  @param title   按钮文字
 *  @param style   按钮风格
 *  @param handler 点击事件回调
 *
 *  @return 返回按钮实例
 */
+ (instancetype)actionWithTitle:(NSString *)title style:(SYActionStyle)style handler:(SYActionBlock)handler;

/**
 *  可定制按钮颜色创建方法
 *
 *  @param title      按钮文字
 *  @param titleColor 文字颜色
 *  @param style      按钮风格
 *  @param handler    点击事件回调
 *
 *  @return 返回按钮实例
 */
+ (instancetype)actionWithTitle:(NSString *)title titleColor:(UIColor *)titleColor style:(SYActionStyle)style handler:(SYActionBlock)handler;

/**
 *  自定制按钮文字
 *
 *  @param attTitle 可编辑字符串
 *  @param style    按钮风格，不影响按钮文字效果
 *  @param handler  点击事件回调
 *
 *  @return 返回按钮实例
 */
+ (instancetype)actionWithAttTitle:(NSAttributedString *)attTitle style:(SYActionStyle)style handler:(SYActionBlock)handler;

@end

@interface SYAlertController : UIViewController

/**
 *  弹窗控件初始化
 *
 *  @param title   标题 可使用 NSString 和 NSAttributedString
 *  @param message 内容 可使用 NSString 和 NSAttributedString
 *  @param style   风格
 *
 *  @return 返回弹窗实例
 */
+ (instancetype)sharedWithTitle:(id)title message:(id)message style:(SYAlertStyle)style;


#pragma mark - 添加按钮
- (void)addAlertAction:(SYAlertAction *)action;
- (void)addAlertActions:(NSArray <SYAlertAction *>*)actions;

/**
 *  显示弹窗
 */
- (void)show;

@end
