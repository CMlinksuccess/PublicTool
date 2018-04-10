//
//  UIView+Frame.h
//  PublicTools
//
//  Created by ECOOP－09 on 2016/10/26.
//  Copyright © 2016年 chenming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)


/**
    坐标值
 */
@property (nonatomic, assign)CGPoint Origin;
@property (nonatomic, assign)CGSize size;
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
/**
    获取最大坐标
 */
@property (nonatomic, assign, readonly)CGFloat maxX;
@property (nonatomic, assign, readonly)CGFloat maxY;
/**
    设置圆角
 */
@property (nonatomic, assign)CGFloat radius;
/**
    设置圆形
 */
- (void)circular;

/**
    放大缩小视图

 */
- (void)scale:(CGFloat)multiple;

@end
