//
//  VFXLiquidParticle.h
//  iOSVFX
//
//  Created by Le Quang on 08/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXLiquidParticle : VFX2DParticle

@property(nonatomic, assign, readonly) CGFloat maxLenght, minLength, centerLength;

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat r;
@property(nonatomic, assign) CGFloat sx;
@property(nonatomic, assign) CGFloat sy;

-(instancetype) initWithRect:(CGRect)rect;
-(instancetype) initWithRect:(CGRect)rect andIndex:(int)index;

-(void) updateParticleWithRect:(CGRect) rect andPoint:(CGPoint) point andIsTouchDown:(BOOL) isTouchDown;
-(void) updateParticleWithRect:(CGRect) rect andPoint:(CGPoint) point andIsTouchDown:(BOOL) isTouchDown andScale:(CGFloat) scale;

@end

NS_ASSUME_NONNULL_END
