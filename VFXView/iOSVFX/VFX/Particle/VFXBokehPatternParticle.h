//
//  VFXBokehPatternParticle.h
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXBokehPatternParticle : VFX2DParticle
@property(nonatomic, assign) CGFloat hue;
@property(nonatomic, assign) CGFloat sat;
@property(nonatomic, assign) CGFloat brig;
@end

NS_ASSUME_NONNULL_END
