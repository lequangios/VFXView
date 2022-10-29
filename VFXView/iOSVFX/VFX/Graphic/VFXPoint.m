//
//  VFXPoint.m
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#import "VFXPoint.h"

@implementation VFXPoint

@synthesize point;

-(instancetype) initWithPoint:(CGPoint) point {
    self = [super init];
    if(self){
        
    }
    return self;
}

-(instancetype) summation:(VFXPoint*) value {
    CGPoint p = CGPointMake(value.point.x + point.x, value.point.y + point.y);
    return [[VFXPoint alloc] initWithPoint:p];
}

-(instancetype) subtraction:(VFXPoint*) value {
    CGPoint p = CGPointMake(point.x - value.point.x, point.y - value.point.y);
    return [[VFXPoint alloc] initWithPoint:p];
}

-(instancetype) multiplication:(VFXPoint*) value {
    CGPoint p = CGPointMake(point.x * value.point.x, point.y * value.point.y);
    return [[VFXPoint alloc] initWithPoint:p];
}

-(CGFloat) scalar:(VFXPoint*) value {
    return (CGFloat) (point.x*value.point.x + point.y*value.point.y);
}

-(CGFloat) angle:(VFXPoint*) value {
    double cos =  [self scalar:value]/(self.length * value.length);
    return (CGFloat) acos(cos);
}

-(CGFloat) getLength {
    return (CGFloat) sqrtf(point.x*point.x + point.y*point.y);
}

-(CGPoint) getOpposite {
    return  CGPointMake(1.0 - point.x, 1.0 - point.y);
}

-(CGFloat) getDistance:(VFXPoint*) value {
    return 0;
}

-(instancetype) medium:(VFXPoint*) value {
    CGPoint p = CGPointMake((point.x + value.point.x)/2, (point.y + value.point.y)/2);
    return [[VFXPoint alloc] initWithPoint:p];
}

-(instancetype) halfMinus:(VFXPoint*) value {
    CGPoint p = CGPointMake((point.x - value.point.x)/2, (point.y - value.point.y)/2);
    return [[VFXPoint alloc] initWithPoint:p];
}

-(instancetype) absMinus:(VFXPoint*) value {
    CGPoint p = CGPointMake(fabs(point.x - value.point.x), fabs(point.y - value.point.y));
    return [[VFXPoint alloc] initWithPoint:p];
}

-(LinearEquation) getLinearEquation:(VFXPoint*) value {
    double a = -1/(value.point.x - point.x);
    double b = 1/(value.point.y - point.y);
    double c = -point.x*a - point.y*b;
    return ^double (double x) { return -(a*x + c)/b; };
}

@end
