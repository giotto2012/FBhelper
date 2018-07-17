//
//  UIView+Extension.m
//  TransAsia
//
//  Created by  on 12/5/15.
//  Copyright (c) 2012年 Streams. All rights reserved.
//

#import "UIView+Extension.h"
#import "QuartzCore/CAlayer.h"

@implementation UIView(Extension)

//- (void)cleanAnimations
//{
//    [self.layer removeAllAnimations];
//}

//- (void)removeLayerAnimations
//{
//    [self.layer removeAllAnimations];
//}

- (void)setCenterX:(CGFloat)aCenterX
{
    CGPoint center_point = self.center;
    
    center_point.x = aCenterX;
    
    self.center = center_point;
}

- (void)setCenterY:(CGFloat)aCenterY
{
    CGPoint center_point = self.center;
    
    center_point.y = aCenterY;
    
    self.center = center_point;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setHeight:(CGFloat)aHeight
{
    CGRect rect = self.frame;
    rect.size.height = aHeight;
    self.frame = rect;
}

- (void)setWidth:(CGFloat)aWidth
{
    CGRect rect = self.frame;
    rect.size.width = aWidth;
    self.frame = rect;    
}

- (void)setWidth:(CGFloat)aWidth Height:(CGFloat)aHeight
{
    CGRect rect = self.frame;
    rect.size.height = aHeight;
    rect.size.width = aWidth;    
    self.frame = rect;
}

- (void)setX:(CGFloat)aOriginX
{
    CGRect rect = self.frame;
    rect.origin.x = aOriginX;
    self.frame = rect;
}

- (void)setY:(CGFloat)aOriginY
{
    CGRect rect = self.frame;
    rect.origin.y = aOriginY;
    self.frame = rect;    
}

- (void)setX:(CGFloat)aOriginX width:(CGFloat)aWidth
{
    CGRect rect = self.frame;
    rect.origin.x = aOriginX;
    rect.size.width = aWidth;
    self.frame = rect;
}

- (void)setY:(CGFloat)aOriginY height:(CGFloat)aHeight
{
    CGRect rect = self.frame;
    rect.origin.y = aOriginY;
    rect.size.height = aHeight;
    self.frame = rect;
}

- (void)setX:(CGFloat)aOriginX Y:(CGFloat)aOriginY
{
    CGRect rect = self.frame;
    rect.origin.x = aOriginX;
    rect.origin.y = aOriginY;
    self.frame = rect;
}

- (void)setBottom:(CGFloat)aBottom
{
    CGRect rect = self.frame;
    
    rect.origin.y = aBottom - rect.size.height;
    
    self.frame = rect;
}

- (void)setTop:(CGFloat)aTop
{
    CGRect rect = self.frame;
    
    rect.origin.y = aTop;
    
    self.frame = rect;
}

- (void)setLeft:(CGFloat)aLeft
{
    CGRect rect = self.frame;
    
    rect.origin.x = aLeft;
    
    self.frame = rect;
}

- (void)setRight:(CGFloat)aRight
{
    CGRect rect = self.frame;
    
    rect.origin.x = aRight - rect.size.width;
    
    self.frame = rect;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGPoint)boundCenter
{
    return CGPointMake( self.bounds.size.width / 2 , self.bounds.size.height / 2 );
}

- (void)linearLayoutVerticalWithPadding:(UIEdgeInsets)aPadding
                                  align:(NSInteger)aAlign
                            dividerDistance:(CGFloat)aDividerDistance
                           wrapToHeight:(BOOL)isWrapToHeight
                            wrapToWidth:(BOOL)isWrapToWidth
                  subviewMarginCallback:(UIEdgeInsets(^)(UIView *))aSubviewMarginCallback
{
    CGFloat target_width = 0.0f;
    
    CGFloat target_height = 0.0f;
    
    UIEdgeInsets margins[self.subviews.count];
    
    int index = 0;
    
    for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
    {
        UIView *subview = [self.subviews objectAtIndex:i];
        
        if ( subview.hidden || subview.alpha == 0.0 )
        {
            continue;
        }
        
        CGRect subview_frame = subview.frame;
        
        UIEdgeInsets subview_margin = aSubviewMarginCallback == nil ? UIEdgeInsetsZero : aSubviewMarginCallback( subview );
        
        margins[i] = subview_margin;
        
        CGFloat subview_width = subview_margin.left + subview_frame.size.width + subview_margin.right;
        
        CGFloat subview_height = subview_margin.top + subview_frame.size.height + subview_margin.bottom;
        
        if ( subview_width > target_width )
        {
            target_width = subview_width;
        }
        
        target_height += subview_height;
        
        if ( index > 0 ) target_height += aDividerDistance;
        
        index++;
    }
    
    target_width = aPadding.left + target_width + aPadding.right;
    
    target_height = aPadding.top + target_height + aPadding.bottom;
    
    #ifdef DEBUG
    
    //NSLog( @"target width:%f height:%f" , target_width , target_height );
    
    #endif
    
    CGRect self_frame = self.frame;
    
    if ( isWrapToWidth )
    {
        self_frame.size.width = target_width;
    }
    
    if ( isWrapToHeight )
    {
        self_frame.size.height = target_height;
    }
    
    self.frame = self_frame;
    
    CGFloat position_x = 0.0f;
    
    CGFloat position_y = 0.0f;

    int horizontal_layout = 0; // 0 = left , 1 = middle , 2 = right
    
    if ( aAlign & AlignCenter )
    {
        horizontal_layout = 1;
        
        position_x = ( self_frame.size.width - target_width ) / 2;
        
        position_y = ( self_frame.size.height - target_height ) / 2;
    }
    
    if ( aAlign & AlignRight )
    {
        horizontal_layout = 2;
        
        position_x = self_frame.size.width - target_width;
    }
    
    if ( aAlign & AlignLeft )
    {
        horizontal_layout = 0;
        
        position_x = 0.0f;
    }
    
    if ( aAlign & AlignBottom )
    {
        position_y = self_frame.size.height - target_height;
    }
    
    if ( aAlign & AlignTop )
    {
        position_y = 0.0f;
    }

    position_y += aPadding.top;

    if ( horizontal_layout == 0 ) // left
    {
        index = 0;
        
        position_x += aPadding.left;
        
        for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
        {
            UIView *subview = [self.subviews objectAtIndex:i];
            
            if ( subview.hidden || subview.alpha == 0.0 )
            {
                continue;
            }
            
            CGRect subview_frame = subview.frame;
            
            UIEdgeInsets subview_margin = margins[i];
            
//            CGFloat margin_left = subview_margin.left;
//            
//            CGFloat margin_top = subview_margin.top;
//
//            subview_frame.origin.x = position_x + margin_left;
//            
//            subview_frame.origin.y = position_y + margin_top;
//
//            subview.frame = subview_frame;
            
            if ( index > 0 ) position_y+= aDividerDistance;
            
            index++;
            
            subview.frame = CGRectMake( position_x + subview_margin.left ,
                                        position_y + subview_margin.top ,
                                        subview_frame.size.width ,
                                        subview_frame.size.height );
            
//            #ifdef DEBUG
//            
//            //NSLog( @"view:%d frame:%@" , i , NSStringFromCGRect( subview_frame ) );
//            
//            #endif
            
            position_y += ( subview_margin.top + subview_frame.size.height + subview_margin.bottom );
        }
    }
    else if ( horizontal_layout == 2 ) // right
    {
        position_x += ( target_width - aPadding.right );
        
        index = 0;
        
        for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
        {
            UIView *subview = [self.subviews objectAtIndex:i];
            
            if ( subview.hidden || subview.alpha == 0.0 )
            {
                continue;
            }
            
            CGRect subview_frame = subview.frame;
            
            UIEdgeInsets subview_margin = margins[i];
            
            CGFloat margin_right = subview_margin.right;
            
            CGFloat margin_top = subview_margin.top;
            
            subview_frame.origin.x = position_x - subview_frame.size.width - margin_right;
            
            if ( index > 0 ) position_y+= aDividerDistance;
            
            index++;
            
            subview_frame.origin.y = position_y + margin_top;
            
            subview.frame = subview_frame;
            
            position_y += ( subview_margin.top + subview_frame.size.height + subview_margin.bottom );
        }
    }
    else // center
    {
        position_x += ( target_width / 2 ); // position = center
        
        index = 0;
        
        for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
        {
            UIView *subview = [self.subviews objectAtIndex:i];
            
            if ( subview.hidden || subview.alpha == 0.0 )
            {
                continue;
            }
            
            CGRect subview_frame = subview.frame;
            
            UIEdgeInsets subview_margin = margins[i];
            
            CGFloat margin_top = subview_margin.top;
            
            subview_frame.origin.x = position_x - ( subview_frame.size.width / 2 );
            
            if ( index > 0 ) position_y+= aDividerDistance;
            
            index++;
            
            subview_frame.origin.y = position_y + margin_top;
            
            subview.frame = subview_frame;
            
            position_y += ( subview_margin.top + subview_frame.size.height + subview_margin.bottom );
        }
    }
}

- (void)linearLayoutHorizontalWithPadding:(UIEdgeInsets)aPadding
                                    align:(NSInteger)aAlign
                            dividerDistance:(CGFloat)aDividerDistance
                             wrapToHeight:(BOOL)isWrapToHeight
                              wrapToWidth:(BOOL)isWrapToWidth
                    subviewMarginCallback:(UIEdgeInsets(^)(UIView *))aSubviewMarginCallback
{
    CGFloat target_width = 0.0f;
    
    CGFloat target_height = 0.0f;
    
    UIEdgeInsets margins[self.subviews.count];
    
    int index = 0;
    
    for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
    {
        UIView *subview = [self.subviews objectAtIndex:i];
        
        if ( subview.hidden || subview.alpha == 0.0 )
        {
            continue;
        }
        
        CGRect subview_frame = subview.frame;
        
        UIEdgeInsets subview_margin = aSubviewMarginCallback == nil ? UIEdgeInsetsZero : aSubviewMarginCallback( subview );
        
        margins[i] = subview_margin;
        
        CGFloat subview_width = subview_margin.left + subview_frame.size.width + subview_margin.right;
        
        CGFloat subview_height = subview_margin.top + subview_frame.size.height + subview_margin.bottom;
        
        if ( subview_height > target_height )
        {
            target_height = subview_height;
        }
        
        target_width += subview_width;
        
        if ( index > 0 ) target_width += aDividerDistance;
        
        index++;
    }
    
    target_width = aPadding.left + target_width + aPadding.right;
    
    target_height = aPadding.top + target_height + aPadding.bottom;
    
    CGRect self_frame = self.frame;
    
    if ( isWrapToWidth )
    {
        self_frame.size.width = target_width;
    }
    
    if ( isWrapToHeight )
    {
        self_frame.size.height = target_height;
    }
    
    self.frame = self_frame;
    
    CGFloat position_x = 0.0f;
    
    CGFloat position_y = 0.0f;
    
    int vertical_layout = 0; // 0 = top , 1 = middle , 2 = bottom
    
    if ( aAlign & AlignCenter )
    {
        vertical_layout = 1;
        
        position_x = ( self_frame.size.width - target_width ) / 2;
        
        position_y = ( self_frame.size.height - target_height ) / 2;
    }
    
    if ( aAlign & AlignBottom )
    {
        vertical_layout = 2;
        
        position_y = self_frame.size.height - target_height;
    }
    
    if ( aAlign & AlignTop )
    {
        vertical_layout = 0;
        
        position_y = 0.0f;
    }
    
    if ( aAlign & AlignRight )
    {
        position_x = self_frame.size.width - target_width;
    }
    
    if ( aAlign & AlignLeft )
    {
        position_x = 0.0f;
    }
    
    position_x += aPadding.left;
    
    if ( vertical_layout == 0 ) // top
    {
        position_y += aPadding.top;
        
        index = 0;
        
        for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
        {
            UIView *subview = [self.subviews objectAtIndex:i];
            
            if ( subview.hidden || subview.alpha == 0.0 )
            {
                continue;
            }
            
            CGRect subview_frame = subview.frame;
            
            UIEdgeInsets subview_margin = margins[i];
            
            CGFloat margin_left = subview_margin.left;
            
            CGFloat margin_top = subview_margin.top;
            
            if ( index > 0 ) position_x += aDividerDistance;
            
            index++;
            
            subview_frame.origin.x = position_x + margin_left;

            subview_frame.origin.y = position_y + margin_top;
            
            subview.frame = subview_frame;
            
            position_x += ( subview_margin.left + subview_frame.size.width + subview_margin.right );
        }
    }
    else if ( vertical_layout == 2 ) // bottom
    {
        position_y += ( target_height - aPadding.bottom );
        
        index = 0;
        
        for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
        {
            UIView *subview = [self.subviews objectAtIndex:i];
            
            if ( subview.hidden || subview.alpha == 0.0 )
            {
                continue;
            }
            
            CGRect subview_frame = subview.frame;
            
            UIEdgeInsets subview_margin = margins[i];
            
            CGFloat margin_left = subview_margin.left;
            
            CGFloat margin_bottom = subview_margin.bottom;
            
            if ( index > 0 ) position_x += aDividerDistance;
            
            index++;
            
            subview_frame.origin.x = position_x + margin_left;
            
            subview_frame.origin.y = position_y - subview_frame.size.height - margin_bottom;
            
            subview.frame = subview_frame;
            
            position_x += ( subview_margin.left + subview_frame.size.width + subview_margin.right );
        }
    }
    else // center
    {
        position_y += ( target_height / 2 ); // position = center
        
        index = 0;
        
        for ( NSInteger i = 0 , len = self.subviews.count ; i < len ; i++ )
        {
            UIView *subview = [self.subviews objectAtIndex:i];
            
            if ( subview.hidden || subview.alpha == 0.0 )
            {
                continue;
            }
            
            CGRect subview_frame = subview.frame;
            
            UIEdgeInsets subview_margin = margins[i];
            
            CGFloat margin_left = subview_margin.left;
            
            if ( i > 0 ) position_x += aDividerDistance;
            
            index++;
            
            subview_frame.origin.x = position_x + margin_left;
            
            subview_frame.origin.y = position_y - (subview_frame.size.height / 2 );
            
            subview.frame = subview_frame;
            
            position_x += ( subview_margin.left + subview_frame.size.width + subview_margin.right );
        }
    }
}

- (void)linearLayoutWithOrientation:(LayoutOrientation)aOrientation
                            padding:(UIEdgeInsets)aPadding
                              align:(NSInteger)aAlign
                       wrapToHeight:(BOOL)isWrapToHeight
                        wrapToWidth:(BOOL)isWrapToWidth
              subviewMarginCallback:(UIEdgeInsets(^)(UIView *))aSubviewMarginCallback
{
    [self linearLayoutWithOrientation:aOrientation
                              padding:aPadding
                        dividerDistance:0.0f
                                align:aAlign
                         wrapToHeight:isWrapToHeight
                          wrapToWidth:isWrapToWidth
                subviewMarginCallback:aSubviewMarginCallback];
}

- (void)linearLayoutWithOrientation:(LayoutOrientation)aOrientation
                            padding:(UIEdgeInsets)aPadding
                      dividerDistance:(CGFloat)aDividerDistance
                              align:(NSInteger)aAlign
                       wrapToHeight:(BOOL)isWrapToHeight
                        wrapToWidth:(BOOL)isWrapToWidth
              subviewMarginCallback:(UIEdgeInsets(^)(UIView *))aSubviewMarginCallback
{
    if ( aOrientation == LayoutOrientationHorizontal )
    {
        [self linearLayoutHorizontalWithPadding:aPadding
                                          align:aAlign
                                     dividerDistance:aDividerDistance
                                   wrapToHeight:isWrapToHeight
                                    wrapToWidth:isWrapToWidth
                          subviewMarginCallback:aSubviewMarginCallback];
    }
    else
    {
        [self linearLayoutVerticalWithPadding:aPadding
                                        align:aAlign
                                dividerDistance:aDividerDistance
                                 wrapToHeight:isWrapToHeight
                                  wrapToWidth:isWrapToWidth
                        subviewMarginCallback:aSubviewMarginCallback];
    }
}

- (CGSize) size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)aSize
{
    CGRect rect = self.frame;
    
    rect.size.width = aSize.width;
    
    rect.size.height = aSize.height;
    
    self.frame = rect;
}

- (void)removeAllSubviews
{
    NSArray *subviews = self.subviews;
    
    for ( UIView *subview in subviews )
    {
        [subview removeFromSuperview];
    }
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addBorderWithColor:(UIColor *)color and:(CGFloat)borderWidth {
    [self addTopBorderWithColor:color andWidth:borderWidth];
    [self addBottomBorderWithColor:color andWidth:borderWidth];
    [self addLeftBorderWithColor:color andWidth:borderWidth];
    [self addRightBorderWithColor:color andWidth:borderWidth];
}


@end
