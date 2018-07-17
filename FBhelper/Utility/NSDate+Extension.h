//
//  NSDate+Extension.h
//  IWCBossDashboard
//
//  Created by 張宇樑 on 2015/11/13.
//  Copyright © 2015年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

- (NSString *)stringTimeInfo;
- (NSString *)stringByLocale;
- (NSString *)stringByLocaleDay;
- (NSString *)stringByLocaleDayNoYear;
- (NSString *)stringByCustomString:(NSString *)str;

- (NSInteger)daysBetweenDate:(NSDate*)toDateTime;
- (BOOL)isLaterThanDate:(NSDate *)date;
- (BOOL)isEarlierThanDate:(NSDate *)date;
- (BOOL)isSameDate:(NSDate *)date;
- (BOOL)isSameYear:(NSDate *)date;
+ (NSDate *)nowDate;
- (NSDate *)onlyYearMonthDayDate;
@end
