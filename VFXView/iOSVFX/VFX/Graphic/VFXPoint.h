//
//  VFXPoint.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//
#pragma clang system_header

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

#define VFX(p) [[VFXPoint alloc] initWithPoint:p]
#define p(x,y) CGPointMake(x, y)

typedef double (^LinearEquation)(double x);

@interface VFXPoint : NSObject

@property(nonatomic, assign) CGPoint point;
@property(nonatomic, assign, readonly) CGFloat length;
@property(nonatomic, assign, readonly) CGPoint opposite;

-(instancetype) initWithPoint:(CGPoint) point;
-(instancetype) summation:(VFXPoint*) value;
-(instancetype) subtraction:(VFXPoint*) value;
-(instancetype) multiplication:(VFXPoint*) value;
-(CGFloat) scalar:(VFXPoint*) value;
-(CGFloat) angle:(VFXPoint*) value;
-(CGFloat) getDistance:(VFXPoint*) value;

-(instancetype) medium:(VFXPoint*) value;
-(instancetype) halfMinus:(VFXPoint*) value;
-(instancetype) absMinus:(VFXPoint*) value;

-(LinearEquation) getLinearEquation:(VFXPoint*) value;

@end

NS_ASSUME_NONNULL_END
