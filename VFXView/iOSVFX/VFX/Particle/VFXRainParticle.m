//
//  VFXRainParticle.m
//  iOSVFX
//
//  Created by Le Quang on 11/10/2022.
//

#import "VFXRainParticle.h"
#import "UIColor+VFX.h"
#import "NSNumber+VFX.h"

@implementation VFXRainParticle
@synthesize x       = _x;
@synthesize y       = _y;
@synthesize l       = _l;
@synthesize xs      = _xs;
@synthesize ys      = _ys;

-(instancetype) initWithX:(CGFloat) x_value withY:(CGFloat) y_value withL:(CGFloat) l_value withXS:(CGFloat) xs_value withYS:(CGFloat) ys_value
{
    self = [super init];
    if(self)
    {
        _x = x_value; _y = y_value; _l = l_value; _xs = xs_value; _ys = ys_value;
    }
    return self;
}

-(instancetype) initWithRect:(CGRect)rect {
    self = [super initWithRect:rect];
    if(self){
        _x = [NSNumber vfxRandomFloat]*self.width;
        _y = [NSNumber vfxRandomFloat]*self.height;
        _l = [NSNumber vfxRandomFloat];
        _xs = -4 + [NSNumber vfxRandomFloat]*4 + 2;
        _ys = [NSNumber vfxRandomFloat]*10 + 10;
    }
    return self;
}

-(void) updateParticleWithRect:(CGRect)rect {
    [super updateParticleWithRect:rect];
    _x += _xs;
    _y += _ys;
    if (_x > self.width || _y > self.height) {
        _x = [NSNumber vfxRandomFloat] * self.width;
        _y = -20;
    }
}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, self.x, self.y);
    CGContextAddLineToPoint(ctx, self.x + self.l * self.xs, self.y + self.l * self.ys);
    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}
@end
