//
//  VFX2DParticle.m
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "VFX2DParticle.h"
#import "NSNumber+VFX.h"

@implementation VFX2DParticle

@synthesize p       = _p;
@synthesize width   = _width;
@synthesize height  = _height;
@synthesize index   = _index;
@synthesize step    = _step;
@synthesize color   = _color;
@synthesize radius  = _radius;
@synthesize scale   = _scale;
@synthesize tp      = _tp;
@synthesize ntp     = _ntp;
@synthesize isTouchDown = _isTouchDown;
@synthesize path    = _path;

-(instancetype) init {
    self = [super init];
    if(self){
        _p = CGPointZero;
        _tp = CGPointZero;
        _ntp = CGPointZero;
        _width = 0;
        _height = 0;
        _index = 0;
        _step = 0.0;
        _scale = 1.0;
        _radius = 0.0;
        _isTouchDown = NO;
        _color = [UIColor clearColor];
        _path = nil;
    }
    return self;
}

-(instancetype) initWithRect:(CGRect) rect {
    self = [self init];
    if(self){
        _width = rect.size.width;
        _height = rect.size.height;
    }
    return self;
}
-(instancetype) initWithRect:(CGRect)rect andIndex:(int) index {
    self = [self initWithRect:rect];
    if(self){
        _index = index;
    }
    return self;
}

-(CGPoint) dp {
    return CGPointMake(_ntp.x - _tp.x, _ntp.y - _tp.y);
}

-(CGFloat) distant {
    CGFloat length = sqrt(self.dp.x*self.dp.x* + self.dp.y*self.dp.y);
    if(length == 0) {length = 0.001;}
    return length;
}

-(CGPoint) direction {
    return CGPointMake(self.dp.x/self.distant, self.dp.y/self.distant);
}

-(BOOL) isTouchInside {
    return CGPathContainsPoint(_path, nil, _tp, YES);
}

-(CGFloat) random { return [NSNumber vfxRandomFloat];}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    
}

+(NSArray*) particlesWithLength:(int) length andRect:(CGRect) rect andValue:(id) value {
    return @[];
}

-(void) updateParticleWithRect:(CGRect) rect {
    _width = rect.size.width;
    _height = rect.size.height;
}

-(void) refreshParticleWithRect:(CGRect)rect {
    _width = rect.size.width;
    _height = rect.size.height;
}

+(void) logParticlePoint:(NSArray<VFX2DParticle*>*) particles {
    for (VFX2DParticle* item in particles) {
        NSLog(@">>>>> p = (%f, %f)", item.p.x, item.p.y);
    }
}

@end
