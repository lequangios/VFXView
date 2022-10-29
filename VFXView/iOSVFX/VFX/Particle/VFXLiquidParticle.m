//
//  VFXLiquidParticle.m
//  iOSVFX
//
//  Created by Le Quang on 08/10/2022.
//

#import "VFXLiquidParticle.h"
#import "UIColor+VFX.h"
#import "NSNumber+VFX.h"

@interface VFXLiquidParticle ()

@property(nonatomic, assign) CGFloat c_ax;
@property(nonatomic, assign) CGFloat c_ay;

@end

@implementation VFXLiquidParticle

@synthesize x       = _x;
@synthesize y       = _y;
@synthesize r       = _r;
@synthesize sx      = _sx;
@synthesize sy      = _sy;
@synthesize c_ax    = _c_ax;
@synthesize c_ay    = _c_ay;

-(instancetype) initWithRect:(CGRect)rect {
    self = [super initWithRect:rect];
    if(self){
        CGFloat angle = [NSNumber vfxRandomRads];
        _x = 0.5*self.width;
        _y = 0.5*self.height;
        _r = [NSNumber vfxRandomFloat]+10;
        _sx = 34*cos(angle)*[NSNumber vfxRandomFloat];
        _sy = 34*sin(angle)*[NSNumber vfxRandomFloat];
        self.color = [UIColor VFXRandomColorWithRed:255 green:255 blue:255];
        _c_ax = _x;
        _c_ay = _y;
    }
    return self;
}

-(instancetype) initWithRect:(CGRect)rect andIndex:(int)index {
    self = [super initWithRect:rect];
    if(self){
        _x = 0.5*self.width;
        _y = 0.5*self.height;
        _r = [NSNumber vfxRandomFloat]+10;
        _sx = 34*cos(index)*[NSNumber vfxRandomFloat];
        _sy = 34*sin(index)*[NSNumber vfxRandomFloat];
        self.color = [UIColor VFXRandomColorWithRed:255 green:255 blue:255];
        _c_ax = _x;
        _c_ay = _y;
    }
    return self;
}

-(CGFloat) maxLenght {
    return 0.86*MAX(self.width, self.height);
    //return 0.86*self.width;
}

-(CGFloat) minLength {
    //return 0.125*MAX(self.width, self.height);
    return 0.125*self.width;
}

-(CGFloat) centerLength {
    //return 0.5*MAX(self.width, self.height);
    return 0.5*self.width;
}


-(void) updateParticleWithRect:(CGRect) rect andPoint:(CGPoint) point andIsTouchDown:(BOOL) isTouchDown {
    [super updateParticleWithRect:rect];
    self.isTouchDown = isTouchDown;
    
    CGFloat ax = point.x;
    CGFloat ay = point.y;
    
    float x = ax - _c_ax;
    float y = ay - _c_ay;
    _c_ax = ax;
    _c_ay = ay;
    
    float dx = _x - ax;
    float dy = _y - ay;
    float length = sqrtf(dx*dx + dy*dy);
    if (length == 0) length = 0.001;
    dx = dx/length;
    dy = dy/length;
    
    if(length < self.centerLength && self.isTouchDown)
    {
        float s = 14*(1 - length/self.centerLength);
        _sx += dx*s + 0.5 - [NSNumber vfxRandomFloat];
        _sy += dy*s + 0.5 - [NSNumber vfxRandomFloat];
    }
    
    if(length < self.maxLenght)
    {
        float s = 0.014*(1-length/self.maxLenght)*self.width;
        _sx -= dx*s;
        _sy -= dy*s;
    }
    
    if(length < self.minLength)
    {
        dx = 0.00026*(1-length/self.minLength)*self.width;
        _sx += x*dx;
        _sy += y*dx;
    }
    
    _sx *= self.scale;
    _sy *= self.scale;
    dx = fabs(_sx);
    dy = fabs(_sy);
    length = 0.5*(dx+dy);
    if(dx < 0.1) _sx *= 3*[NSNumber vfxRandomFloat];
    if(dy < 0.1) _sy *= 3*[NSNumber vfxRandomFloat];
    dx = 0.45 * length;
    dx = MAX(MIN(dx, 3.5), 0.4);
    _x += _sx;
    _y += _sy;
    
    if(_x > self.width)
    {
        _x = self.width;
        _sx *= -1;
    }
    else if(_x < 0)
    {
        _x = 0;
        _sx *= -1;
    }
    
    if(_y > self.height)
    {
        _y = self.height;
        _sy *= -1;
    }
    else if(_y < 0)
    {
        _y = 0;
        _sy *= -1;
    }
    _r = dx;
}

-(void) updateParticleWithRect:(CGRect) rect andPoint:(CGPoint) point andIsTouchDown:(BOOL) isTouchDown andScale:(CGFloat) scale {
    self.scale = scale;
    [self updateParticleWithRect:rect andPoint:point andIsTouchDown:isTouchDown];
}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    CGContextBeginPath(ctx);
    CGContextSetFillColorWithColor(ctx,self.color.CGColor);
    [self.color setFill];
    CGContextAddArc(ctx,_x, _y, _r, 0, 2*M_PI, 1);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    CGContextRestoreGState(ctx);
}

@end
