//
//  VFXAntigravityFlowParticle.h
//  iOSVFX
//
//  Created by Le Quang on 21/10/2022.
//

#import "VFX2DParticle.h"
#import "VFXSVGParticle.h"

NS_ASSUME_NONNULL_BEGIN
@interface VFXSVGParticle (VFXAntigravityFlow)

+(instancetype) rhombus;
+(instancetype) pentahedron;
+(instancetype) point;
+(instancetype) circle;
+(instancetype) x;

+(instancetype) random;

@end

@interface VFXAntigravityFlowParticle : VFX2DParticle

@property(nonatomic, retain) VFXSVGParticle* svg;
@property(nonatomic, assign) CGPoint coordinates;
@property(nonatomic, assign, readonly) CGSize dimensions;
@property(nonatomic, assign) CGFloat friction;
@property(nonatomic, assign) CGFloat position;
@property(nonatomic, assign) CGFloat siner;
@property(nonatomic, assign) CGFloat rotation;
@property(nonatomic, assign, readonly) CGAffineTransform transform;
@property(nonatomic, assign, readonly) BOOL isNeedDestroy;

-(instancetype) initWithRect:(CGRect)rect;
-(instancetype) initWithRect:(CGRect)rect andCoordinates:(CGPoint) coordinates andFriction:(CGFloat) friction;


@end

NS_ASSUME_NONNULL_END
