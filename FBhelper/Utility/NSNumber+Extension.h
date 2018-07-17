//
//  NSNumber+Extension.h
//  IWCBossDashboard
//
//  Created by Kuan-xun on 2016/4/19.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSNumber (Extension)

//回傳小數點位數有幾個
+ (NSUInteger)numberOfDecimalPlaces:(float)value;

@end
