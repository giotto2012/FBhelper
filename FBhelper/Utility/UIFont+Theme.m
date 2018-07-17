//
//  UIFont+Theme.m
//  SuperTrader2
//
//  Created by Awei Kuo on 2014/12/27.
//  Copyright (c) 2014年 i-Shepherd. All rights reserved.
//

#import "UIFont+Theme.h"

@implementation UIFont (Theme)

+ (UIFont *)fontMankSansWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"MankSans" size:size];
}

+ (UIFont *)fontMankSansMediumWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"MankSans-Medium" size:size];
}

+ (UIFont *)fontCourierWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Courier" size:size];
}

+ (UIFont *)fontFuturaWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Futura" size:size];
}

+ (UIFont *)fontArialWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Arial" size:size];
}

+ (UIFont *)fontTrebuchetMSWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Trebuchet-MS" size:size];
}



+ (UIFont *)fontForNumeric:(CGFloat)size {
    return [self fontMankSansMediumWithSize:size];
}

+ (UIFont *)fontForText:(CGFloat)size{
    return [self fontMankSansMediumWithSize:size];
}

+ (UIFont *)fontForText2:(CGFloat)size{
    return [self fontMankSansMediumWithSize:size];
}

@end
