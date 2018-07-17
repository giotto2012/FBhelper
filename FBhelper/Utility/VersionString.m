//
//  VersionString.m
//  IWCBossDashboard
//
//  Created by Awei Kuo on 2015/12/30.
//  Copyright © 2015年 Digiwin IWC. All rights reserved.
//

#import "VersionString.h"

@implementation VersionString

+ (NSString *)getVersionString{
    
    NSString *modeString;
#ifdef DEBUG
    modeString = @"Debug ";
#elif PrePRD
    modeString = @"PrePRD ";
#elif Beta
    modeString = @"Beta ";
#else
    modeString = @" ";
#endif
    
    NSString *bundleVersionString = [NSString stringWithFormat:@"%@%@(%@)",modeString,[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];

    return bundleVersionString;
}

+ (NSString *)getShortVersionString
{
    NSString *modeString;
#ifdef DEBUG
    modeString = @"Debug ";
#elif PrePRD
    modeString = @"PrePRD ";
#elif Beta
    modeString = @"Beta ";
#else
    modeString = @"";
#endif
    
    NSString *bundleVersionString = [NSString stringWithFormat:@"%@%@",modeString,[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    
    return bundleVersionString;
}

+ (NSString *)getBuildNumber
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

@end

