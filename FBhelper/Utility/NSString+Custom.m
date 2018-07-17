//
//  NSString+MD5Addition.m
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import "NSString+Custom.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Encryption.h"

@implementation NSString(Custom)


- (BOOL)isEmpty {
    if([self length] == 0 || self == nil) { //string is empty or nil
        return YES;
    }
    
    if(![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        //string is all whitespace
        return YES;
    }
    
    return NO;
}

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

- (NSString *) stringFormatWithDollarSignWithdouble:(CGFloat)doubleValue{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"$###,##0.00;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:doubleValue]];
    return formattedNumberString;
}

- (NSString *) stringFormatNoDollarSignWithdouble:(CGFloat)doubleValue{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"###,##0.00;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:doubleValue]];
    return formattedNumberString;
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

- (NSDate *)dateFromString
{
    NSDateFormatter *dateFm = [NSDateFormatter new];
    
    dateFm.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    
    [dateFm setDateFormat:@"yyyy/MM/dd HH:mm"];
    
    NSDate *date = [dateFm dateFromString:self];
    
    return date;
}

+ (NSString *)localStringWithKey:(NSString *)key
{
    NSString *str = IWCLocalString(key);
    
    return str;
}
- (NSString *)SHA256HashString
{
    const char *ptr = [self UTF8String];
    
    unsigned char *sha256_buffer = malloc( sizeof( unsigned char ) * CC_SHA256_DIGEST_LENGTH );
    
    CC_SHA256( ptr , (CC_LONG)strlen( ptr ), sha256_buffer );
    
    NSMutableString *buffer = [NSMutableString new];
    
    for ( int i = 0 ; i < CC_SHA256_DIGEST_LENGTH ; i++ )
    {
        [buffer appendFormat:@"%02X" , sha256_buffer[i]];
    }
    
    return [[NSString stringWithString:buffer] lowercaseString];
}

- (NSInteger)dotCount
{
    return [[self mutableCopy] replaceOccurrencesOfString:@"." withString:@"*" options:NSLiteralSearch range:NSMakeRange(0, [self length])];
}
- (BOOL)isNumber
{
    
    //判断是不是纯数字
    [NSCharacterSet decimalDigitCharacterSet];
    if ([[self stringByTrimmingCharactersInSet: [NSCharacterSet decimalDigitCharacterSet]] trimming].length >0)
    {
        return NO;
    }else{
        
    }
    
    return YES;
}
- (NSString *) trimming {
    
    return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
}

-(NSString *) AES256Encrypt
{
    NSData *dt1 = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *dt2 = [dt1 AES256Encrypt];
    
    NSString *str2 = [dt2 base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return str2;
}

#pragma mark -解密
-(NSString *)AES256Decrypt
{
    NSData *dt3 = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *dt4 = [dt3 AES256Decrypt];
    
    NSString *str4 = [[NSString alloc] initWithData:dt4 encoding:NSUTF8StringEncoding];
    return str4;
}
-(NSString *)exchangeRateValueByRate:(double)rate
{
    if (![self isEqualToString:@"-"])
    {
        double value = [self doubleValue] * rate;
        
        return  [NSString stringWithFormat:@"%f",value];
    }
    else
    {
        return @"-";
    }
}

@end
