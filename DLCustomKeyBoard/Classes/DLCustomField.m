//
//  DLCustomField.m
//  DLCustomKeyBoard
//
//  Created by 周冰烽 on 2019/5/29.
//  Copyright © 2019 周冰烽. All rights reserved.
//

#import "DLCustomField.h"
#import "DLKeyBoardView.h"
#import "DLConst.h"
#import "UIColor+DLAddtion.h"

#define keybordHeight dl_iPhoneX ? PX(34 + 216) : PX(216)

@interface DLCustomField()<DLKeyBoardDelegate>

@property (nonatomic, weak)UIView * keybordView;

@end

@implementation DLCustomField

- (instancetype)init{
	if (self = [super init]) {
		[self setupUI];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupUI];
	}
	return self;
}

- (void)setupUI {
	[self addInputView];
	[self resolveKeyboarEvent];
}

- (void)addInputView {
	UIView *keybordView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, dl_ScreenWidth, keybordHeight)];
	keybordView.backgroundColor = [UIColor dl_colorWithHex:0xD2D3D8];
	self.inputView = keybordView;
	self.keybordView = keybordView;
}

- (void)resolveKeyboarEvent {
	if (!self.keybordView) {
		[self resignFirstResponder];
		[self performSelector:@selector(showDefaultKeyboard) withObject:self afterDelay:0.2];
		[self addInputView];
	}
	[self addCustomKeyboardView];
}

-(void)showDefaultKeyboard {
	self.clearsOnBeginEditing = NO;
	[self becomeFirstResponder];
	self.clearsOnBeginEditing = NO;
}

- (void)addCustomKeyboardView {
	DLKeyBoardView *keyboardView = [[DLKeyBoardView alloc]initWithFrame:self.keybordView.bounds];
//	keyboardView.type = DLKeyboardTypeEnglishLowercase;
	keyboardView.delegate = self;
	[self.keybordView addSubview:keyboardView];
}

#pragma mark - DLKeyBoardDelegate

- (void)inputValue:(NSString *)value {
	[self insertText:value];
}

- (void)deleteValue {
	[self deleteBackward];
}



@end
