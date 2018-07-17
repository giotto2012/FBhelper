//
//  UIImage+Extension.h
//  Grouper
//
//  Created by streams on 2014/10/2.
//  Copyright (c) 2014年 streams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
- (id)initRescaleImageToSize:(CGSize)size;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *)getCircleRectImageFromReferenceView:(UIImageView*)imageView;
- (UIImage *)imageWithColor:(UIColor *)color ;
@end
