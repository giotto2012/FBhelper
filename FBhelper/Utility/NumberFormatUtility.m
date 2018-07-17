//
//  NumberFormatUtility.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/10/8.
//  Copyright © 2015年 IWC. All rights reserved.
//


#import "NumberFormatUtility.h"
#import "MoneyTextUtility.h"

@implementation NumberFormatUtility
+ (NSString *)stringWithNumber:(NSNumber *)aNumber {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"0.#####;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:aNumber];
    formattedNumberString = [MoneyTextUtility moneyTextFormatWithMKSign:formattedNumberString];
    return formattedNumberString;
}

+ (NSString *)thousandsStringWithThString:(NSString *)aString {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"0.#####;"];
    return [MoneyTextUtility moneyTextFormatWithMKSign:aString];
}

+ (NSString *)stringWithDallorSignNumber:(NSNumber *)aNumber {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"0.#####;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:aNumber];
    formattedNumberString = [MoneyTextUtility moneyTextFormatWithMKDollarSign:formattedNumberString];
    return formattedNumberString;
}

+ (NSString *)stringWithNumberForTwoDecimal:(NSNumber *)aNumber {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"0.##;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:aNumber];
    formattedNumberString = [MoneyTextUtility moneyTextFormatWithMKSign:formattedNumberString];
    return formattedNumberString;
}

+ (NSString *)stringWithDallorSignNumberForTwoDecimal:(NSNumber *)aNumber {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"0.##;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:aNumber];
    formattedNumberString = [MoneyTextUtility moneyTextFormatWithMKDollarSign:formattedNumberString];
    return formattedNumberString;
}

+ (BOOL)isNumber:(NSString *)aText{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    return [numberFormatter numberFromString:aText] != nil;
}

+ (NSString *)stringWithDecimalStyle:(NSNumber *)aNumber{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"#,###.##"];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [numberFormatter stringFromNumber:aNumber];
}

+ (NSString *)stringWithDecimalStyle:(NSNumber *)aNumber MinimumFractionDigits:(NSInteger)minimum{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"#,###.##"];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMinimumFractionDigits:minimum]; //最少到小數點第二位,不足補零
    return [numberFormatter stringFromNumber:aNumber];
}

+ (NSString *)stringWithDecimalStyle:(NSNumber *)aNumber MaximumFractionDigits:(NSInteger)maximum{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"#,###.##"];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:maximum];
    return [numberFormatter stringFromNumber:aNumber];
}

+ (NSNumberFormatter *)numberFormatterForTwoDecimal:(NSNumber *)pNumber{
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    [format setNumberStyle:NSNumberFormatterDecimalStyle];
    [format setPositiveFormat:@"#,##0.#####"];
    return format;
}

+ (NSNumberFormatter *)numberFormatterForDecimalCount:(NSInteger)pDecimalCount{
    
    NSMutableString *stringDecimal = [[NSMutableString alloc] init];
    
    for (int i=0; i<pDecimalCount; i++) {
        [stringDecimal appendString:@"#"];
    }

    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    [format setNumberStyle:NSNumberFormatterDecimalStyle];
    [format setPositiveFormat:[NSString stringWithFormat:@"#,##0.%@",stringDecimal]];
    return format;
}

+ (NSString *)stringWithNumberByNumberLength:(NSNumber *)pNumber{
    NSString *numberString = [NSString stringWithFormat:@"%f",[pNumber doubleValue]];
    NSArray *dotArray = [numberString componentsSeparatedByString:@"."];
    NSString *leftOfDot = [dotArray objectAtIndex:0];
    
    NSNumberFormatter *format;
    //判斷幾位數
    if (leftOfDot.length >= 2) {
        //大於十位數以上
        format = [self numberFormatterForDecimalCount:2];
        
    }else if(leftOfDot.length == 1){
        //個位數
        if([leftOfDot isEqualToString:@"0"]){
            //個位數是0
            if ([pNumber doubleValue]<=0.1) {
                format = [self numberFormatterForDecimalCount:5];
            }else {
                format = [self numberFormatterForDecimalCount:4];
            }
        }else {
            //個位數是1~9
            format = [self numberFormatterForDecimalCount:3];
        }
    
    }
    return [format stringFromNumber:pNumber];
}
+ (NSNumberFormatter *)defaultNumberFormatter
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    numberFormatter.roundingMode = NSNumberFormatterRoundCeiling;
    
    numberFormatter.minimumFractionDigits = 0;
    
    return numberFormatter;
}
+ (NSString *)stringWithIntString:(NSString *)aString
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
    [numberFormatter setMaximumFractionDigits:0];
    
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[aString doubleValue]]];
}

@end
