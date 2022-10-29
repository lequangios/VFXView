//
//  VFXMidnightSnowParticle.h
//  iOSVFX
//
//  Created by Le Quang on 12/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXMidnightSnowParticle : VFX2DParticle
@property(nonatomic, assign) CGFloat x, y, t, sz, sp, sc, min, mv, tsc;
@property(nonatomic, retain) UIColor* begin, *end;

-(instancetype) initWithRect:(CGRect)rect andBeginColor:(UIColor*) begin andEndColor:(UIColor*) end;
@end

NS_ASSUME_NONNULL_END
