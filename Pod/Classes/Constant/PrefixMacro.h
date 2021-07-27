//
//  DJMacro.h
//  宏
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#ifndef CPDMacro_h
#define CPDMacro_h

//
#define <# #> @""


//屏幕尺寸
#define CPDScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define INCLUDED_PREFIXESScreenHeight ([UIScreen mainScreen].bounds.size.height)

//本地数据
#define HUserDefault  [NSUserDefaults standardUserDefaults]

//weakself
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//strongself
#define SS(strongself) __strong typeof(&*self) strongself = weakSelf; //避免block内内容被提前释放

//字符串是否为空
#define KSTRING_IS_EMPTY(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 || [str isEqual:[NSNull null]] ? YES : NO )
//数组是否为空
#define KARRAY_IS_EMPTY(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define KDICT_IS_EMPTY(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys.count == 0)
//是否是空对象
#define KOBJECT_IS_EMPYT(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


//导航栏高度
#define kNavigationBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height + 44)
// 状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
// 导航栏 + 状态栏 高度
#define kNavStatusHeight (kNavigationBarHeight + 0)
//  底部安全高度
#define kSafeAreaInsetsBottom \
({\
CGFloat bottomInsert = 0;\
if (@available(iOS 11.0, *)) {\
    bottomInsert= [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;\
} else {\
}\
bottomInsert;\
})

/**  字体宏，字体大小 */
#define kWordFont(fontSize) [UIFont systemFontOfSize:(CGFloat)fontSize]
/**  字体宏，字体大小，字体粗细 */
#define kWordFontWeight(fontSize,fontWeight) \
({\
UIFont *rfont = nil;\
if (@available(iOS 8.2, *)) {\
    rfont = [UIFont systemFontOfSize:fontSize weight:fontWeight];\
}else{\
    rfont = [UIFont systemFontOfSize:fontSize];\
}\
rfont;\
})

#endif /* CPDMacro_h */
