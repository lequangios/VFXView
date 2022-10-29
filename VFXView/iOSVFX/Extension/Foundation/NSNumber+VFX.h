//
//  NSNumber+VFX.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (VFX)
@property(nonatomic, assign, readonly) CGFloat vfxRandom;

+(CGFloat) vfxDegreesToRads:(CGFloat) degrees;
+(CGFloat) vfxRandomFloat;
+(int) vfxRandomIntFrom:(int) min to:(int) max;
+(CGFloat) vfxRandomRads;

@end

NS_ASSUME_NONNULL_END
