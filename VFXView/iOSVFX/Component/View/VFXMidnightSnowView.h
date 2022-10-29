//
//  VFXMidnightSnowView.h
//  iOSVFX
//
//  Created by Le Quang on 12/10/2022.
//

#import "VFXBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXMidnightSnowView : VFXView

-(instancetype) initWithFrame:(CGRect)frame;
-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength;

@end

NS_ASSUME_NONNULL_END
