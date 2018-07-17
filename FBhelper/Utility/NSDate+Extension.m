//
//  NSDate+Extension.m
//  IWCBossDashboard
//
//  Created by 張宇樑 on 2015/11/13.
//  Copyright © 2015年 Digiwin IWC. All rights reserved.
//

#import "NSDate+Extension.h"
#import "DefaultDateFormatter.h"

@implementation NSDate (Extension)

- (NSString *)stringTimeInfo
{
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    
    NSDate *  senddate=[NSDate date];
    
    //结束时间
    NSDate *endDate = self;
    //当前时间
    NSDate *senderDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:senddate]];
    //得到相差秒数
    NSTimeInterval time=[senderDate timeIntervalSinceDate:endDate];
    
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    
    
    if (days > 6)
    {
        return [self stringByLocaleDay];
    }
    else if (days > 0)
    {
        return [NSString stringWithFormat:@"%i%@",days,IWCLocalString(@"Day_Ago")];
    }
    else if (hours > 0)
    {
        return [NSString stringWithFormat:@"%i%@",hours,IWCLocalString(@"Hour_Ago")];
    }
    else
        return IWCLocalString(@"Date_Just");
    
}

- (NSString *)stringByLocale
{
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    
    
    NSString *dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}

- (NSString *)stringByLocaleDay
{
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    
    NSString *dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}

- (NSString *)stringByLocaleDayNoYear
{
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:@"MM/dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}
- (NSString *)stringByCustomString:(NSString *)str
{
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:str];
    
    NSString *dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}
- (NSInteger)daysBetweenDate:(NSDate *)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:self];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

- (BOOL)isLaterThanDate:(NSDate *)date
{
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isEarlierThanDate:(NSDate *)date
{
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isSameDate:(NSDate *)date
{
    return (![self isLaterThanDate:date] && ![self isEarlierThanDate:date]);
}

- (BOOL)isSameYear:(NSDate *)date{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate:date];
    
    NSInteger inputDateYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return thisYear == inputDateYear;
}
+ (NSDate *)nowDate
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    return [dateFormatter dateFromString:dateStr];
}

- (NSDate *)onlyYearMonthDayDate{
    
    NSDateFormatter *dateFormatter = [DefaultDateFormatter sharedInstance].dateFormatter;
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateStr = [dateFormatter stringFromDate:self];
    
    return [dateFormatter dateFromString:dateStr];
    
}

@end
