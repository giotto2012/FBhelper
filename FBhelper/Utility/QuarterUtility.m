//
//  QuarterUtility.m
//  IWCWaZai
//
//  Created by YuLiang on 2016/12/13.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "QuarterUtility.h"

@implementation QuarterUtility

+(NSNumber *)monthWithQuarter:(NSNumber *)quarter
{
    int q = [quarter intValue];
    
    if (q == 1)
    {
        return [NSNumber numberWithInt:3];
    }
    else if (q == 2)
    {
        return [NSNumber numberWithInt:6];

    }
    else if (q == 3)
    {
        return [NSNumber numberWithInt:9];

    }
    else
    {
        return [NSNumber numberWithInt:12];

    }
}
+(NSNumber *)quarterWithMonth:(NSInteger )month
{
    NSInteger m = month;
    
    if (m>=1 && m<=3)
    {
        return [NSNumber numberWithInt:1];
    }
    else if (m>=4 && m<=6)
    {
        return [NSNumber numberWithInt:2];
    }
    else if (m>=7 && m<=9)
    {
        return [NSNumber numberWithInt:3];
    }
    else
    {
        return [NSNumber numberWithInt:4];
    }
}
@end
