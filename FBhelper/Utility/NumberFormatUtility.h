//
//  NumberFormatUtility.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/10/8.
//  Copyright © 2015年 IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberFormatUtility : NSObject
+ (NSString *)stringWithNumber:(NSNumber *)aNumber;
+ (NSString *)thousandsStringWithThString:(NSString *)aString;
+ (NSString *)stringWithDallorSignNumber:(NSNumber *)aNumber;
+ (NSString *)stringWithNumberForTwoDecimal:(NSNumber *)aNumber;
+ (NSString *)stringWithDallorSignNumberForTwoDecimal:(NSNumber *)aNumber;
+ (NSString *)stringWithDecimalStyle:(NSNumber *)aNumber;
+ (NSString *)stringWithDecimalStyle:(NSNumber *)aNumber MinimumFractionDigits:(NSInteger)minimum;
+ (NSString *)stringWithDecimalStyle:(NSNumber *)aNumber MaximumFractionDigits:(NSInteger)maximum;
+ (BOOL)isNumber:(NSString *)aText;
+ (NSNumberFormatter *)numberFormatterForDecimalCount:(NSInteger)pDecimalCount;
+ (NSString *)stringWithNumberByNumberLength:(NSNumber *)pNumber;

+ (NSNumberFormatter *)defaultNumberFormatter;
+ (NSString *)stringWithIntString:(NSString *)aString;

@end
