//
//  LoginTextField.m
//  i-Report
//
//  Created by Alex on 2018/11/22.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "LoginTextField.h"

@implementation LoginTextField

- (void)addLeftView:(NSString *)imageName
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    self.leftView =imgView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addFillet
{
    self.layer.cornerRadius = 23;
    self.layer.masksToBounds = YES;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //像右边偏15
    return iconRect;
}

//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{

    return CGRectInset(bounds, 50, 0);

}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 50, 0);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
