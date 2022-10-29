//
//  UIColor+VFX.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#pragma clang system_header

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define RGBA(r,g,b,a) ([UIColor VFXColorWithRed:r green:g blue:b alpha:a])

@interface UIColor (VFX)

@property(nonatomic, retain, readonly) CIColor* vFXCIColor;

+(instancetype) VFXColorFromHexValue:(NSString*) hexValue;

+(instancetype) VFXColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+(instancetype) VFXRandomColorWithRed:(int) red green:(int) green blue:(int) blue;
/*
 * The hue component of the color, in the range [0, 360°]
 * The saturation component of the color, in the range [0, 100%]
 * The lightness component of the color, in the range [0, 100%]
 */
+(instancetype) VFXColorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;

+(CGGradientRef) VFXSimpleGadientWithBeginColor:(CIColor*) beginColor andEndColor:(CIColor*) endColor;

//+(CGGradientRef) VFXRadialGadientWithBeginColor:(CIColor*) beginColor andEndColor:(CIColor*) endColor;

@end

NS_ASSUME_NONNULL_END
