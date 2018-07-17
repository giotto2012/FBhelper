//
//  NSDictionary+Custom.h
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/11/12.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import "NSDictionary+Custom.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSDictionary(Custom)

- (NSString *) jsonStringFromDictionary{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
