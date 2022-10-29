//
//  VFXBubblyParticle.h
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#import "VFX2DParticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXBubblyParticle : VFX2DParticle
@property(nonatomic, assign) CGPoint v;
@property(nonatomic, assign) CGFloat radius, alpha, growth;
@property(nonatomic, assign, readonly) BOOL isNeedRemove;

-(instancetype) initWithPoint:(CGPoint) p withMove:(CGPoint) v withColor:(UIColor*) color withRadius:(CGFloat) radius withGrowth:(CGFloat) growth;

@end

NS_ASSUME_NONNULL_END
