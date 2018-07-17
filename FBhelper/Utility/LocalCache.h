//
//  LocalCache.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/11/16.
//  Copyright (c) 2015年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalCache : NSObject
{
    NSCache *dictInCache;
}
@property (nonatomic,retain) NSCache *dictInCache;
+ (LocalCache *)sharedInstance;

#pragma mark - Save
- (void)saveWithDictionary:(NSDictionary *)aBodyDict WithKey:(NSString *)aKey;
- (void)saveWithBoolean:(BOOL)aBool WithKey:(NSString *)aKey;
- (void)saveWithString:(NSString *)aString WithKey:(NSString *)aKey;
- (void)saveWithNumber:(NSNumber *)aNumber WithKey:(NSString *)aKey;
- (void)saveWithData:(NSData *)aData WithKey:(NSString *)aKey;
- (void)saveWithDate:(NSDate *)aDate WithKey:(NSString *)aKey;

#pragma mark - Get
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;
- (BOOL)boolForKey:(NSString *)aKey;
- (NSString *)stringForKey:(NSString *)aKey;
- (NSNumber *)numberForKey:(NSString *)aKey;
- (NSData *)dataForKey:(NSString *)aKey;

#pragma mark - Set Cache ExpiredTime

- (void)setCacheTimeWithKey:(NSString *)aKey AndExpiredSecond:(NSInteger)aSecond;
- (BOOL)isCacheExpiredByKey:(NSString *)aKey;

#pragma mark - Remove
- (void)removeObjectForKey:(NSString *)aKey;
- (void)removeObjectsContainKey:(NSString *)aKey;
- (void)clearAllLocalCache;
- (void)clearNSCache;
@end
