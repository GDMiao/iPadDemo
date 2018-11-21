//
//  BaseNavigationVController.m
//  iPadDemo
//
//  Created by Alex on 2018/11/20.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "BaseNavigationVController.h"
#import "LoginViewController.h"

@interface BaseNavigationVController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // 设置全屏滑动返回
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断如果是需要隐藏导航控制器的类，则隐藏
//    BOOL isHideNav = ([viewController isKindOfClass:[LoginViewController class]] ||
//                      [viewController isKindOfClass:[WYTargetVC class]]);
    BOOL isHideNav = ([viewController isKindOfClass:[LoginViewController class]]);
    
    [self setNavigationBarHidden:isHideNav animated:YES];
}

@end
