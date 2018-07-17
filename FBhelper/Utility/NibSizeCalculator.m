//
//  NibSizeCalculator.m
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/10/8.
//  Copyright © 2015年 IWC. All rights reserved.
//

#import "NibSizeCalculator.h"

static NibSizeCalculator *sharedInstance;
@implementation NibSizeCalculator
@synthesize nibSizeInCache;
+ (NibSizeCalculator *) sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[NibSizeCalculator alloc] init];
        sharedInstance.nibSizeInCache = [[NSCache alloc] init];
    }
    return sharedInstance;
}

- (CGSize)sizeForNibNamed:(NSString *)nibName {
    CGSize nibSize = CGSizeZero;
    UIView *nibView = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
    if ([self.nibSizeInCache objectForKey:nibName]) {
        NSString *sizeString = [self.nibSizeInCache objectForKey:nibName];
        nibSize = CGSizeFromString(sizeString);
    }else {
        if (nibName != nil) {
            nibSize = CGSizeMake(CGRectGetWidth(nibView.bounds), CGRectGetHeight(nibView.bounds));
            [self.nibSizeInCache setObject:NSStringFromCGSize(nibSize) forKey:nibName];
        }
        
    }
    
    
    return nibSize;
}


- (NSString *)nibSuffixForScreenSize {
    if ([self.nibSizeInCache objectForKey:@"nibSuffixForScreenSize"]) {
        return [self.nibSizeInCache objectForKey:@"nibSuffixForScreenSize"];
    }
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    NSString *suffix = @"";
    if (screenSize.height == 960) {
        suffix = @"_iPhone35";
    }else if(screenSize.height == 1136){
        suffix = @"";
    }else if(screenSize.height == 1334){
        suffix = @"_iPhone47";
    }else if(screenSize.height == 2208){
        suffix = @"_iPhone55";
    }
    [self.nibSizeInCache setObject:suffix forKey:@"nibSuffixForScreenSize"];
    
    return suffix;
}

- (CGPoint)customScalePointForScreenSize {
    if ([self.nibSizeInCache objectForKey:@"customScaleForScreenSize"]) {
        return [[self.nibSizeInCache objectForKey:@"customScaleForScreenSize"] CGPointValue];
    }
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    CGFloat i5ScreenWidth = 640;
    CGFloat i5ScreenHeight = 1136;
    
    CGFloat customScaleX = 0;
    CGFloat customScaleY = 0;
    if ([[self nibSuffixForScreenSize] isEqualToString:@"_iPhone55"]) {
        customScaleX = 1.35f;
        customScaleY = 1.35f;
    }else {
        customScaleX = screenSize.width/i5ScreenWidth;
        customScaleY = screenSize.height/i5ScreenHeight;
    }
    if (customScaleX == 0) {
        customScaleX = 1;
    }
    if (customScaleY == 0) {
        customScaleY = 1;
    }
    CGPoint newScale = CGPointMake(customScaleX, customScaleY);
    [self.nibSizeInCache setObject:NSStringFromCGPoint(newScale) forKey:@"customScaleForScreenSize"];
    
    return newScale;
}

@end
