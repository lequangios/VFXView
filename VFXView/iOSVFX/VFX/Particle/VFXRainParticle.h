//
//  VFXRainParticle.h
//  iOSVFX
//
//  Created by Le Quang on 11/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXRainParticle : VFX2DParticle

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat l;
@property(nonatomic, assign) CGFloat xs;
@property(nonatomic, assign) CGFloat ys;

-(instancetype) initWithX:(CGFloat) x_value withY:(CGFloat) y_value withL:(CGFloat) l_value withXS:(CGFloat) xs_value withYS:(CGFloat) ys_value;

-(instancetype) initWithRect:(CGRect)rect;

-(void) updateParticleWithRect:(CGRect) rect;

@end

NS_ASSUME_NONNULL_END
