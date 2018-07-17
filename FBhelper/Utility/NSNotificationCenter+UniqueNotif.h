//
//  NSNotificationCenter+UniqueNotif.h
//  IWCBossDashboard
//
//  Created by 張宇樑 on 2016/1/11.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (UniqueNotif)

- (void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object;

@end

