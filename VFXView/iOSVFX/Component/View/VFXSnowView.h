//
//  VFXSnowView.h
//  iOSVFX
//
//  Created by Le Quang on 27/09/2022.
//
#pragma clang system_header
#import "VFXBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXSnowView : VFXView
{
    float angle;
}

@property(nonatomic, assign) float snowRadius;
@property(nonatomic, assign) int snowCount;
@property(nonatomic, retain) UIColor* snowColor;

-(instancetype) initWithFrame:(CGRect) frame andRadius:(float) radius andCount:(int) count andColor:(UIColor*) color;

@end

NS_ASSUME_NONNULL_END
