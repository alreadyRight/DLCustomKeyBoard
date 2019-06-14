//
//  DLKeyBoardView.h
//  DLCustomKeyBoard
//
//  Created by 周冰烽 on 2019/5/29.
//  Copyright © 2019 周冰烽. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DLKeyBoardDelegate <NSObject>

/**
 输入内容事件

 @param value 输入的内容
 */
- (void)inputValue:(NSString *)value;

/**
 删除内容
 */
- (void)deleteValue;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DLKeyBoardView : UIView

typedef enum{
	DLKeyboardTypeNumber,//数字键盘
	DLKeyboardTypeEnglishUppercase,//英文大写键盘
	DLKeyboardTypeEnglishLowercase//英文小写键盘
} DLKeyboardType;

@property (nonatomic, assign)id<DLKeyBoardDelegate> delegate;

@property (nonatomic, assign)DLKeyboardType type;

@end

NS_ASSUME_NONNULL_END
