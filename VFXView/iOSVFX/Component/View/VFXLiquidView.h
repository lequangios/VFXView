//
//  VFXLiquidView.h
//  iOSVFX
//
//  Created by Le Quang on 08/10/2022.
//

#import "iOSVFX.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXLiquidView : VFXView

@property(nonatomic, assign) CGFloat scale;

-(instancetype) initWithFrame:(CGRect)frame;
-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength;
-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength andScale:(CGFloat) scale;

@end

NS_ASSUME_NONNULL_END
