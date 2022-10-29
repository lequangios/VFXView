//
//  VFXFlyBubbleParticle.h
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "iOSVFX.h"
#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXFlyBubbleParticle : VFX2DParticle

@property(nonatomic, assign) CGGradientRef f;
@property(nonatomic, assign) CGFloat r;
@property(nonatomic, assign) CGFloat a;
@property(nonatomic, assign) CGFloat v;
@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, retain) UIColor* beginColor;
@property(nonatomic, retain) UIColor* endColor;

-(instancetype) initWithRect:(CGRect) rect andBeginColor:(UIColor*) beginColor andEndColor:(UIColor*) endColor;
-(void) updateParticleWithRect:(CGRect) rect andBeginColor:(nullable UIColor*) beginColor andEndColor:(nullable UIColor*) endColor;

@end

NS_ASSUME_NONNULL_END
