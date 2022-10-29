//
//  UIImage+VFX.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//
#pragma clang system_header

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (VFX)
+ (unsigned char *) getBitMapFromImage:(UIImage*)image withHeigh:(NSUInteger) height withWidth:(NSUInteger) width;
+(CGImageRef) getImageRefFromBitmap:(unsigned char *) bitmap withHeigh:(NSUInteger) height withWidth:(NSUInteger) width;
+ (NSArray<UIColor*>*) getRGBAsFromImage:(UIImage*)image atX:(int)x andY:(int)y count:(int)count;
+(UIImage*) vfxGetImageFromCurrentCGContext;
@end

NS_ASSUME_NONNULL_END
