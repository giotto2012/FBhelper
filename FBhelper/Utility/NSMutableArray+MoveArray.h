//
//  NSMutableArray+MoveArray.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/11/17.
//  Copyright © 2015年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MoveArray)
- (void)moveObjectFromIndex:(NSInteger)aFromIndex toIndex:(NSInteger)aToIndex;

- (NSMutableArray *)arrayFromRate;

- (void)customSortDateWithPropertyName:(NSString *)pPropertyName Ordered:(NSComparisonResult)pOrdered;
- (void)customSortWithPropertyName:(NSString *)pPropertyName Ordered:(NSComparisonResult)pOrdered;
@end
