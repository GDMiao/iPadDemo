//
//  BaseViewController.h
//  i-Report
//
//  Created by Alex on 2018/11/22.
//  Copyright © 2018 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
/**
 *  右侧按钮点击事件
 */
@property(nonatomic, copy) void (^rightBtnClickBlock)(UIButton * rightBtn);
/**
 * 根据文字设定右侧按钮
 */
- (void)setNavigationBarRightItemWithTitle:(NSString *)title actionBlock:(void (^)(UIButton *button))actionBlock;
@end

NS_ASSUME_NONNULL_END
