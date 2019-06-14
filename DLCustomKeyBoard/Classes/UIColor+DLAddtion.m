//
//  UIColor+DLAddtion.m
//  回顾
//
//  Created by 周冰烽 on 2017/11/28.
//  Copyright © 2017年 devil. All rights reserved.
//

#import "UIColor+DLAddtion.h"

@implementation UIColor (DLAddtion)

+(instancetype)dl_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (instancetype)dl_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue{
    return [UIColor dl_colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (instancetype)dl_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha{
    uint8_t red = (hex & 0xff0000) >> 16;
    uint8_t green = (hex & 0x00ff00) >> 8;
    uint8_t blue = hex & 0x0000ff;
    return [UIColor dl_colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (instancetype)dl_colorWithHex:(uint32_t)hex{
    return [UIColor dl_colorWithHex:hex alpha:1.0];
}

+ (instancetype)dl_randomColorWithAlpha:(CGFloat)alpha{
    return [UIColor dl_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256) alpha:alpha];
}

+ (instancetype)dl_randomColor{
    return [UIColor dl_randomColorWithAlpha:1.0];
}

@end
