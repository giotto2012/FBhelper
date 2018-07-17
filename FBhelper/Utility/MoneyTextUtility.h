//
//  MoneyTextUtility.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/10/8.
//  Copyright © 2015年 IWC. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface MoneyTextUtility : NSObject
+ (NSString *)moneyTextFormatWithMKSign:(NSString *)originalText;
+ (NSString *)moneyTextFormatWithMKDollarSign:(NSString *)originalText;
@end
