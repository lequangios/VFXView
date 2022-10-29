//
//  VFXLiquidView.m
//  iOSVFX
//
//  Created by Le Quang on 08/10/2022.
//
#import "VFXLiquidParticle.h"
#import "VFXLiquidView.h"
#import "NSError+VFX.h"

@implementation VFXLiquidView
@synthesize scale = _scale;

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame andParticleLength:100];
    if(self){
        _scale = 0.96;
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength {
    self = [super initWithFrame:frame andParticleLength:particleLength];
    if(self){
        _scale = 0.96;
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength andScale:(CGFloat) scale {
    self = [super initWithFrame:frame andParticleLength:particleLength];
    if(self){
        _scale = scale;
    }
    return self;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i=0; i < self.particleLength; i++) {
        VFXLiquidParticle* item = [[VFXLiquidParticle alloc] initWithRect:rect andIndex:i];
        [particles addObject:item];
    }
    
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    for (VFXLiquidParticle* item in self.particles) {
        [item updateParticleWithRect:self.bounds andPoint:self.currentTouchPoint andIsTouchDown:self.isTouchDown andScale:self.scale];
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx,[UIColor clearColor].CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx,kCGBlendModeNormal);
    
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw particle"];
    }
}


@end
