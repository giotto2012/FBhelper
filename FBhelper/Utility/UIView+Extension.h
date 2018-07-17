//
//  UIView+Extension.h
//  TransAsia
//
//  Created by  on 12/5/15.
//  Copyright (c) 2012年 Streams. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    AlignLeft   = ( 1 << 1 ),
    AlignRight  = ( 1 << 2 ),
    AlignCenter = ( 1 << 3 ),
    AlignTop    = ( 1 << 4 ),
    AlignBottom = ( 1 << 5 )
}
LayoutAlign;

typedef enum
{
    LayoutOrientationVertical,
    LayoutOrientationHorizontal
}
LayoutOrientation;

//typedef enum
//{
//    AlignToHeader,
//    AlignToMiddle,
//    AlignToFloor
//}
//LayoutAlign;

@interface UIView(Extension)

@property ( nonatomic , readwrite ) CGFloat centerX;
@property ( nonatomic , readwrite ) CGFloat centerY;

@property ( nonatomic , readwrite ) CGFloat bottom;
@property ( nonatomic , readwrite ) CGFloat top;
@property ( nonatomic , readwrite ) CGFloat left;
@property ( nonatomic , readwrite ) CGFloat right;


@property ( nonatomic , readwrite ) CGFloat height;
@property ( nonatomic , readwrite ) CGFloat width;
@property ( nonatomic , readwrite ) CGFloat x;
@property ( nonatomic , readwrite ) CGFloat y;

@property ( nonatomic , readwrite ) CGSize size;

//- (CGFloat)bottom;
//- (CGFloat)top;
//- (CGFloat)left;
//- (CGFloat)right;

//- (CGFloat)height;
//- (CGFloat)width;
//- (CGFloat)x;
//- (CGFloat)y;

//- (void)removeLayerAnimations;

- (CGPoint)boundCenter;

//- (void)cleanAnimations;
- (void)setHeight:(CGFloat)aHeight;
- (void)setWidth:(CGFloat)aWidth;
- (void)setWidth:(CGFloat)aWidth Height:(CGFloat)aHeight;

- (void)setX:(CGFloat)aOriginX;
- (void)setY:(CGFloat)aOriginY;
- (void)setX:(CGFloat)aOriginX Y:(CGFloat)aOriginY;

- (void)setX:(CGFloat)aOriginX width:(CGFloat)aWidth;
- (void)setY:(CGFloat)aOriginY height:(CGFloat)aHeight;

- (void)removeAllSubviews;

//- (void)layoutSubviewsVerticalWithAlign:(LayoutAlign)aLayoutAlign
//                       WithWrapToHeight:(BOOL)isWrapToHeight 
//                        withWrapToWidth:(BOOL)isWrapToWidth 
//                            withPadding:(UIEdgeInsets)aPadding 
//                      withdividerDistance:(CGFloat)aDivider;
//
//- (void)layoutSubviewsHorizontalWithAlign:(LayoutAlign)aLayoutAlign
//                         WithWrapToHeight:(BOOL)isWrapToHeight 
//                          withWrapToWidth:(BOOL)isWrapToWidth 
//                              withPadding:(UIEdgeInsets)aPadding 
//                        withdividerDistance:(CGFloat)aDivider;

- (void)linearLayoutWithOrientation:(LayoutOrientation)aOrientation
                            padding:(UIEdgeInsets)aPadding
                            align:(NSInteger)aAlign
                       wrapToHeight:(BOOL)isWrapToHeight
                        wrapToWidth:(BOOL)isWrapToWidth
              subviewMarginCallback:(UIEdgeInsets(^)(UIView *))aSubviewMarginCallback;

- (void)linearLayoutWithOrientation:(LayoutOrientation)aOrientation
                            padding:(UIEdgeInsets)aPadding
                      dividerDistance:(CGFloat)aDividerDistance
                              align:(NSInteger)aAlign
                       wrapToHeight:(BOOL)isWrapToHeight
                        wrapToWidth:(BOOL)isWrapToWidth
              subviewMarginCallback:(UIEdgeInsets(^)(UIView *))aSubviewMarginCallback;



- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth ;
- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth ;
- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addBorderWithColor:(UIColor *)color and:(CGFloat)borderWidth;

@end
