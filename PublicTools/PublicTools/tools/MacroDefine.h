//
//  MacroDefine.h
//  PublicTools
//
//  Created by ECOOP－09 on 16/8/18.
//  Copyright © 2016年 ECOOP－09. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h


#ifndef __OPTIMIZE__
//这里执行的是debug模式下
#else
//这里执行的是release模式下
#endif

#if defined (__i386__) || defined (__x86_64__)
//模拟器下执行
#else
//真机下执行
#endif


//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


/**
 *   查看代码运行时间
 */
#define TICK   NSDate *startTime = [NSDate date] //代码前调
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])  //代码后调
/**
 *   优化NSLog(),能够打印出所在类名、所在方法名、详细时间、行号
 */
#define NSLog(format, ...) do { \
fprintf(stderr, " %s\n", \
        [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
        __LINE__, __func__); \
(NSLog)((format), ##__VA_ARGS__); \
fprintf(stderr, "-------\n"); \
} while (0)
/**
 *    屏幕适配相关
 */
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define NavigationBar_HEIGHT 64
#define TableBar_HEIGHT 49
#define SCALE_SIZE ([UIScreen mainScreen].bounds.size.width / 375.0)//适配尺寸宏,375表示以iPhone6屏为基准
#define FONT(A) [UIFont systemFontOfSize:(A * SCALE_SIZE)]//定义字体宏



/**
 *  三色 RGB 定义
 */
#define SETCOLOR(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed(float)((rgbValue & 0xFF0000) >> 16))/255.0 green(float)((rgbValue & 0xFF00) >> 8))/255.0 blue(float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif


//----------------------系统----------------------------

// 是否iPad
#define isIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// 是否iphone
#define isIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [UIDevice currentDevice].systemVersion
//获取系统名字
#define CurrentSystemName [UIDevice currentDevice].systemName

//获取当前语言
#define CurrentLanguage [[NSLocale preferredLanguages] objectAtIndex:0]

//判断是否 Retina屏、设备是否iphone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), ［UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), ［UIScreen mainScreen] currentMode].size) : NO)


//判断设备的操做系统是不是ios7以上
#define isIOS7 ［[UIDevice currentDevice].systemVersion doubleValue] >= 7.0]



//----------------------内存----------------------------

//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif


//----------------------图片----------------------------
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:［NSBundle mainBundle]pathForResource:file ofType:ext］


//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)


//单例化一个类
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = ［self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#endif /* MacroDefine_h */
