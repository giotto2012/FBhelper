//
//  UINavigationController+Extension.h
//  ChinaAirlinesHD
//
//  Created by CKM on 12/9/3.
//  Copyright (c) 2012年 Streams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController(Extension)

- (void)switchViewController:(UIViewController *)aController;
- (void)switchViewController:(UIViewController *)aController animated:(BOOL)animated;
- (void)switchViewController:(UIViewController *)aController fromViewController:(UIViewController *)aParentController;
- (void)switchViewController:(UIViewController *)aController fromViewController:(UIViewController *)aParentController animated:(BOOL)animated;
- (void)switchViewController:(UIViewController *)aController fromClass:(Class)aClass;
- (void)switchViewController:(UIViewController *)aController fromClass:(Class)aClass animated:(BOOL)animated;

- (void)popToViewControllerClass:(Class)aClass animated:(BOOL)animated;

@end
