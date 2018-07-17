//
//  UIColor+Theme.h
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/11/3.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum { R, G, B, A } UIColorComponentIndices;
@interface UIColor (Theme)
- (CGFloat)red;
- (CGFloat)green;
- (CGFloat)blue;
- (CGFloat)alpha;

+ (UIColor *)randomColor;
+ (UIColor *)newNavigationBarColor;
+ (UIColor *)colorWithHexString: (NSString *) stringToConvert alpha:(double)alpha;
+ (UIColor *)colorWithHexString: (NSString *) stringToConvert;
+ (UIColor *)themeCandleStickGreenBar;
+ (UIColor *)themeCandleStickRedBar;
+ (UIColor *)themeValueUP_Old;
+ (UIColor *)themeValueDown_Old;
+ (UIColor *)themeUserInfoTextColor;
+ (UIColor *)themeValueUP;
+ (UIColor *)themeValueDown;
+ (UIColor *)themeGoldColor;
+ (UIColor *)themePlaceCloseOrderViewBgColor;
+ (UIColor *)themePlaceCloseOrderBtnColor;
+ (UIColor *)themeNormalTextColor;
+ (UIColor *)navigationBarColor;
+ (UIColor *)cardGrayColor;
+ (UIColor *)cardTextColor;
+(UIColor *)cardProjectManagerValueUpColor;
+(UIColor *)cardProjectManagerValueDownColor;
+(UIColor *)cardLineColor;
+(UIColor *)cardMoreBlueColor;
+(UIColor *)businessCompareSelfColor;
+(UIColor *)businessCompareAnotherColor;
+(UIColor *)hqCompanyLineChartColor;
+(UIColor *)updateTextColor;
+(UIColor *)hqRevenueLineChartColor;
+(UIColor *)accountsReceivableDuration30ValueColor;
+(UIColor *)accountsReceivableDuration60ValueColor;
+(UIColor *)accountsReceivableDuration90ValueColor;
+(UIColor *)accountsReceivableDuration180ValueColor;
+(UIColor *)accountsReceivableDuration360ValueColor;
+(UIColor *)accountsReceivableDuration360upValueColor;
+(UIColor *)newsSwipeNomalColor;
+(UIColor *)newsSwipeHighLightColor;
+(UIColor *)followCompanyHighLightColor;
+(UIColor *)businessComparBadValueColor;
+(UIColor *)yellowTreasureColor;
+(UIColor *)disableColor;
+(UIColor *)exchangePickerGaryColor;
+(UIColor *)greenLoginBtnColor;
+(UIColor *)redSectionColor;
+(UIColor *)blueSectionColor;
+(UIColor *)yellowHighlightBoardColor;
+(UIColor *)normalButtonColor;
+(UIColor *)grayTextColor;
+(UIColor *)normalDarkTextColor;
+(UIColor *)shipmentColor;
+(UIColor *)contractColor;
+(UIColor *)receiptColor;
+(UIColor *)stockColor;
@end
