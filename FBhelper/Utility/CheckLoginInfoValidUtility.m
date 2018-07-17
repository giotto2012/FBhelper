//
//  CheckPasswordValidUtility.m
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2016/7/14.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "CheckLoginInfoValidUtility.h"

@implementation CheckLoginInfoValidUtility

+ (BOOL)checkValidWithChinaPhone:(NSString *)pPhone{
    BOOL result = NO;
    
    //取代空白
    NSString* resultString = [pPhone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //正規表示式
    NSString *regExPattern = @"[1]{1}[0-9]{10}";
    result = [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExPattern] evaluateWithObject: resultString];
    
    if (resultString.length < 10) {
        return NO;
    }
    
    return result;
}

+ (BOOL)checkValidWithTaiwanPhone:(NSString *)pPhone{
    BOOL result = NO;
    
    //取代空白
    NSString* resultString = [pPhone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //正規表示式
    NSString *regExPattern = @"[0]{1}[9]{1}[0-9]{8}";
    result = [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExPattern] evaluateWithObject: resultString];
    
    if (resultString.length < 10) {
        return NO;
    }
    
    return result;
}

+ (BOOL)checkValidWithPassword:(NSString *)pPassword{
    
    BOOL result = NO;
    
    //取代空白
    NSString* resultString = [pPassword stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //正規表示式
//    NSString *regExPattern = @"([A-Za-z]+[0-9]+)|([0-9]+[A-Za-z]+)";
    NSString *regExPattern = @"^(?=.*\\d)(?=.*[a-zA-Z]).{8,}$";
    result = [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExPattern] evaluateWithObject: resultString];
    return result;
}

+ (BOOL)checkValidWithEmail:(NSString *)pEmail{
    BOOL result = NO;
    
    //取代空白
    NSString* resultString = [pEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //正規表示式
    NSString *regExPattern = @"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
    result = [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExPattern] evaluateWithObject: resultString];
    return result;
}
@end
