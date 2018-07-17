//
//  UIImage+Custom.h
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/12/1.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Custom)
+ (UIImage *) imageWithView:(UIView *)view;
+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size;
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
@end
