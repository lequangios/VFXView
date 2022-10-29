//
//  VFXFloatCircleParticle.h
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXFloatCircleParticle : VFX2DParticle
@property(nonatomic, assign) CGFloat r, a, alpha;
@property(nonatomic, assign) CGPoint mp;

@end

NS_ASSUME_NONNULL_END
