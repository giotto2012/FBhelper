//
//  UIAlertView+Custom.m
//  IWCBossDashboard
//
//  Created by 張宇樑 on 2016/1/8.
//  Copyright © 2016年 Digiwin IWC. All rights reserved.
//

#import "UIAlertView+Custom.h"

@implementation UIAlertView (Custom)

+(void)showAlearWithMessage:(NSString *)text
{
    
    
    MAIN_THREAD((^
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:text message:nil delegate:nil cancelButtonTitle:IWCLocalString(@"OK") otherButtonTitles:nil, nil];
                    
                    [alertView show];
                }));

}
@end
