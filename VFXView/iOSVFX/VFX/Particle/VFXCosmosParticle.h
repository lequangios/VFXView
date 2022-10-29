//
//  VFXCosmosParticle.h
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXCosmosParticle : VFX2DParticle
@property(nonatomic, assign) CGFloat deg, rad, radius;
@property(nonatomic, assign, readonly) CGFloat s, vary;
@property(nonatomic, assign) CGPoint distP;

-(instancetype) initWithRect:(CGRect)rect;
-(void) updateParticleWithMove:(CGPoint) mv andFlow:(CGFloat) flow andForce:(CGFloat) force;
@end

NS_ASSUME_NONNULL_END
