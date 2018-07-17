//
//  UIColor+Theme.m
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/11/3.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import "UIColor+Theme.h"

@implementation UIColor (Theme)

#pragma mark 16進制顏色轉換
+ (UIColor *)randomColor
{
    CGFloat r = ((CGFloat)(arc4random() % 255))/255.0;
    CGFloat g = ((CGFloat)(arc4random() % 255))/255.0;
    CGFloat b = ((CGFloat)(arc4random() % 255))/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(double)alpha
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString isEqualToString:@"RED"]) {
        return [UIColor redColor];
    } else if([cString isEqualToString:@"BLUE"]) {
        return [UIColor blueColor];
    } else if([cString isEqualToString:@"BROWN"]) {
        return [UIColor brownColor];
    } else if([cString isEqualToString:@"GRAY"]) {
        return [UIColor grayColor];
    } else if([cString isEqualToString:@"GREEN"]) {
        return [UIColor greenColor];
    } else if([cString isEqualToString:@"YELLOW"]) {
        return [UIColor yellowColor];
    } else if([cString isEqualToString:@"ORANGE"]) {
        return [UIColor orangeColor];
    } else if([cString isEqualToString:@"WHITE"]) {
        return [UIColor whiteColor];
    };
    
    if ([cString length] < 6) {
        return [UIColor blackColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    };
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor blackColor];
    }
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((double) r / 255.0f)
                           green:((double) g / 255.0f)
                            blue:((double) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    return [self colorWithHexString:stringToConvert alpha:1.0];
}

-(CGFloat)red
{
    return CGColorGetComponents(self.CGColor)[R];
}

-(CGFloat)green
{
    return CGColorGetComponents(self.CGColor)[G];
}

-(CGFloat)blue
{
    return CGColorGetComponents(self.CGColor)[B];
}

-(CGFloat)alpha
{
    return CGColorGetComponents(self.CGColor)[A];
}

#pragma mark ST2_Theme

+ (UIColor *)themeCandleStickGreenBar{
    return [self colorWithHexString:@"0x00FF00"];
}

+ (UIColor *)themeCandleStickRedBar{
    return [self colorWithHexString:@"0xFF2400"];
}

+ (UIColor *)themeValueUP_Old{
    return [self colorWithHexString:@"0x006400"];
}

+ (UIColor *)themeValueDown_Old{
    return [self colorWithHexString:@"0xcd0000"];
}

+ (UIColor *)themeUserInfoTextColor{
    return [self colorWithHexString:@"0xA07100"];
}

+ (UIColor *)themeValueUP{
    return [self colorWithHexString:@"0x00e82a"];
}

+ (UIColor *)themeValueDown{
    return [self colorWithHexString:@"0xff0508"];
}

+ (UIColor *)themeGoldColor{
    return [self colorWithHexString:@"0xe4c459"];
}

+ (UIColor *)themePlaceCloseOrderViewBgColor{
    return [self colorWithHexString:@"0x0e2c37"];
}

+ (UIColor *)themePlaceCloseOrderBtnColor{
    return [self colorWithHexString:@"0x0095ba"];
}

+ (UIColor *)themeNormalTextColor{
    return [UIColor whiteColor];
}

+ (UIColor *)navigationBarColor
{
    return [self colorWithHexString:@"#0071BC"];
}
+ (UIColor *)newNavigationBarColor
{
    return [self colorWithHexString:@"#075475"];
}

+ (UIColor *)cardGrayColor
{
    return [self colorWithHexString:@"#C9CACA"];
}

+ (UIColor *)cardTextColor
{
    return [self colorWithHexString:@"#444444"];
}

+(UIColor *)cardProjectManagerValueUpColor
{
    return [self colorWithHexString:@"C1272D"];
}
+(UIColor *)cardProjectManagerValueDownColor
{
    return [self colorWithHexString:@"009245"];
}
+(UIColor *)cardLineColor
{
    return [self colorWithHexString:@"DCDCDC"];
}
+(UIColor *)cardMoreBlueColor
{
    return [self colorWithHexString:@"0C4D72"];
}

+(UIColor *)businessCompareSelfColor
{
    return [self colorWithHexString:@"0071BC" alpha:0.5];
}
+(UIColor *)businessCompareAnotherColor
{
    return [self colorWithHexString:@"ED1E79" alpha:0.5];
}
+(UIColor *)hqCompanyLineChartColor
{
    return [self colorWithHexString:@"0071BC"];
}
+(UIColor *)hqRevenueLineChartColor
{
    return [self colorWithHexString:@"C1272D"];
}
+(UIColor *)updateTextColor
{
    return [self colorWithHexString:@"B3B3B3"];
}
//逾期未收款
+(UIColor *)accountsReceivableDuration30ValueColor
{
    return [self colorWithHexString:@"9DDDF4"];
}
+(UIColor *)accountsReceivableDuration60ValueColor
{
    return [self colorWithHexString:@"29ABE2"];
}
+(UIColor *)accountsReceivableDuration90ValueColor
{
    return [self colorWithHexString:@"297D9B"];
}
+(UIColor *)accountsReceivableDuration180ValueColor
{
    return [self colorWithHexString:@"0071BC"];
}
+(UIColor *)accountsReceivableDuration360ValueColor
{
    return [self colorWithHexString:@"08537C"];
}
+(UIColor *)accountsReceivableDuration360upValueColor
{
    return [self colorWithHexString:@"032B42"];
}

+(UIColor *)newsSwipeNomalColor
{
    return [self colorWithHexString:@"B3B3B3"];
}
+(UIColor *)newsSwipeHighLightColor
{
    return [self colorWithHexString:@"4D4D5D"];
}
+(UIColor *)followCompanyHighLightColor
{
    return [self colorWithHexString:@"8C6239"];
}
+(UIColor *)businessComparBadValueColor
{
    return [self colorWithHexString:@"AA272D"];
}
+(UIColor *)yellowTreasureColor
{
    return [self colorWithHexString:@"f7931E"];
}
+(UIColor *)disableColor
{
    return [self colorWithHexString:@"CCCCCC"];
}
+(UIColor *)exchangePickerGaryColor
{
    return [self colorWithHexString:@"969696"];
}
+(UIColor *)greenLoginBtnColor
{
    return [self colorWithHexString:@"3eba7f" alpha:0.5];
}
+(UIColor *)redSectionColor
{
    return [self colorWithHexString:@"e62432"];
}
+(UIColor *)blueSectionColor
{
    return [self colorWithHexString:@"0071bd"];
}
+(UIColor *)yellowHighlightBoardColor
{
    return [self colorWithHexString:@"f7931e"];
}
+ (UIColor *)normalButtonColor
{
    return [self colorWithHexString:@"#0071BC"];
}
+ (UIColor *)grayTextColor
{
    return [self colorWithHexString:@"#4D4D4D"];
}
+ (UIColor *)normalDarkTextColor
{
    return [self colorWithHexString:@"#444444"];
}
+(UIColor *)shipmentColor
{
    return [UIColor colorWithHexString:@"4BAB05"];

}
+(UIColor *)contractColor
{
    return [UIColor colorWithHexString:@"007FFF"];

}
+(UIColor *)receiptColor
{
   return [UIColor colorWithHexString:@"814FF0"];
}
+(UIColor *)stockColor
{
   return [UIColor colorWithHexString:@"1CBEB2"];
}
@end
