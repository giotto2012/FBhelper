//
//  UINavigationController+Extension.m
//  ChinaAirlinesHD
//
//  Created by CKM on 12/9/3.
//  Copyright (c) 2012年 Streams. All rights reserved.
//

#import "UINavigationController+Extension.h"


@implementation UINavigationController(Extension)

- (void)switchViewController:(UIViewController *)aController
{
    NSMutableArray *buffer = [NSMutableArray arrayWithArray:self.viewControllers];
    
    [buffer removeLastObject];
    
    [buffer addObject:aController];
    
    [self setViewControllers:[NSArray arrayWithArray:buffer]];
}

- (void)switchViewController:(UIViewController *)aController animated:(BOOL)animated
{
    NSMutableArray *buffer = [NSMutableArray arrayWithArray:self.viewControllers];

    [buffer removeLastObject];
    
    [buffer addObject:aController];
    
    [self setViewControllers:[NSArray arrayWithArray:buffer] animated:animated];
}

- (void)switchViewController:(UIViewController *)aController fromViewController:(UIViewController *)aParentController
{
    NSMutableArray *buffer = [NSMutableArray arrayWithArray:self.viewControllers];
    
    while ( [buffer lastObject] != aParentController )
    {   
        [buffer removeLastObject];
    }
    
    [buffer addObject:aController];
    
    [self setViewControllers:[NSArray arrayWithArray:buffer]];
}

- (void)switchViewController:(UIViewController *)aController fromViewController:(UIViewController *)aParentController animated:(BOOL)animated
{
    NSMutableArray *buffer = [NSMutableArray arrayWithArray:self.viewControllers];
    
    while ( [buffer lastObject] != aParentController )
    {   
        [buffer removeLastObject];
    }
    
    [buffer addObject:aController];
    
    [self setViewControllers:[NSArray arrayWithArray:buffer] animated:animated];
}

- (void)switchViewController:(UIViewController *)aController fromClass:(Class)aClass
{
    NSMutableArray *buffer = [NSMutableArray arrayWithArray:self.viewControllers];
    
    while ( ! [[buffer lastObject] isKindOfClass:aClass] )
    {
        [buffer removeLastObject];
    }
    
    [buffer addObject:aController];
    
    [self setViewControllers:[NSArray arrayWithArray:buffer]];
}

- (void)switchViewController:(UIViewController *)aController fromClass:(Class)aClass animated:(BOOL)animated
{
    NSMutableArray *buffer = [NSMutableArray arrayWithArray:self.viewControllers];
    
    while ( ! [[buffer lastObject] isKindOfClass:aClass] )
    {
        [buffer removeLastObject];
    }
    
    [buffer addObject:aController];
    
    [self setViewControllers:[NSArray arrayWithArray:buffer] animated:animated];
}

- (void)popToViewControllerClass:(Class)aClass animated:(BOOL)animated
{
    
    
    for (UIViewController *temp in self.viewControllers)
    {
        if ([temp isKindOfClass:aClass])
        {
            [self  popToViewController:temp animated:YES];
            
            break;
        }
    }

}

@end
