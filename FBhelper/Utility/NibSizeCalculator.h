//
//  NibSizeCalculator.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/10/8.
//  Copyright © 2015年 IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NibSizeCalculator : NSObject
{
    NSCache *nibSizeInCache;
}
@property (nonatomic,retain) NSCache *nibSizeInCache;
+ (NibSizeCalculator *)sharedInstance;
- (CGSize)sizeForNibNamed:(NSString *)nibName;
- (NSString *)nibSuffixForScreenSize;
- (CGPoint)customScalePointForScreenSize;
@end