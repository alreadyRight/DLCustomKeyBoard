//
//  DLKeyBoardView.m
//  DLCustomKeyBoard
//
//  Created by 周冰烽 on 2019/5/29.
//  Copyright © 2019 周冰烽. All rights reserved.
//

#import "DLKeyBoardView.h"
#import "DLConst.h"
#import "UIColor+DLAddtion.h"
#define keybordHeight PX(216)
//背景颜色
#define bgColor [UIColor dl_colorWithHex:0xD2D3D8]
//普通按钮高亮颜色
#define nmHLColor [UIColor dl_colorWithHex:0xB7C4D0]

#define funKeyColor [UIColor dl_colorWithHex:0xA9AEBB]

@interface DLKeyBoardView ()
//数字视图
@property (nonatomic, weak)UIView * numberView;
//字母视图
@property (nonatomic, weak)UIView * alphabetView;
//是否大写
@property (nonatomic, assign)BOOL switchCaseIsSelected;

@property (nonatomic, strong)NSArray * alphabetData;

@end

@implementation DLKeyBoardView

- (NSArray *)alphabetData {
	if (!_alphabetData) {
		_alphabetData = [NSArray array];
	}
	return _alphabetData;
}

- (instancetype)init{
	if (self = [super init]) {
		[self addKeyboardViewWithType:DLKeyboardTypeEnglishLowercase];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self addKeyboardViewWithType:DLKeyboardTypeEnglishLowercase];
	}
	return self;
}

- (void)setType:(DLKeyboardType)type{
	_type = type;
	[self addKeyboardViewWithType:type];
}

- (void)addKeyboardViewWithType:(DLKeyboardType)type{
	if (type == DLKeyboardTypeNumber) {
		[self addNumberView];
	}else{
		[self addAlphabetViewWithType:type];
	}
}

- (void)resoveDataWithType:(DLKeyboardType)type{
	NSMutableArray *titleArray = nil;
	NSMutableArray *randomArr = [NSMutableArray array];
	if (type == DLKeyboardTypeEnglishUppercase) {
		titleArray = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
		while (titleArray.count>0) {
			int random = arc4random()%(titleArray.count);
			[randomArr addObject:titleArray[random]];
			[titleArray removeObjectAtIndex:random];
		}
	}else{
		titleArray = [NSMutableArray arrayWithArray:@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"]];
		while (titleArray.count>0) {
			int random = arc4random()%(titleArray.count);
			[randomArr addObject:titleArray[random]];
			[titleArray removeObjectAtIndex:random];
		}
	}
	self.alphabetData = randomArr;
}

- (void)addAlphabetViewWithType:(DLKeyboardType)type {
	if (self.numberView) {
		[self.numberView removeFromSuperview];
	}
	UIView *alphabetView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, dl_ScreenWidth, keybordHeight)];
	alphabetView.backgroundColor = bgColor;
	[self resoveDataWithType:type];
	NSMutableArray *randomArr = [NSMutableArray arrayWithArray:self.alphabetData];
	CGFloat crossSpacing = 5.0f;//横向间隔
	CGFloat portraitSpaceing = 12.0f;//竖向间隔
	CGFloat btnWidth = (dl_ScreenWidth - 11 * crossSpacing) / 10.0f;
	CGFloat btnHeight = (keybordHeight - 5 * portraitSpaceing) / 4.0f;
	//第一排:10个
	for (NSInteger i = 0; i < 10; i++) {
		UIButton *btn = [[UIButton alloc]init];
		btn.frame = CGRectMake(((i+1)*crossSpacing + i * btnWidth), portraitSpaceing, btnWidth, btnHeight);
		btn.layer.cornerRadius = 3;
		btn.layer.shadowOffset = CGSizeMake(0, 4);
		btn.layer.shadowOpacity = 0.2;
		btn.layer.shadowColor = [UIColor blackColor].CGColor;
		[btn setTitle:randomArr[i] forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		btn.backgroundColor = [UIColor whiteColor];
		[btn addTarget:self action:@selector(contentBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
		[btn addTarget:self action:@selector(addContentBtn:) forControlEvents:UIControlEventTouchUpInside];
		[alphabetView addSubview:btn];
	}
	//第二排:9个
	for (NSInteger i = 10; i < 19; i++) {
		UIButton *btn = [[UIButton alloc]init];
		btn.frame = CGRectMake((crossSpacing + btnWidth / 2.0 + (i - 10) * crossSpacing + (i - 10) * btnWidth), 2*portraitSpaceing + btnHeight, btnWidth, btnHeight);
		btn.layer.cornerRadius = 3;
		btn.layer.shadowOffset = CGSizeMake(0, 4);
		btn.layer.shadowOpacity = 0.2;
		btn.layer.shadowColor = [UIColor blackColor].CGColor;
		[btn setTitle:randomArr[i] forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		btn.backgroundColor = [UIColor whiteColor];
		[btn addTarget:self action:@selector(contentBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
		[btn addTarget:self action:@selector(addContentBtn:) forControlEvents:UIControlEventTouchUpInside];
		[alphabetView addSubview:btn];
	}
	//第三排:9个
	for (NSInteger i = 19; i < 26; i++) {
		UIButton *btn = [[UIButton alloc]init];
		btn.frame = CGRectMake(3*btnWidth/2.0 + 2*crossSpacing + (i-19)*(btnWidth+crossSpacing), 3*portraitSpaceing+2*btnHeight, btnWidth, btnHeight);
		btn.layer.cornerRadius = 3;
		btn.layer.shadowOffset = CGSizeMake(0, 4);
		btn.layer.shadowOpacity = 0.2;
		btn.layer.shadowColor = [UIColor blackColor].CGColor;
		[btn setTitle:randomArr[i] forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		btn.backgroundColor = [UIColor whiteColor];
		[btn addTarget:self action:@selector(contentBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
		[btn addTarget:self action:@selector(addContentBtn:) forControlEvents:UIControlEventTouchUpInside];
		[alphabetView addSubview:btn];
	}
	
	//切换大小写
	UIButton *btn = [[UIButton alloc]init];
	btn.frame = CGRectMake(crossSpacing, 3*portraitSpaceing+2*btnHeight, btnHeight, btnHeight);
	btn.layer.cornerRadius = 3;
	btn.layer.shadowOffset = CGSizeMake(0, 4);
	btn.layer.shadowOpacity = 0.2;
	btn.layer.shadowColor = [UIColor blackColor].CGColor;
	[btn setImage:[UIImage imageNamed:@"capital"] forState:UIControlStateNormal];
	[btn setImage:[UIImage imageNamed:@"capital_select"] forState:UIControlStateSelected];
	btn.backgroundColor = funKeyColor;
	btn.selected = self.switchCaseIsSelected;
	[btn addTarget:self action:@selector(functionBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
	[btn addTarget:self action:@selector(switchCase:) forControlEvents:UIControlEventTouchUpInside];
	[alphabetView addSubview:btn];
	//删除键
	UIButton *deleteBtn = [[UIButton alloc]init];
	deleteBtn.frame = CGRectMake(dl_ScreenWidth - 3 * crossSpacing - btnWidth, 3*portraitSpaceing+2*btnHeight, btnHeight, btnHeight);
	deleteBtn.layer.cornerRadius = 3;
	deleteBtn.layer.shadowOffset = CGSizeMake(0, 4);
	deleteBtn.layer.shadowOpacity = 0.2;
	deleteBtn.layer.shadowColor = [UIColor blackColor].CGColor;
	[deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
	deleteBtn.backgroundColor = funKeyColor;
	[deleteBtn addTarget:self action:@selector(functionBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
	[deleteBtn addTarget:self action:@selector(deleteCharacter:) forControlEvents:UIControlEventTouchUpInside];
	[alphabetView addSubview:deleteBtn];
	
	CGFloat funcKeyWidth = 2.5*btnWidth + crossSpacing;
	//切换成数字键
	UIButton *switchBtn = [[UIButton alloc]init];
	switchBtn.frame = CGRectMake(crossSpacing, 4*portraitSpaceing+3*btnHeight, funcKeyWidth, btnHeight);
	switchBtn.backgroundColor = funKeyColor;
	switchBtn.layer.cornerRadius = 3;
	switchBtn.layer.shadowOffset = CGSizeMake(0, 4);
	switchBtn.layer.shadowOpacity = 0.2;
	switchBtn.layer.shadowColor = [UIColor blackColor].CGColor;
	[switchBtn setTitle:@"123" forState:UIControlStateNormal];
	[switchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[switchBtn addTarget:self action:@selector(functionBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
	[switchBtn addTarget:self action:@selector(changeToAlphabetView:) forControlEvents:UIControlEventTouchUpInside];
	[alphabetView addSubview:switchBtn];
	
	//空格键
	UIButton *spaceBtn = [[UIButton alloc]init];
	CGFloat spaceWidth = 5*btnWidth+4*crossSpacing;
	spaceBtn.frame = CGRectMake(2*crossSpacing+funcKeyWidth, 4*portraitSpaceing+3*btnHeight, spaceWidth, btnHeight);
	spaceBtn.backgroundColor = [UIColor whiteColor];
	spaceBtn.layer.cornerRadius = 3;
	spaceBtn.layer.shadowOffset = CGSizeMake(0, 4);
	spaceBtn.layer.shadowOpacity = 0.2;
	spaceBtn.layer.shadowColor = [UIColor blackColor].CGColor;
	[spaceBtn setTitle:@"space" forState:UIControlStateNormal];
	[spaceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[spaceBtn addTarget:self action:@selector(contentBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
	[spaceBtn addTarget:self action:@selector(addContentBtn:) forControlEvents:UIControlEventTouchUpInside];
	[alphabetView addSubview:spaceBtn];
	
	//确认/换行键
	UIButton *enterBtn = [[UIButton alloc]init];
	enterBtn.frame = CGRectMake(crossSpacing * 3 + funcKeyWidth + spaceWidth, 4*portraitSpaceing+3*btnHeight, funcKeyWidth, btnHeight);
	enterBtn.backgroundColor = funKeyColor;
	enterBtn.layer.cornerRadius = 3;
	enterBtn.layer.shadowOffset = CGSizeMake(0, 4);
	enterBtn.layer.shadowOpacity = 0.2;
	enterBtn.layer.shadowColor = [UIColor blackColor].CGColor;
	[enterBtn setTitle:@"确认" forState:UIControlStateNormal];
	[enterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[enterBtn addTarget:self action:@selector(functionBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
	[enterBtn addTarget:self action:@selector(clickEnter:) forControlEvents:UIControlEventTouchUpInside];
	[alphabetView addSubview:enterBtn];
	
	
	
	[self addSubview:alphabetView];
	self.alphabetView = alphabetView;
}

- (void)addNumberView{
	if (self.alphabetView) {
		[self.alphabetView removeFromSuperview];
	}
	UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, dl_ScreenWidth, keybordHeight)];
	bgView.backgroundColor = bgColor;
	//创建按钮标题数组
	NSMutableArray *numArr = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"]];
	NSMutableArray *randomArr = [NSMutableArray array];
	while (numArr.count > 0) {
		NSInteger random = arc4random() % numArr.count;
		[randomArr addObject:numArr[random]];
		[numArr removeObjectAtIndex:random];
	}
	[randomArr insertObject:@"ABC" atIndex:9];
	[randomArr insertObject:@"delete" atIndex:11];
	//设置按钮之间的间隔
	CGFloat spacing = 5.0f;
	//按钮宽度
	CGFloat btnWidth = (dl_ScreenWidth - spacing * 4) / 3.0;
	//按钮高度
	CGFloat btnHeight = (keybordHeight - spacing * 5) / 4.0;
	
	for (NSInteger i = 0; i < 12; i++) {
		if (i == 9) {
			//按钮功能:切换成英文
			UIButton *btn = [[UIButton alloc]init];
			btn.frame = CGRectMake(spacing, (3 * btnHeight + 4 * spacing), btnWidth, btnHeight);
			[btn setTitle:randomArr[i] forState:UIControlStateNormal];
			[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
			btn.backgroundColor = bgColor;
			[btn addTarget:self action:@selector(changeToAlphabetView:) forControlEvents:UIControlEventTouchUpInside];
			[bgView addSubview:btn];
		} else if (i == 11) {
			//按钮功能:删除字符
			UIButton *btn = [[UIButton alloc]init];
			btn.frame = CGRectMake((3 * spacing + 2 * btnWidth), (3 * btnHeight + 4 * spacing), btnWidth, btnHeight);
			[btn setImage:[UIImage imageNamed:randomArr[i]] forState:UIControlStateNormal];
			btn.backgroundColor = bgColor;
			[btn addTarget:self action:@selector(deleteCharacter:) forControlEvents:UIControlEventTouchUpInside];
			[bgView addSubview:btn];
		} else {
			//数字按钮:0~9
			UIButton *btn = [[UIButton alloc]init];
			//判断当前处于第几列
			NSInteger col = i % 3;
			//判断当前处于第几行
			NSInteger row = i / 3;
			btn.frame = CGRectMake(((col+1) * spacing + col * btnWidth), ((row + 1) * spacing + row * btnHeight), btnWidth, btnHeight);
			[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
			[btn setTitle:randomArr[i] forState:UIControlStateNormal];
			btn.backgroundColor = [UIColor whiteColor];
			btn.layer.cornerRadius = 6;
			btn.layer.shadowOffset =  CGSizeMake(0, 4);
			btn.layer.shadowOpacity = 0.2;
			btn.layer.shadowColor = [UIColor blackColor].CGColor;
			[btn addTarget:self action:@selector(contentBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
			[btn addTarget:self action:@selector(addContentBtn:) forControlEvents:UIControlEventTouchUpInside];
			[bgView addSubview:btn];
		}
		
	}
	
	[self addSubview:bgView];
	self.numberView = bgView;
}


#pragma mark - clickEvent

/**
 功能按钮点击高亮颜色
 */
- (void)functionBtnHighlighted:(UIButton *)sender {
	sender.alpha = 0.2;
}

/**
 普通按钮点击高亮颜色
 */
- (void)contentBtnHighlighted:(UIButton *)sender {
	sender.backgroundColor = nmHLColor;
}

/**
 数字键盘切换成英文按钮点击事件
 */
- (void)changeToAlphabetView:(UIButton *)sender {
	sender.alpha = 1;
	if ([sender.titleLabel.text isEqualToString:@"123"]) {
		//切换成数字
		if (self.alphabetView) {
			[self.alphabetView removeFromSuperview];
			[self addNumberView];
		}
	} else {
		//切换成英文
		if (self.numberView) {
			[self.numberView removeFromSuperview];
			[self addAlphabetViewWithType:DLKeyboardTypeEnglishLowercase];
		}
	}
}

/**
 数字键盘删除按钮点击事件
 */
- (void)deleteCharacter:(UIButton *)sender {
	sender.alpha = 1;
	if (self.delegate && [self.delegate respondsToSelector:@selector(deleteValue)]) {
		[self.delegate deleteValue];
	}
}

/**
 普通按钮输入字符点击事件
 */
- (void)addContentBtn:(UIButton *)sender {
	sender.backgroundColor = [UIColor whiteColor];
	if (self.delegate && [self.delegate respondsToSelector:@selector(inputValue:)]) {
		if ([sender.titleLabel.text isEqualToString:@"space"]) {
			[self.delegate inputValue:@" "];
		} else {
			[self.delegate inputValue:sender.titleLabel.text];
		}
	}
}

/**
 切换大小写
 */
- (void)switchCase:(UIButton *)sender {
	sender.alpha = 1;
	self.switchCaseIsSelected = !self.switchCaseIsSelected;
	if (self.switchCaseIsSelected) {
		//切换成大写
		if (self.alphabetView) {
			[self.alphabetView removeFromSuperview];
			[self addAlphabetViewWithType:DLKeyboardTypeEnglishUppercase];
		}
	}else{
		//切换成小写
		if (self.alphabetView) {
			[self.alphabetView removeFromSuperview];
			[self addAlphabetViewWithType:DLKeyboardTypeEnglishLowercase];
		}
	}
}

/**
 确定键
 */
- (void)clickEnter:(UIButton *)sender {
	sender.alpha = 1;
}

@end
