//
//  BaseViewController.m
//  i-Report
//
//  Created by Alex on 2018/11/22.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 * 根据文字设定右侧按钮
 */
- (void)setNavigationBarRightItemWithTitle:(NSString *)title actionBlock:(void (^)(UIButton *button))actionBlock{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.rightBtnClickBlock = actionBlock;
}

#pragma mark - 右侧按钮点击事件
- (void)rightBtnClick:(UIButton *)sender{
    self.rightBtnClickBlock(sender);
}
@end
