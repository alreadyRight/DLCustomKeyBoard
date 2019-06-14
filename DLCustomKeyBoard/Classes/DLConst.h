//
//  DLConst.h
//  DLCustomKeyBoard
//
//  Created by 周冰烽 on 2019/5/29.
//  Copyright © 2019 周冰烽. All rights reserved.
//

//定义调试的宏
#ifdef DEBUG //调试模式 //打印__FUNCTION__方法,__LINE__行号,##__VA_ARGS__保证打印正确
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else//release模式关闭打印
#define DXLog(...)
#endif

#define dl_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
/** 状态栏高度 */
#define dl_StatusBarHeight dl_iPhoneX ? 44.0f: 20.0f
/** 导航栏高度 */
#define dl_NavBarHeight dl_iPhoneX ? 88.0f: 64.0f
/** 底部安全区域高度 */
#define dl_BottomAreaHeight dl_iPhoneX ? 34.0f: 0.0f

/** 屏幕尺寸 */
#define dl_ScreenSize [UIScreen mainScreen].bounds.size
#define dl_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define dl_ScreenHeight [UIScreen mainScreen].bounds.size.height

/** 适配比例 */
#define dl_Scale dl_ScreenWidth / 375.0
#define PX(px) px * dl_Scale


