//
//  VFXCosmosParticle.m
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//
#import "UIColor+VFX.h"
#import "NSNumber+VFX.h"
#import "VFXCosmosParticle.h"

@implementation VFXCosmosParticle
@synthesize deg = _deg;
@synthesize rad = _rad;
@synthesize radius = _radius;
@synthesize distP = _distP;

-(instancetype) initWithRect:(CGRect)rect {
    self = [super init];
    if(self){
        self.width = rect.size.width;
        self.height = rect.size.height;
        //self.color = [UIColor VFXRandomColorWithRed:130 green:50 blue:100];
        self.color = [UIColor VFXRandomColorWithRed:255 green:255 blue:255];
        self.p = CGPointMake(floor(NSNumber.vfxRandomFloat*self.width), floor(NSNumber.vfxRandomFloat*self.height));
        _deg = floor(NSNumber.vfxRandomFloat*360);
        _rad = floor(NSNumber.vfxRandomFloat*self.width*0.5);
        _distP = self.p;
        _radius = 1 + floor(NSNumber.vfxRandomFloat*_rad*0.055);
    }
    return self;
}

-(CGFloat) s {
    //CGFloat v = _radius*(self.p.y*1.5/self.height);
    CGFloat v = _radius*(self.p.y*2/self.height);
    if(v < 0.1) { return 0;}
    return v;
}

-(CGFloat) vary {
    CGFloat v;
    if(_radius < 2){ v = 4;}
    else if (_radius < 3) { v = 3;}
    else if (_radius < 4) { v = 2;}
    else { v = 1; }
    return v*(self.p.y/(self.height*0.9));
}

-(void) updateParticleWithMove:(CGPoint) mv andFlow:(CGFloat) flow andForce:(CGFloat) force {
    CGFloat radi = M_PI*_deg/180;
    _distP = CGPointMake(self.width/2 + _rad*cos(radi), self.height/2 + _rad*sin(radi)*0.4);
    if(mv.x > 0 && mv.y > 0){
        CGFloat react = floor(0.5*force + NSNumber.vfxRandomFloat*0.9*force);
        if(_distP.x - mv.x > 0 && _distP.x - mv.x < force && _distP.y - mv.y > 0 && _distP.y - mv.y < force) {
            _distP = CGPointMake(_distP.x + react, _distP.y + react);
        }
        else if (_distP.x - mv.x > 0 && _distP.x - mv.x < force && _distP.y - mv.y < 0 && _distP.y - mv.y > -force){
            _distP = CGPointMake(_distP.x + react, _distP.y - react);
        }
        else if (_distP.x - mv.x < 0 && _distP.x - mv.x > -force && _distP.y - mv.y > 0 && _distP.y - mv.y < force){
            _distP = CGPointMake(_distP.x - react, _distP.y + react);
        }
        else if (_distP.x - mv.x < 0 && _distP.x - mv.x > -force && _distP.y - mv.y < 0 && _distP.y - mv.y > -force){
            _distP = CGPointMake(_distP.x - react, _distP.y - react);
        }
    }
    CGFloat x = self.p.x + (_distP.x - self.p.x)/flow;
    CGFloat y = self.p.y + (_distP.y - self.p.y)/flow;
    self.p = CGPointMake(x, y);
    _deg = (int)round(_deg + self.vary) % 360;
}

-(void) refreshParticleWithRect:(CGRect) rect {
    self.width = rect.size.width;
    self.height = rect.size.height;
    self.color = [UIColor VFXRandomColorWithRed:130 green:50 blue:100];
    self.p = CGPointMake(floor(NSNumber.vfxRandomFloat*self.width), floor(NSNumber.vfxRandomFloat*self.height));
    _deg = floor(NSNumber.vfxRandomFloat*360);
    _rad = floor(NSNumber.vfxRandomFloat*self.width*0.5);
    _distP = self.p;
    _radius = 1 + floor(NSNumber.vfxRandomFloat*_rad*0.055);
}

-(void) drawParticle:(id) value withContext:(CGContextRef) ctx {
    CGContextBeginPath(ctx);
    [self.color setFill];
    CGContextAddArc(ctx, self.p.x, self.p.y, self.s, 0, M_2_PI, YES);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

@end
