//
//  VFXView.h
//  iOSVFX
//
//  Created by Le Quang on 24/09/2022.
//
#pragma clang system_header
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

#define VFX_ANIMATION_SPEED 0.03
#define VFX_PARTICLE_LENGTH 30
#define VFX_PARTICLE_RADIUS 4

@class VFXView;
typedef enum {Failed, Initialized = 1, AnimationStarted, AnimationPaused, AnimationEnded, AnimationStoped} VFXAnimationState;
typedef  void(^VFXViewCreatingParticleCompletion)(VFXView* _Nullable  view);

#pragma mark - VFXViewAnimaStateManager
/*
@interface VFXViewAnimaStateManager : NSObject
{
    VFXAnimationState state;
}

@property(nonatomic, retain, readonly) NSArray* allTransaction;
@property(nonatomic, assign) BOOL isRepeate;
-(instancetype) initWithState:(VFXAnimationState) state;
-(int) trasactionFrom:(VFXAnimationState) from to:(VFXAnimationState) to;
-(void) transtion:(int) transaction;
-(VFXAnimationState) doBegin;
-(VFXAnimationState) doPause;
-(VFXAnimationState) doStop;
-(VFXAnimationState) doResume;
-(VFXAnimationState) doDone;

@end
*/

#pragma mark - VFXParticle protocol

@protocol VFXParticleDelegate <NSObject>
-(int) index;
-(void) drawParticle:(id) value withContext:(CGContextRef) ctx;
+(NSArray*) particles;

@end

#pragma mark - VFXViewAnimatable protocol
@protocol VFXViewAnimatable<NSObject>
-(BOOL) isRepeate;
-(void) start;
-(void) pause;
-(void) resume;
-(void) end;
-(void) stop;
-(void) transtion:(int) transaction;
@end

#pragma mark - VFXViewDelegate protocol
@class VFXView;
@protocol VFXViewDelegate<NSObject>
@optional
-(void) vfxAnimationReadyWithView:(VFXView*) view;
-(void) vfxAnimationPauseWithView:(VFXView*) view;
-(void) vfxAnimationFinishWithView:(VFXView*) view;
-(void) vfxParticleCreateWithView:(VFXView*) view;
@end

#pragma mark - VFXView
@class VFXParticleDelegate;
@class VFXViewDelegate;
@class VFX2DParticle;
@interface VFXView : UIView {
    BOOL isAnimation;
    BOOL isInitialization;
    NSTimer* loop;
    //VFXViewAnimaStateManager* animationState;
    NSError* error;
}

@property(nonatomic, assign) CGPoint currentTouchPoint;
@property(nonatomic, assign) CGPoint touchDistant;
@property(nonatomic, assign) BOOL isTouchDown;
@property(nonatomic, retain, readonly) NSString* viewName;
@property(nonatomic, assign, readonly) BOOL isHadParticles;
@property(nonatomic, assign, readonly) BOOL isReadyAnimation;
@property(nonatomic, assign) BOOL enableDebug;
@property(nonatomic, assign) BOOL isAllowRepate;
@property(nonatomic, retain) NSMutableArray<VFX2DParticle*>* particles;
@property(nonatomic, assign) int particleLength;
@property(nonatomic, assign) float animationSpeed;
@property(nonatomic, retain) UIColor* fillColor;
@property(nonatomic, retain) id<VFXViewDelegate> delegate;
@property(nonatomic, assign) CGBlendMode blendMode;

-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength;
-(instancetype) initWithFrame:(CGRect)frame andColor:(UIColor*)color;
-(instancetype) initWithFrame:(CGRect)frame andColor:(UIColor*)color andParticleLength:(int) particleLength;

-(void) initializationVFXView;
-(void) setupVFXViewWithRect:(CGRect) rect;
-(void) setupVFXViewWithRect:(CGRect) rect andComplete:(VFXViewCreatingParticleCompletion) complete;
-(BOOL) drawVFXViewWith:(CGContextRef _Nullable) ctx;

-(BOOL) createVFXParticleWithRect:(CGRect) rect;
-(void) updateVFXParticle;
-(void) updateVFXParticleWithRect:(CGRect) rect;
-(void) refreshVFXParticleWithRect:(CGRect) rect;
-(void) resetVFXParticle;
-(BOOL) isVFXParticleEnd;

-(void) startVFXAnimation;
-(void) pauseVFXAnimation;
-(void) resumeVFXAnimation;
-(void) stopVFXAnimation;

-(void) vfxRelease;

@end

NS_ASSUME_NONNULL_END
