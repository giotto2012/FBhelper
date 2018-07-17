//
//  VersionString.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/12/30.
//  Copyright © 2015年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionString : NSObject
+ (NSString *)getVersionString;
+ (NSString *)getShortVersionString;
+ (NSString *)getBuildNumber;
@end
