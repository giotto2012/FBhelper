//
//  NSMutableArray+MoveArray.m
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/11/17.
//  Copyright © 2015年 Digiwin IWC. All rights reserved.
//

#import "NSMutableArray+MoveArray.h"

@implementation NSMutableArray (MoveArray)

- (void)moveObjectFromIndex:(NSInteger)aFromIndex toIndex:(NSInteger)aToIndex{
    id object = [self objectAtIndex:aFromIndex];
    [self removeObjectAtIndex:aFromIndex];
    [self insertObject:object atIndex:aToIndex];
}

//將大於30個個數的重新採樣成較少的資料
- (NSMutableArray *)arrayFromRate{
    if ([self count]<30) {
        return self;
    }
    
    NSMutableArray *rateArray = [[NSMutableArray alloc] init];
    NSInteger perUnit = [self count] / 30;
    
    for (int i=0; i<[self count]; i+=perUnit) {
        [rateArray addObject:[self objectAtIndex:i]];
    }
    
    if (perUnit%30 != 0)
    {
        [rateArray addObject:[self lastObject]];
    }
    
    return rateArray;
    
}

- (void)customSortDateWithPropertyName:(NSString *)pPropertyName Ordered:(NSComparisonResult)pOrdered{
    
    [self sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
        
        NSComparisonResult result;
        if (pOrdered == NSOrderedAscending) {
            result = [[obj1 valueForKey:pPropertyName] compare:[obj2 valueForKey:pPropertyName]];
        }else {
            result = [[obj2 valueForKey:pPropertyName] compare:[obj1 valueForKey:pPropertyName]];
        }
        
        return result;
        
    }];
    
    
}

- (void)customSortWithPropertyName:(NSString *)pPropertyName Ordered:(NSComparisonResult)pOrdered{
    
    NSMutableArray *signalAndEnglishArray = [NSMutableArray new];
    NSMutableArray *chineseArray = [NSMutableArray new];
    
    //判斷第1個字元，Emoji、英文或中文
    for (id obj in self) {
        NSString *firstChar = [[obj valueForKey:pPropertyName]  substringWithRange:NSMakeRange(0, 1)];
        
        if ([self stringContainsEmoji:firstChar]) {
            [signalAndEnglishArray addObject:obj];
        }else if ([self isChineseChar:firstChar]) {
            [chineseArray addObject:obj];
        }else {
            [signalAndEnglishArray addObject:obj];
        }
        
    }
    
    //將表情、英文做預設排序：符號、數字、大寫英文、小寫英文、Emoji
    [signalAndEnglishArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
        
        NSComparisonResult result;
        if (pOrdered == NSOrderedAscending) {
            result = [[obj1 valueForKey:pPropertyName] compare:[obj2 valueForKey:pPropertyName]];
        }else {
            result = [[obj2 valueForKey:pPropertyName] compare:[obj1 valueForKey:pPropertyName]];
        }
        
        return result;
        
    }];
    
    //中文依筆劃排序
    NSLocale *strokeSortingLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh@collation=stroke"];
    [chineseArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
        
        NSComparisonResult result;
        if (pOrdered == NSOrderedAscending) {
            result = [[obj1 valueForKey:pPropertyName] compare:[obj2 valueForKey:pPropertyName] options:0 range:NSMakeRange(0, [[obj1 valueForKey:pPropertyName] length]) locale:strokeSortingLocale];
        }else {
            result = [[obj2 valueForKey:pPropertyName] compare:[obj1 valueForKey:pPropertyName] options:0 range:NSMakeRange(0, [[obj2 valueForKey:pPropertyName] length]) locale:strokeSortingLocale];
        }
        
        return result;
        
    }];
    
    //合併成1個陣列
    if (pOrdered == NSOrderedAscending) {
        [signalAndEnglishArray addObjectsFromArray:chineseArray];
        [self setArray:signalAndEnglishArray];
    }else {
        [chineseArray addObjectsFromArray:signalAndEnglishArray];
        [self setArray:chineseArray];
    }
    
    
    
    
}

- (BOOL)isChineseChar:(NSString *)string{
    NSData *d = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSInteger length = [d length];
    if (length==3) {
        return YES;
    }
    return NO;
}

- (BOOL)stringContainsEmoji:(NSString *)string{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}


@end
