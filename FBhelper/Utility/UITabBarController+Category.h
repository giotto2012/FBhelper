//
//  UITabBarController+Category.h
//  testTabBar
//
//  Created by editorial_1 on 2015/3/4.
//  Copyright (c) 2015年 MorningStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Category)

-(BOOL)setTabBarImageInsets:(UIEdgeInsets)aEdgeInsets;

-(BOOL)setTabBarImageArray:(NSArray *)array;

-(BOOL)setTabBarSelectImageArray:(NSArray *)array;

-(BOOL)setTabBarItemTitle:(NSArray *)array;

@end
