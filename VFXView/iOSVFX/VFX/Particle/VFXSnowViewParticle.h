//
//  VFXSnowViewParticle.h
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "iOSVFX.h"
#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXSnowViewParticle : VFX2DParticle

@property(nonatomic, assign) CGFloat r;
@property(nonatomic, assign) CGFloat d;

-(instancetype) initWithRadius:(CGFloat) radius andColor:(UIColor*) color andRect:(CGRect) rect andIndex:(int) index;
-(instancetype) initWithRadius:(CGFloat) radius andColor:(UIColor*) color andRect:(CGRect) rect andCount:(int) count;
-(void) updateParticleWithRect:(CGRect) rect andAngle:(float) angle;

@end

NS_ASSUME_NONNULL_END
