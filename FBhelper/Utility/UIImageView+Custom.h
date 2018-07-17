//
//  UIImageView+Custom.h
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/12/27.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageView(Custom)
- (UIImageView *)imageViewWithCircleShapeAndBoarderLine ;
- (UIImageView *)imageViewWithImageURLAndCache:(NSURL *)aImageUrl;
+ (void)removeImageCacheWithPictureURLString:(NSString *)pictureURLString;

+ (NSString *)getImageCacheKey:(NSString *)pictureURLString;
+ (NSString *)getImageUpdateTimeKey;
@end
