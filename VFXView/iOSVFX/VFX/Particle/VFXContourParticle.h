//
//  VFXContourParticle.h
//  iOSVFX
//
//  Created by Le Quang on 14/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXContourParticle : VFX2DParticle

@property(nonatomic, assign) CGFloat rad, sp, ang, r, g, b;

-(instancetype) initWithRect:(CGRect)rect andIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
