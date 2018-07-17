//
//  UITabBarController+Category.m
//  testTabBar
//
//  Created by editorial_1 on 2015/3/4.
//  Copyright (c) 2015年 MorningStar. All rights reserved.
//

#import "UITabBarController+Category.h"

@implementation UITabBarController (Category)

-(BOOL)setTabBarImageArray:(NSArray *)array
{
    NSArray *buffer = [self tabBar].items;
    
    for (int i =0 ; i<buffer.count ; i++)
    {
        UIImage *image = [array objectAtIndex:i];
        
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem *item = [buffer objectAtIndex:i];
        
        item.image = image;
    }
    
    return YES;
}
-(BOOL)setTabBarSelectImageArray:(NSArray *)array
{
    NSArray *buffer = [self tabBar].items;
    
    for (int i =0 ; i<buffer.count ; i++)
    {
        UIImage *image = [array objectAtIndex:i];
        
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem *item = [buffer objectAtIndex:i];
                
        item.selectedImage = image;
    }
    
    return YES;
}
-(BOOL)setTabBarImageInsets:(UIEdgeInsets)aEdgeInsets
{
    NSArray *buffer = [self tabBar].items;
    
    for (UITabBarItem *item in buffer)
    {
        item.imageInsets = aEdgeInsets;
        
    }
    
    
    return YES;
}

-(BOOL)setTabBarItemTitle:(NSArray *)array
{
    NSArray *buffer = [self tabBar].items;
    
    for (int i =0 ; i<buffer.count ; i++)
    {
        NSString *string = [array objectAtIndex:i];
        
        UITabBarItem *item = [buffer objectAtIndex:i];
                
        item.title = string;
    }
    
    return YES;
}

@end
