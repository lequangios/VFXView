//
//  VFXSnowView.m
//  iOSVFX
//
//  Created by Le Quang on 27/09/2022.
//

#import "VFXSnowView.h"
#import "VFXSnowViewParticle.h"

@implementation VFXSnowView
@synthesize snowRadius  = _snowRadius;
@synthesize snowCount   = _snowCount;
@synthesize snowColor   = _snowColor;

-(instancetype) initWithFrame:(CGRect) frame andRadius:(float) radius andCount:(int) count andColor:(UIColor*) color {
    self = [super initWithFrame:frame];
    if(self){
        _snowColor = color;
        _snowRadius = radius;
        _snowCount = count;
    }
    return self;
}

-(void) setSnowCount:(int)snowCount {
    [self resetVFXParticle];
    _snowCount = snowCount;
}

-(void) setSnowColor:(UIColor *)snowColor {
    [self resetVFXParticle];
    _snowColor = snowColor;
}

-(void) setSnowRadius:(float)snowRadius {
    [self resetVFXParticle];
    _snowRadius = snowRadius;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect {
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i=0; i<self.snowCount; i++) {
        VFXSnowViewParticle* item = [[VFXSnowViewParticle alloc] initWithRadius:self.snowRadius andColor:self.snowColor andRect:rect andCount:self.snowCount];
        [particles addObject:item];
    }
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    self->angle += 0.01;
    for (VFXSnowViewParticle* item in self.particles) {
        [item updateParticleWithRect:self.bounds andAngle:self->angle];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
