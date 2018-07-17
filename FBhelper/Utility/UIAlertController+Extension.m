//
//  UIAlertController+Extension.m
//  IWCBossDashboard
//
//  Created by Kuan-xun on 2016/5/4.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSUInteger)supportedInterfaceOrientations; {
    return UIInterfaceOrientationMaskPortrait;
}
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#endif

@end
