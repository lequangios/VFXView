//
//  VFXContourParticle.m
//  iOSVFX
//
//  Created by Le Quang on 14/10/2022.
//

#import "VFXContourParticle.h"
#import "UIColor+VFX.h"

@implementation VFXContourParticle
@synthesize p       = _p;
@synthesize rad     = _rad;
@synthesize sp      = _sp;
@synthesize ang     = _ang;
@synthesize r       = _r;
@synthesize g       = _g;
@synthesize b       = _b;

-(instancetype) initWithRect:(CGRect)rect {
    self = [super initWithRect:rect];
    if(self){
        _p = CGPointMake(self.width* self.random, self.height*self.random);
        _rad = 0;
        _sp = 3;
        _ang = 360*self.random;
        _r = round(255*self.random);
        _g = round(255*self.random);
        _b = round(255*self.random);
    }
    return self;
}

-(instancetype) initWithRect:(CGRect)rect andIndex:(int)index {
    self = [[VFXContourParticle alloc] initWithRect:rect];
    if(self){
        self.index = index;
    }
    return self;
}

-(void) updateParticleWithRect:(CGRect)rect {
    [super updateParticleWithRect:rect];
    _p.x = _p.x + _sp*cos(_ang*M_PI/180.0);
    _p.y = _p.y + _sp*sin(_ang*M_PI/180.0);
    BOOL con = false;
    if(_p.x < 0) {
        con=true;
        _p.x = 0;
        if(_ang<180){
            _ang = 180 - _ang;
        } else {
            _ang = 360 - (_ang - 180);
        }
    }
    if(_p.x > self.width) {
        con=true;
        _p.x = self.width;
        if(_ang<180){
            _ang = 180 - _ang;
        } else {
            _ang = 180 + (360 - _ang);
        }
    }
    if(_p.y < 0) {
        con=true;
        _p.y = 0;
        if(_ang<180){
            _ang = 180 - _ang;
        } else {
            _ang = 180 + (180 - _ang);
        }
    }
    if(_p.y > self.height) {
        con=true;
        _p.y = self.height;
        if(_ang>270){
            _ang = 360 - _ang;
        } else {
            _ang = 180 - (_ang - 180);
        }
    }
    if(con){
        _r = round(self.random*255.0);
        _g = round(self.random*255.0);
        _b = round(self.random*255.0);
    }
}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    CGContextSetBlendMode(ctx, kCGBlendModeLighten);
    [[UIColor whiteColor] setFill];
    CGContextFillRect(ctx, CGRectMake(_p.x, _p.y, _rad, _rad));
    for (VFXContourParticle* item in (NSArray<VFXContourParticle*>*) value) {
        if(item.index > self.index){
            //CGContextBeginPath(ctx);
            CGContextSetLineWidth(ctx, 1);
            CGContextMoveToPoint(ctx, _p.x, _p.y);
            CGContextAddLineToPoint(ctx, item.p.x, item.p.y);
            
            CGFloat dx = _p.x - item.p.x;
            CGFloat dy = _p.y - item.p.y;
            CGFloat d = sqrt(dx*dx+dy*dy);
            CGFloat d2= pow(0.5,round(d/100));

            CGFloat nr = round(_r*d2);
            CGFloat ng = round(_g*d2);
            CGFloat nb = round(_b*d2);
            
            [[UIColor VFXColorWithRed:nr green:ng blue:nb alpha:0.6] setStroke];
            //CGContextClosePath(ctx);
            CGContextStrokePath(ctx);
        }
    }
}

@end
