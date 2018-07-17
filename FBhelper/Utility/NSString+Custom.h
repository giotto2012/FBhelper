//
//  NSString+MD5Addition.h
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Custom)

- (BOOL)isEmpty;
- (NSString *) stringFromMD5;
- (NSString *)SHA256HashString;
- (NSString *) stringFormatWithDollarSignWithdouble:(CGFloat)doubleValue;
- (NSString *) stringFormatNoDollarSignWithdouble:(CGFloat)doubleValue;
- (NSDate *)dateFromString;

+ (NSString *)localStringWithKey:(NSString *)key;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

- (NSInteger)dotCount;
- (BOOL)isNumber;
-(NSString *) AES256Encrypt;
-(NSString *)AES256Decrypt;

-(NSString *)exchangeRateValueByRate:(double)rate;

@end
