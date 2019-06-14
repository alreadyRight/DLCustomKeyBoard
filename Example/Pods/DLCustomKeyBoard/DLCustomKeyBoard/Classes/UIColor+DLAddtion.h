//
//  UIColor+DLAddtion.h
//  回顾
//
//  Created by 周冰烽 on 2017/11/28.
//  Copyright © 2017年 devil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DLAddtion)

/**
 rgba选取颜色

 @param red 红
 @param green 绿
 @param blue 蓝
 @param alpha 透明度
 @return UIColor
 */
+ (instancetype)dl_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha;

/**
 rgb选取颜色
 
 @param red 红
 @param green 绿
 @param blue 蓝
 @return UIColor
 */
+ (instancetype)dl_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

/**
 16进制颜色选取

 @param hex 16进制颜色数字
 @param alpha 透明度
 @return UIColor
 */
+ (instancetype)dl_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

/**
 16进制颜色选取
 
 @param hex 16进制颜色数字
 @return UIColor
 */
+ (instancetype)dl_colorWithHex:(uint32_t)hex;


/**
 随机颜色

 @param alpha 透明度
 @return UIColor
 */
+(instancetype)dl_randomColorWithAlpha:(CGFloat)alpha;


/**
 随机颜色

 @return UIColor
 */
+(instancetype)dl_randomColor;

@end
