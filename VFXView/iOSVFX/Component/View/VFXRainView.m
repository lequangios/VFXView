//
//  VFXRainView.m
//  iOSVFX
//
//  Created by Le Quang on 08/10/2022.
//

#import "VFXRainView.h"
#import "VFXRainParticle.h"
#import "NSError+VFX.h"

@implementation VFXRainView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame andColor:[UIColor whiteColor] andParticleLength:100];
    return self;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect {
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i=0; i<self.particleLength; i++) {
        VFXRainParticle* item = [[VFXRainParticle alloc] initWithRect:rect];
        [particles addObject:item];
    }
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    for (VFXRainParticle* item in self.particles) {
        [item updateParticleWithRect:self.bounds];
    }
}


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx,[UIColor clearColor].CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx,kCGBlendModeDestinationOver);
    CGContextSetLineWidth(ctx, 1);
    [self.fillColor set];
    
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw Bubble particle"];
    }
}

@end
