//
//  UIColor+VFX.m
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#import "UIColor+VFX.h"
#import "NSNumber+VFX.h"

@implementation UIColor (VFX)

+(instancetype) VFXColorFromHexValue:(NSString*) hexValue
{
    if(hexValue == nil || [hexValue isEqualToString:@""]) return [UIColor clearColor];
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexValue];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

+(instancetype) VFXColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:alpha];
}

+(instancetype) VFXRandomColorWithRed:(int) red green:(int) green blue:(int) blue {
    CGFloat r = (red*[NSNumber vfxRandomIntFrom:0 to:255]/255.0f);
    CGFloat g = (green*[NSNumber vfxRandomIntFrom:0 to:255]/255.0f);
    CGFloat b = (blue*[NSNumber vfxRandomIntFrom:0 to:255]/255.0f);
    return [UIColor VFXColorWithRed:r green:g blue:b alpha:1.0];
}

+(instancetype) VFXColorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha
{
    CGFloat h = hue/360.0;
    CGFloat s = saturation/100.0;
    CGFloat l = lightness/100.0;
    //return [UIColor colorWithHue:h saturation:s brightness:b alpha:alpha];
    
    CGFloat t = s*((l < 0.5)? l : (1.0 - l));
    CGFloat b = l + t;
    s = (l > 0) ? (2.0 * t/b) : 0.0;
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:alpha];
}

+(CGGradientRef) VFXSimpleGadientWithBeginColor:(CIColor*) beginColor andEndColor:(CIColor*) endColor {
    CGColorSpaceRef myColorspace;
    
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    
    CGFloat components[8] = { beginColor.red, beginColor.green, beginColor.blue, beginColor.alpha,
        endColor.red, endColor.green, endColor.blue, endColor.alpha };
    
    if (@available(iOS 9.0, *)) {
        myColorspace = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    } else {
        myColorspace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGGradientRef gadient = CGGradientCreateWithColorComponents (myColorspace, components, locations, num_locations);
    CGColorSpaceRelease(myColorspace);
    return gadient;
}


-(CIColor*) vFXCIColor {
    return [CIColor colorWithCGColor:self.CGColor];
}

@end
