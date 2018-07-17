//
//  MoneyTextUtility.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/10/8.
//  Copyright © 2015年 IWC. All rights reserved.
//

#import "MoneyTextUtility.h"

@implementation MoneyTextUtility

+(NSString *)changedouble:(NSString *)stringdouble
{
    const char *doubleChars = [stringdouble UTF8String];
    NSUInteger length = [stringdouble length];
    NSUInteger zeroLength = 0;
    NSInteger i = length-1;
    for(; i>=0; i--)
    {
        if(doubleChars[i] == '0'/*0x30*/) {
            zeroLength++;
        } else {
            if(doubleChars[i] == '.')
                i--;
            break;
        }
    }
    NSString *returnString;
    if(i == -1) {
        returnString = @"0";
    } else {
        returnString = [stringdouble substringToIndex:i+1];
    }
    return returnString;
}

+ (NSString *)moneyTextFormatWithMKSign:(NSString *)originalText
{
    NSString *newText = @"";
    NSNumberFormatter *numberFmt = [[NSNumberFormatter alloc] init];
    [numberFmt setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFmt setPerMillSymbol:@","];
    NSRange subRange = [originalText rangeOfString:@"."];
    
    NSString *integerText = @"";
    NSString *dotText = @"";
    BOOL isdouble;
    if (subRange.location==NSNotFound) {
        isdouble = NO;
    }else {
        isdouble = YES;
    }
    if (isdouble) {
        originalText = [self changedouble:originalText];
        subRange = [originalText rangeOfString:@"."];
        if (subRange.location==NSNotFound) {
            isdouble = NO;
            integerText = [[originalText componentsSeparatedByString:@"."] objectAtIndex:0];
            dotText = @"";
        }else {
            isdouble = YES;
            integerText = [[originalText componentsSeparatedByString:@"."] objectAtIndex:0];
            dotText = [[originalText componentsSeparatedByString:@"."] objectAtIndex:1];
        }
    }else {
        integerText = originalText;
    }
    if ([integerText length] > 9) {
        NSNumber *number = [NSNumber numberWithInt:[integerText intValue] / 1000000];
        newText = [NSString stringWithFormat:@"%@m",[numberFmt stringFromNumber:number]];
    }else if ([integerText length] > 6){
        NSNumber *number = [NSNumber numberWithInt:[integerText intValue] / 1000];
        newText = [NSString stringWithFormat:@"%@k",[numberFmt stringFromNumber:number]];
    }else {
        NSNumber *number = [NSNumber numberWithDouble:[integerText doubleValue]];
        newText = [numberFmt stringFromNumber:number];
        if (isdouble) {
            if ([dotText length]>2) {
                newText = [NSString stringWithFormat:@"%@.%@",newText,[dotText substringToIndex:1]];
            }else {
                newText = [NSString stringWithFormat:@"%@.%@",newText,dotText];
            }
        }else {
            newText = [NSString stringWithFormat:@"%@",newText];
        }

    }
    
    return newText;
}

+ (NSString *)moneyTextFormatWithMKDollarSign:(NSString *)originalText
{
    return [NSString stringWithFormat:@"$%@",[MoneyTextUtility moneyTextFormatWithMKSign:originalText]];
}

@end
