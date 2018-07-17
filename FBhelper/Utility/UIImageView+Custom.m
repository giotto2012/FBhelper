//
//  UIImageView+Custom.m
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/12/27.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import "UIImageView+Custom.h"
#import "UIImageView+AFNetworking.h"

#define ImageCahcheKey @"ImageCache"
@implementation UIImageView(Custom)

- (UIImageView *)imageViewWithCircleShapeAndBoarderLine {
    //圓角
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width / 2.0f;
    
    //圓框
    self.layer.borderWidth = 1.5f;
    self.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    return self;
}

- (UIImageView *)imageViewWithImageURLAndCache:(NSURL *)aImageUrl {
    
    NSString *imageCacheKey = [[self class] getImageCacheKey:[aImageUrl absoluteString]];
    NSString *imageUpdateTimeKey = [[self class] getImageUpdateTimeKey:[aImageUrl absoluteString]];
    //Cache圖片
    NSData *imageCacheData = [[LocalCache sharedInstance] dataForKey:imageCacheKey];
    //現在時間
    double nowLongTime = [[NSDate date] timeIntervalSince1970];
    //圖片需要更新的時間
    double imageUpdateTimeInCache = [[LocalCache sharedInstance] numberForKey:imageUpdateTimeKey].doubleValue;
    
    //Cache裡的圖片是空的，或是現在的時間大於圖片需要更新時間，就重新下載圖片
    if(imageCacheData == nil || nowLongTime > imageUpdateTimeInCache){
        [self setImageWithURL:aImageUrl];
        NSData *imageData = UIImagePNGRepresentation(self.image);
        if (imageData != nil){
            
            [[LocalCache sharedInstance] saveWithData:imageData WithKey:imageCacheKey];
            
            double imageAliveTime = 3600 * 24 * 3; //1小時3600秒*24小時*3天
//            double imageAliveTime = 10; //測試10秒
            double nextImageUpdateTime = nowLongTime + imageAliveTime;
            [[LocalCache sharedInstance] saveWithNumber:[NSNumber numberWithDouble:nextImageUpdateTime] WithKey:imageUpdateTimeKey];
        }
        imageCacheData = imageData;
    }

    UIImage *image = [[UIImage alloc] initWithData:imageCacheData];
    [self setImage:image];
    

    return self;
}

+ (NSString *)getImageCacheKey:(NSString *)pictureURLString{
    return [NSString stringWithFormat:@"ImageCache-%@",pictureURLString];
}

+ (NSString *)getImageUpdateTimeKey:(NSString *)pictureURLString{
    return [NSString stringWithFormat:@"ImageCache-%@-NextUpdateTime",pictureURLString];
}

+ (void)removeImageCacheWithPictureURLString:(NSString *)pictureURLString{
    NSString *pictureCacheKey = [self getImageCacheKey:pictureURLString];
    NSString *pictureUpdateTimeKey = [[self class] getImageUpdateTimeKey:pictureURLString];
    
    [[LocalCache sharedInstance] removeObjectForKey:pictureCacheKey];
    [[LocalCache sharedInstance] removeObjectForKey:pictureUpdateTimeKey];
    
}

@end
