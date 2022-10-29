//
//  UIBezierPath+VFX.h
//  iOSVFX
//
//  Created by Le Quang on 21/10/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (VFX)
+(instancetype) vfxRhombusPath;
+(instancetype) vfxPentahedronPath;
+(instancetype) vfxCrossPath;
+(instancetype) vfxCirclePath;
+(instancetype) vfxPointPath;
@end

NS_ASSUME_NONNULL_END
