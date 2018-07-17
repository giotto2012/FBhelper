//
//  QuarterUtility.h
//  IWCWaZai
//
//  Created by YuLiang on 2016/12/13.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuarterUtility : NSObject

+(NSNumber *)monthWithQuarter:(NSNumber *)quarter;
+(NSNumber *)quarterWithMonth:(NSInteger )month;

@end
