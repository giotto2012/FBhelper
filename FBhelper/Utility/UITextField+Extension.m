//
//  UITextField+Extension.m
//  IWCBossDashboard
//
//  Created by Kuan-xun on 2016/5/28.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

- (void)setTextFieldLeftPadding:(CGFloat)leftPadding
{
    CGRect frame = self.frame;
    frame.size.width = leftPadding;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
}

@end
