//
//  VFXSVGParticle.h
//  iOSVFX
//
//  Created by Le Quang on 25/10/2022.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFXSVGParticle : NSObject

@property(nonatomic, retain) UIBezierPath* path;
@property(nonatomic, retain) UIColor* fill;
@property(nonatomic, retain) UIColor* stroke;

-(void) drawSVGWithContext:(CGContextRef)ctx;
-(void) applySVGWithTransform:(CGAffineTransform)transform;

@end

NS_ASSUME_NONNULL_END
