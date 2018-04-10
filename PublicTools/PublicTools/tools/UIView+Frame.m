//
//  UIView+Frame.m
//  PublicTools
//
//  Created by ECOOP－09 on 2016/10/26.
//  Copyright © 2016年 chenming. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)



-(CGPoint)Origin{

    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)Origin{

    CGRect newFrame = self.frame;
    newFrame.origin = Origin;
    self.frame = newFrame;
}

-(CGSize)size{

    return self.frame.size;
}

- (void)setSize:(CGSize)size{

    CGRect newFrame = self.frame;
    newFrame.size = size;
    self.frame = newFrame;
}

-(CGFloat)x{

    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x{

    CGRect newFrame = self.frame;
    newFrame.origin.x = x;
    self.frame = newFrame;
}

-(CGFloat)y{

    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y{

    CGRect newFrame = self.frame;
    newFrame.origin.y = y;
    self.frame = newFrame;
}

-(CGFloat)width{

    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width{

    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}

-(CGFloat)height{

    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height{

    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

-(CGFloat)maxX{

    return CGRectGetMaxX(self.frame);
}

-(CGFloat)maxY{

    return CGRectGetMaxY(self.frame);
}

-(CGFloat)radius{

    return self.layer.cornerRadius;
}

-(void)setRadius:(CGFloat)radius{
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void)circular{
    
    self.radius = self.width/2;
}

- (void)scale:(CGFloat)multiple{

    CGRect newFrame = self.frame;
    newFrame.size.width *= multiple;
    newFrame.size.height *= multiple;
    self.frame = newFrame;
}
@end
