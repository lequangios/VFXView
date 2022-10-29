//
//  UIView+VFX.m
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#import "UIView+VFX.h"

@implementation UIView (VFX)

-(void) setWidth:(CGFloat) newWidth {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newWidth, self.frame.size.height);
}

-(CGFloat)width {
    return self.frame.size.width;
}

-(void) setHeight:(CGFloat) newHeight {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.height, newHeight);
}

-(CGFloat)height {
    return self.frame.size.height;
}

-(void) setX:(CGFloat) newX {
    self.frame = CGRectMake(newX, self.frame.origin.y, self.frame.size.height, self.frame.size.width);
}

-(CGFloat)x {
    return self.frame.origin.x;
}

-(void) setY:(CGFloat) newY {
    self.frame = CGRectMake(self.frame.origin.x, newY, self.frame.size.height, self.frame.size.width);
}

-(CGFloat)y {
    return self.frame.origin.y;
}

-(CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

-(void) setSize:(CGSize)size {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

-(CGSize) size {
    return self.frame.size;
}

-(void) setCenterXY:(CGPoint)centerXY {
    self.x = 2*centerXY.x - self.width;
    self.y = 2*centerXY.y - self.height;
}

-(CGPoint) centerXY {
    return CGPointMake((self.x + self.width)/2, (self.y + self.height)/2);
}

@end
