//
//  NSNumber+Extension.m
//  IWCBossDashboard
//
//  Created by Kuan-xun on 2016/4/19.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)

+ (NSUInteger)numberOfDecimalPlaces:(float)value
{
    if (fmodf(value, 1.0f) == 0.0f) {
        return 0;
    }
    
    NSNumber *numberValue = [self numberWithFloat:value];
    NSString *floatString = [numberValue stringValue];
    NSArray *floatStringComps = [floatString componentsSeparatedByString:@"."];
    
    NSUInteger numberOfDecimalPlaces = 0;
    if (floatStringComps.count>1) {
        numberOfDecimalPlaces = [[floatStringComps objectAtIndex:1] length];
    }
    
    return numberOfDecimalPlaces;
}

@end
