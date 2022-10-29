//
//  VFX2DParticle.h
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFX2DParticle : NSObject

@property(nonatomic, assign) CGPoint p;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) int index;
@property(nonatomic, assign) float step;
@property(nonatomic, assign) CGFloat radius, scale;
@property(nonatomic, assign, readonly) CGPoint dp, direction; // Distance vector beetwen two touch, unit vector
@property(nonatomic, assign, readonly) CGFloat distant; // Distance beetwen two touch
@property(nonatomic, assign) CGPoint tp, ntp; // touch point, next touch point
@property(nonatomic, retain) UIColor* color;
@property(nonatomic, assign) BOOL isTouchDown;
@property(nonatomic, assign) CGMutablePathRef path;
@property(nonatomic, assign, readonly) BOOL isTouchInside;
@property(nonatomic, assign, readonly) CGFloat random;

-(instancetype) initWithRect:(CGRect) rect;
-(instancetype) initWithRect:(CGRect)rect andIndex:(int) index;

-(void) drawParticle:(id) value withContext:(CGContextRef) ctx;
-(void) updateParticleWithRect:(CGRect) rect;
-(void) refreshParticleWithRect:(CGRect) rect;
+(NSArray*) particlesWithLength:(int) length andRect:(CGRect) rect andValue:(id) value;
+(void) logParticlePoint:(NSArray<VFX2DParticle*>*) particles;

@end

NS_ASSUME_NONNULL_END
