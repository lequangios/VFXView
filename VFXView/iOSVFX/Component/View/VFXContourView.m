//
//  VFXContourView.m
//  iOSVFX
//
//  Created by Le Quang on 14/10/2022.
//

#import "VFXContourView.h"
#import "VFXContourParticle.h"
#import "UIColor+VFX.h"
#import "NSError+VFX.h"

@implementation VFXContourView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame andParticleLength:20];
    if(self){}
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength{
    self = [super initWithFrame:frame andParticleLength:particleLength];
    if(self){
    }
    return self;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i=0; i < self.particleLength; i++) {
        VFXContourParticle* item = [[VFXContourParticle alloc] initWithRect:rect andIndex:i];
        [particles addObject:item];
    }
    
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    for (VFXContourParticle* item in self.particles) {
        [item updateParticleWithRect:self.bounds];
    }
}

-(void) drawVFXParticleWithContext:(CGContextRef) ctx {
    if(self.particles != nil && self.particles.count > 0) {
        for (VFX2DParticle* item in self.particles) {
            [item drawParticle:self.particles withContext:ctx];
        }
    }
}


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx,[UIColor clearColor].CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
    [[[UIColor blackColor] colorWithAlphaComponent:0.8] setFill];
    
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw particle"];
    }
}

@end
