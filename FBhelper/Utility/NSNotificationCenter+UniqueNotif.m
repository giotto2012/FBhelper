//
//  NSNotificationCenter+UniqueNotif.m
//  IWCBossDashboard
//
//  Created by 張宇樑 on 2016/1/11.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "NSNotificationCenter+UniqueNotif.h"

@implementation NSNotificationCenter (UniqueNotif)

- (void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object
{
        
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
    
}

@end
