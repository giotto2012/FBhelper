//
//  NSData+MD5.m
//  IWCWaZai
//
//  Created by Awei Kuo on 2016/12/7.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "NSData+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (MD5)

- (NSString *)MD5
{
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(self.bytes, (int)self.length, md5Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

- (NSString *)SHA256HashString
{
    
    unsigned char *sha256_buffer = malloc( sizeof( unsigned char ) * CC_SHA256_DIGEST_LENGTH );
    
    CC_SHA256( self.bytes , (int)self.length, sha256_buffer );
    
    NSMutableString *buffer = [NSMutableString new];
    
    for ( int i = 0 ; i < CC_SHA256_DIGEST_LENGTH ; i++ )
    {
        [buffer appendFormat:@"%02X" , sha256_buffer[i]];
    }
    
    return [[NSString stringWithString:buffer] lowercaseString];
}

@end
