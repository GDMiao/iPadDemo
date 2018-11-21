//
//  LoginViewController.m
//  iPadDemo
//
//  Created by Alex on 2018/11/20.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTextField.h"
@interface LoginViewController ()
@property (nonatomic, strong) UIView *whiteBackGroudView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) LoginTextField *accoutTextField;
@property (nonatomic, strong) LoginTextField *passWordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(27, 28, 40);
    
    [self addLoginView];
    // Do any additional setup after loading the view.
}

- (void)addLoginView {
    UIView *superview = self.view;
    UIView *whitbgView = [UIView new];
    whitbgView.backgroundColor = [UIColor whiteColor];
    whitbgView.layer.cornerRadius = 20;
    whitbgView.layer.masksToBounds = YES;
    [superview addSubview:whitbgView];
    [whitbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(250);
        make.left.equalTo(superview.mas_left).with.offset(20);
        make.right.equalTo(superview.mas_right).with.offset(-20);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-300);
    }];
   
    UIImageView *avatarImgView = [UIImageView new];
    avatarImgView.backgroundColor = RGB(203, 203, 203);
    [whitbgView addSubview:avatarImgView];
    [avatarImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whitbgView);
        make.top.equalTo(whitbgView.mas_top).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(230, 80));
    }];
    
    UIImageView *darkLine = [UIImageView new];
    darkLine.backgroundColor = RGB(218, 218, 218);
    [whitbgView addSubview:darkLine];
    [darkLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(whitbgView);
        make.top.equalTo(avatarImgView.mas_bottom).with.offset(40);
        make.height.equalTo(@0.5);
    }];
    
    LoginTextField *accoutTF = [LoginTextField new];
    accoutTF.placeholder = @"请输入用户名";
    accoutTF.enabled = YES;
    accoutTF.backgroundColor = RGB(236, 236, 236);
    accoutTF.keyboardType = UIKeyboardTypeNumberPad;
    accoutTF.leftViewMode = UITextFieldViewModeAlways;
    accoutTF.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [accoutTF addFillet];
    UIImageView *aimgVleft = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    aimgVleft.image = [UIImage imageNamed:@"accoutIcon"];
    aimgVleft.backgroundColor = [UIColor yellowColor];
    accoutTF.leftView = aimgVleft;
    [whitbgView addSubview:accoutTF];
    [accoutTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(darkLine.mas_bottom).equalTo(@40);
        make.left.equalTo(whitbgView.mas_left).offset(40);
        make.right.equalTo(whitbgView.mas_right).offset(-40);
        make.height.equalTo(@50);
    }];
    
    LoginTextField *passWordTF = [LoginTextField new];
    passWordTF.placeholder = @"请输入密码";
    passWordTF.enabled = YES;
    passWordTF.secureTextEntry = YES;
    passWordTF.backgroundColor = RGB(236, 236, 236);
    passWordTF.keyboardType = UIKeyboardTypeNumberPad;
    passWordTF.leftViewMode = UITextFieldViewModeAlways;
    passWordTF.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [passWordTF addFillet];
    UIImageView *pimgVleft = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    pimgVleft.image = [UIImage imageNamed:@"passwordIcon"];
    pimgVleft.backgroundColor = [UIColor yellowColor];
    passWordTF.leftView = pimgVleft;
    [whitbgView addSubview:passWordTF];
    [passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accoutTF.mas_bottom).equalTo(@30);
        make.left.equalTo(whitbgView.mas_left).offset(40);
        make.right.equalTo(whitbgView.mas_right).offset(-40);
        make.height.equalTo(@50);
    }];
    
    UIButton *loginBt = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBt.backgroundColor = RGB(17, 143, 255);
    [loginBt setTitle:@"登录" forState:UIControlStateNormal];
    loginBt.layer.cornerRadius = 23;
    loginBt.layer.masksToBounds = YES;
    [whitbgView addSubview:loginBt];
    [loginBt addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passWordTF.mas_bottom).equalTo(@30);
        make.left.equalTo(whitbgView.mas_left).offset(40);
        make.right.equalTo(whitbgView.mas_right).offset(-40);
        make.height.equalTo(@50);
    }];
    
    
    self.whiteBackGroudView = whitbgView;
    self.avatarImageView = avatarImgView;
    self.accoutTextField = accoutTF;
    self.passWordTextField = passWordTF;
}

     
 - (void)loginButtonAction:(UIButton *)sender
 {
     NSLog(@"login");
 }

@end
