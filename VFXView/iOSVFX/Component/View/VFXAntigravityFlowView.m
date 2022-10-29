//
//  VFXAntigravityFlowView.m
//  iOSVFX
//
//  Created by Le Quang on 25/10/2022.
//

#import "VFXAntigravityFlowView.h"
#import "VFXAntigravityFlowParticle.h"
#import "NSNumber+VFX.h"
#import "NSError+VFX.h"

@interface VFXAntigravityFlowView()

@property(nonatomic, assign) int max_particles;

@end

@implementation VFXAntigravityFlowView
@synthesize max_particles = _max_particles;

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        _max_particles = 100;
    }
    return self;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    VFXAntigravityFlowParticle* item = [[VFXAntigravityFlowParticle alloc] initWithRect:rect];
    [particles addObject:item];
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    [self pauseVFXAnimation];
    // Update old particle
    for (VFXAntigravityFlowParticle* item in self.particles) {
        [item updateParticleWithRect:self.frame];
    }
    // Add new particle
    VFXAntigravityFlowParticle* item = [[VFXAntigravityFlowParticle alloc] initWithRect:self.frame];
    [self.particles addObject:item];
    // Remove unsused
    if(self.particles.count > self.max_particles){
        [self destroyParticle];
    }
    [self resumeVFXAnimation];
}

-(void) destroyParticle {
    if(self.particles.count > self.max_particles){
        NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
        for (VFXAntigravityFlowParticle* item in self.particles) {
            if(item.isNeedDestroy == NO){
                [particles addObject:item];
            }
        }
        self.particles = particles;
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
