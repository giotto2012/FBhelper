//
//  CheckPasswordValidUtility.h
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2016/7/14.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckLoginInfoValidUtility : NSObject
+ (BOOL)checkValidWithChinaPhone:(NSString *)pPhone;
+ (BOOL)checkValidWithTaiwanPhone:(NSString *)pPhone;
+ (BOOL)checkValidWithPassword:(NSString *)pPassword;
+ (BOOL)checkValidWithEmail:(NSString *)pEmail;
@end
