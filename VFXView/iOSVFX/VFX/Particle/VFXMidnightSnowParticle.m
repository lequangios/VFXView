//
//  VFXMidnightSnowParticle.m
//  iOSVFX
//
//  Created by Le Quang on 12/10/2022.
//

#import "VFXMidnightSnowParticle.h"
#import "UIColor+VFX.h"

@implementation VFXMidnightSnowParticle
@synthesize x = _x;
@synthesize y = _y;
@synthesize t = _t;
@synthesize sz = _sz; // Snow radius
@synthesize sp = _sp;
@synthesize sc = _sc;
@synthesize min = _min;
@synthesize mv = _mv;
@synthesize tsc = _tsc;
@synthesize begin = _begin;
@synthesize end = _end;

-(instancetype) initWithRect:(CGRect)rect {
    self = [super initWithRect:rect];
    if(self){
        _sc = 1.3;
        _sp = 1;
        _min = 1;
        _mv = 20;
        _tsc = 1;
        _y = self.random*(self.height + 50);
        _x = self.random*self.width;
        _t = self.random*M_PI*2;
        _sz = _sc*(100/(10 + self.random*100));
        _sp = pow(_sz*0.8, 2)*0.15*_sp;
        _sp = _sp < _min ? _min : _sp;
    }
    return self;
}

-(instancetype) initWithRect:(CGRect)rect andBeginColor:(UIColor*) begin andEndColor:(UIColor*) end {
    self = [[VFXMidnightSnowParticle alloc] initWithRect:rect];
    if(self){
        self.begin = begin;
        self.end = end;
    }
    return self;
}

-(void) updateParticleWithRect:(CGRect)rect {
    [super updateParticleWithRect:rect];
    _t += 0.5;
    _t = (_t >= M_PI*2)? 0 : _t;
    _y += _sp;
    _x += sin(_t*_tsc)*_sz*0.3;
    if(_y > self.height + 50) _y = -10-self.random*_mv;
    if(_x > self.width + _mv) _x = -_mv;
    if (_x < - _mv) _x = self.width + _mv;
}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    CGGradientRef g = [UIColor VFXSimpleGadientWithBeginColor:self.begin.vFXCIColor andEndColor:self.end.vFXCIColor];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_x, _y)
                                                         radius:_sz
                                                     startAngle:0
                                                       endAngle:2*M_PI
                                                      clockwise:YES];
    path.lineWidth = 0.1;
    CGContextSaveGState(ctx);
    [path addClip];
    CGContextDrawRadialGradient(ctx, g, CGPointMake(_x, _y), 0, CGPointMake(_x, _y), _sz, kCGGradientDrawsAfterEndLocation);
    [path closePath];
    [path stroke];
    CGContextRestoreGState(ctx);
    [path removeAllPoints];
    path = nil;
}

@end
