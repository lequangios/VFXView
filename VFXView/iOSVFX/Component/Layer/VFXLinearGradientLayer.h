//
//  LinearGradientLayer.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//
#pragma clang system_header

#import <QuartzCore/QuartzCore.h>
#import "LinearGradient.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXLinearGradientLayer : CAGradientLayer

@property(nonatomic, assign) CGFloat deg;
@property(nonatomic, retain) NSMutableArray<LinearGradient*>* colorGradients;

-(instancetype) initWithColors:(NSArray<LinearGradient*>*) colorGradients andAngle:(CGFloat) angle;

@end

NS_ASSUME_NONNULL_END
