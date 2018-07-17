//
//  LocalCache.m
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/11/16.
//  Copyright (c) 2015年 Digiwin IWC. All rights reserved.
//

#import "LocalCache.h"
#import "AFNetworkReachabilityManager.h"

static LocalCache *sharedInstance;

@implementation LocalCache
@synthesize dictInCache;

+ (LocalCache *) sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[LocalCache alloc] init];
        sharedInstance.dictInCache = [[NSCache alloc] init];
    }
    return sharedInstance;
}

#pragma mark - Save

- (void)saveWithDictionary:(NSDictionary *)aBodyDict WithKey:(NSString *)aKey{
    
    if (aBodyDict == nil) {
        return;
    }
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:aBodyDict];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:data forKey:aKey];
    [userDefaults synchronize];
    
    //每次都寫一份新的進去
    [self.dictInCache setObject:data forKey:aKey];
}

- (void)saveWithBoolean:(BOOL)aBool WithKey:(NSString *)aKey{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:aBool forKey:aKey];
    [userDefaults synchronize];
    
    //每次都寫一份新的進去
    [self.dictInCache setObject:[NSNumber numberWithBool:aBool] forKey:aKey];
}

- (void)saveWithString:(NSString *)aString WithKey:(NSString *)aKey{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:aString forKey:aKey];
    [userDefaults synchronize];
    
    //每次都寫一份新的進去
    [self.dictInCache setObject:aString forKey:aKey];
}

- (void)saveWithNumber:(NSNumber *)aNumber WithKey:(NSString *)aKey{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:aNumber forKey:aKey];
    [userDefaults synchronize];
    
    //每次都寫一份新的進去
    [self.dictInCache setObject:aNumber forKey:aKey];
}

- (void)saveWithData:(NSData *)aData WithKey:(NSString *)aKey{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:aData forKey:aKey];
    [userDefaults synchronize];
    
    //每次都寫一份新的進去
    [self.dictInCache setObject:aData forKey:aKey];
}

- (void)saveWithDate:(NSDate *)aDate WithKey:(NSString *)aKey{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:aDate forKey:aKey];
    [userDefaults synchronize];
    
    //每次都寫一份新的進去
    [self.dictInCache setObject:aDate forKey:aKey];
}


#pragma mark - Get

- (NSDictionary *)dictionaryForKey:(NSString *)aKey{
    
    //NSCache有資料就傳Cache裡的，沒有，就撈本機端的
    if ([self.dictInCache objectForKey:aKey])
    {
        NSData *newData = [self.dictInCache objectForKey:aKey];
        
        NSDictionary *newDict = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
        
        return newDict;
    }else
    {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *newData = [userDefaults objectForKey:aKey];
        
        if (newData)
        {
            NSDictionary *resultDict = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
            
            [self.dictInCache setObject:newData forKey:aKey];
            
            return resultDict;
        }
        
        
        return nil;
    }
}

- (BOOL)boolForKey:(NSString *)aKey{
    
    //NSCache有資料就傳Cache裡的，沒有，就撈本機端的
    if ([self.dictInCache objectForKey:aKey]) {
        BOOL boo = [[self.dictInCache objectForKey:aKey] boolValue];
        return boo;
    }else {
        BOOL resultBool = NO;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        resultBool = [userDefaults boolForKey:aKey];
        [self.dictInCache setObject:[NSNumber numberWithBool:resultBool] forKey:aKey];
        return resultBool;
    }
}

- (NSString *)stringForKey:(NSString *)aKey{
    
    //NSCache有資料就傳Cache裡的，沒有，就撈本機端的
    if ([self.dictInCache objectForKey:aKey]) {
        return [self.dictInCache objectForKey:aKey];
    }else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *resultString = [userDefaults stringForKey:aKey];
        if (resultString != nil) {
            [self.dictInCache setObject:resultString forKey:aKey];
        }
        return resultString;
    }
}

- (NSNumber *)numberForKey:(NSString *)aKey{
    
    //NSCache有資料就傳Cache裡的，沒有，就撈本機端的
    if ([self.dictInCache objectForKey:aKey]) {
        return [self.dictInCache objectForKey:aKey];
    }else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSNumber *resultNumber = [userDefaults objectForKey:aKey];
        if (resultNumber != nil) {
            [self.dictInCache setObject:resultNumber forKey:aKey];
        }
        return resultNumber;
    }
}

- (NSData *)dataForKey:(NSString *)aKey{
    //NSCache有資料就傳Cache裡的，沒有，就撈本機端的
    if ([self.dictInCache objectForKey:aKey]) {
        return [self.dictInCache objectForKey:aKey];
    }else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *resultData = [userDefaults objectForKey:aKey];
        if (resultData != nil) {
            [self.dictInCache setObject:resultData forKey:aKey];
        }
        return resultData;
    }
}



#pragma mark - Set Cache ExpiredTime

- (void)setCacheTimeWithKey:(NSString *)aKey AndExpiredSecond:(NSInteger)aSecond{

    NSString *expiredTimeStampKey = [self expiredTimeStampKey:aKey];
    NSInteger nowTimeStamp = [[NSDate date] timeIntervalSince1970];
    NSInteger expiredTimeStamp = nowTimeStamp+aSecond;
    [[LocalCache sharedInstance] saveWithNumber:[NSNumber numberWithInteger:expiredTimeStamp] WithKey:expiredTimeStampKey];
}

- (BOOL)isCacheExpiredByKey:(NSString *)aKey{
    
    NSString *expiredTimeStampKey = [self expiredTimeStampKey:aKey];
    NSInteger nowTimeStamp = [[NSDate date] timeIntervalSince1970];
    NSInteger expiredTimeStamp = [[[LocalCache sharedInstance] numberForKey:expiredTimeStampKey] integerValue];
    
    //過期：現在時間大於到期時間
    if (nowTimeStamp > expiredTimeStamp && [AFNetworkReachabilityManager sharedManager].isReachable)
    {
       // [self removeObjectForKey:expiredTimeStampKey];
        
        return YES;
    }
    else
    {
        return NO;
    }
    
}

- (NSString *)expiredTimeStampKey:(NSString *)aKey{
    return [NSString stringWithFormat:@"%@_ExpiredTime",aKey];
}



#pragma mark - Remove

- (void)removeObjectForKey:(NSString *)aKey{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:aKey];
    [userDefaults synchronize];
    [self.dictInCache removeObjectForKey:aKey];
}

- (void)removeObjectsContainKey:(NSString *)aKey {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [userDefaults dictionaryRepresentation];
    for (NSString *key in [dict allKeys]) {
        if ([key containsString:aKey]) {
            [userDefaults removeObjectForKey:key];
            [userDefaults synchronize];
            [self.dictInCache removeObjectForKey:key];
        }
    }
}

- (void)clearAllLocalCache{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.dictInCache removeAllObjects];
}

- (void)clearNSCache{
    [self.dictInCache removeAllObjects];
}

@end
