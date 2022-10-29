//
//  VFXFlyBubbleParticle.m
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "VFXFlyBubbleParticle.h"
#import "UIColor+VFX.h"
#import "NSNumber+VFX.h"


@implementation VFXFlyBubbleParticle
@synthesize f = _f;
@synthesize r = _r;
@synthesize a = _a;
@synthesize v = _v;
@synthesize lineWidth = _lineWidth;
@synthesize beginColor = _beginColor;
@synthesize endColor = _endColor;

-(instancetype) initWithRect:(CGRect)rect andBeginColor:(UIColor *)beginColor andEndColor:(UIColor *)endColor{
    self = [super init];
    if(self){
        self.p = CGPointMake([NSNumber vfxRandomFloat]*rect.size.width, [NSNumber vfxRandomFloat]*rect.size.height);
        _r = 4+([NSNumber vfxRandomFloat]*rect.size.width/25);
        _a = [NSNumber vfxRandomFloat]*M_2_PI;
        _v = 10*[NSNumber vfxRandomFloat];
        _f = [UIColor VFXSimpleGadientWithBeginColor:beginColor.vFXCIColor andEndColor:endColor.vFXCIColor];
        _lineWidth = 1;
        _endColor = endColor;
        _beginColor = beginColor;
    }
    return self;
}

-(void) refreshParticleWithRect:(CGRect)rect {
    self.p = CGPointMake(rect.size.width*NSNumber.vfxRandomFloat, rect.size.height*NSNumber.vfxRandomFloat);
    _r = 4+(NSNumber.vfxRandomFloat*rect.size.width/25);
    _a = NSNumber.vfxRandomFloat*M_2_PI;
    _v = 10*NSNumber.vfxRandomFloat;
}

-(void) updateParticleWithRect:(CGRect) rect andBeginColor:(UIColor*) beginColor andEndColor:(UIColor*) endColor {
    CGFloat x = self.p.x + sin(_a)*_v;
    CGFloat y = self.p.y + cos(_a)*_v;
    if(x - _r > rect.size.width) {
        x = -_r;
    }
    if(x + _r < 0) {
        x = rect.size.width + _r;
    }
    if(y - _r > rect.size.height) {
        y = -_r;
    }
    if(y + _r < 0) {
        y = rect.size.height + _r;
    }
    self.p = CGPointMake(x, y);
}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    //NSLog(@"p(%f, %f) r = %f", self.p.x, self.p.y, _r);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.p.x, self.p.y)
                                                         radius:_r
                                                     startAngle:0
                                                       endAngle:2*M_PI
                                                      clockwise:YES];
    path.lineWidth = _lineWidth;
    CGContextSaveGState(ctx);
    [_endColor setStroke];
    //[_endColor setFill];
    [path addClip];
    CGContextDrawLinearGradient(ctx, _f, CGPointMake(self.p.x-_r, self.p.y-_r), CGPointMake(self.p.x+_r, self.p.y + _r), kCGGradientDrawsAfterEndLocation);
    [path closePath];
    [path stroke];
    CGContextRestoreGState(ctx);
    [path removeAllPoints];
    path = nil;
}

+(void) logParticlePoint:(NSArray<VFX2DParticle *> *)particles {
    for (VFXFlyBubbleParticle* item in particles) {
        NSLog(@">>>>> p = (%f, %f), r = %f", item.p.x, item.p.y, item.r);
    }
}

@end
