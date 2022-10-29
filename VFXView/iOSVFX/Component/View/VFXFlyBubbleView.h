//
//  VFXFlyBubbleView.h
//  iOSVFX
//
//  Created by Le Quang on 29/09/2022.
//
#pragma clang system_header
#import "VFXBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXFlyBubbleView : VFXView

@property(nonatomic, assign) int bubbleCount;
@property(nonatomic, retain) UIColor* beginColor;
@property(nonatomic, retain) UIColor* endColor;

-(instancetype) initWithFrame:(CGRect) frame andCount:(int) count andBeginColor:(nullable UIColor*) beginColor andEndColor:(nullable UIColor*) endColor;

@end

NS_ASSUME_NONNULL_END
