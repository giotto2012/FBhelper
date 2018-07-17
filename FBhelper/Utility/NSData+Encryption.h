//
//  NSData+Encryption.h
//  IWCWaZai
//
//  Created by YuLiang on 2017/5/2.
//  Copyright © 2017年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

- (NSData *)AES256Encrypt;   //加密

- (NSData *)AES256Decrypt;   //解密

@end
