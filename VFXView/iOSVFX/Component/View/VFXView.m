//
//  VFXView.m
//  iOSVFX
//
//  Created by Le Quang on 24/09/2022.
//

#import "VFXView.h"
#import "NSError+VFX.h"
#import "VFX2DParticle.h"

/*
@implementation VFXViewAnimaStateManager

-(instancetype) initWithState:(VFXAnimationState) state {
    self = [super init];
    if(self){
        self->state = state;
    }
    return self;
}

-(NSArray*) getAllTransaction {
    return @[@12, @23, @24, @25, @32, @35, @42, @45];
}

-(int) trasactionFrom:(VFXAnimationState) from to:(VFXAnimationState) to {
    return from*10 + to;
}

-(VFXAnimationState) doBegin {
    if(self->state == Initialized){
        self->state = AnimationStarted;
    }
    return self->state;
}

-(VFXAnimationState) doPause{
    if(self->state == AnimationStarted){
        self->state = AnimationStoped;
    }
    return self->state;
}

-(VFXAnimationState) doStop {
    if(self->state == AnimationStarted || self->state == AnimationPaused || self->state == AnimationEnded){
        self->state = AnimationStoped;
    }
    return self->state;
}

-(VFXAnimationState) doResume{
    if(self->state == AnimationEnded || self->state == AnimationPaused){
        self->state = AnimationStarted;
    }
    return self->state;
}

-(VFXAnimationState) doDone {
    if(self->state == AnimationStarted){
        self->state = AnimationEnded;
    }
    return self->state;
}

@end
*/

#pragma mark - VFXView
@implementation VFXView
@synthesize isAllowRepate   = _isAllowRepate;
@synthesize particleLength  = _particleLength;
@synthesize animationSpeed  = _animationSpeed;
@synthesize particles       = _particles;
@synthesize fillColor       = _fillColor;
@synthesize isReadyAnimation= _isReadyAnimation;
@synthesize blendMode       = _blendMode;
@synthesize enableDebug     = _enableDebug;
@synthesize currentTouchPoint = _currentTouchPoint;
@synthesize touchDistant    = _touchDistant;
@synthesize isTouchDown     = _isTouchDown;

-(instancetype) init {
    self = [super init];
    if(self){
        [self initializationVFXView];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self initializationVFXView];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength {
    self = [super initWithFrame:frame];
    if(self){
        _particleLength = particleLength;
        [self initializationVFXView];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andColor:(UIColor*)color {
    self = [super initWithFrame:frame];
    if(self){
        _fillColor = color;
        [self initializationVFXView];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andColor:(UIColor*)color andParticleLength:(int) particleLength {
    self = [super initWithFrame:frame];
    if(self){
        _fillColor = color;
        _particleLength = particleLength;
        [self initializationVFXView];
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self){
        [self initializationVFXView];
    }
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    if(self->isInitialization == YES){
        if(self.isHadParticles == YES) {
            [self refreshVFXParticleWithRect:self.bounds];
        }
        else {
            [self setupVFXViewWithRect:self.bounds];
        }
    }
}

-(NSString*) viewName {
    return @"vfx_view";
}

-(void) setIsAllowRepate:(BOOL)isAllowRepate {
    [self pauseVFXAnimation];
    _isAllowRepate = isAllowRepate;
    [self resumeVFXAnimation];
}

-(void) setParticles:(NSMutableArray*) particles{
    [self pauseVFXAnimation];
    _particles = particles;
    [self resumeVFXAnimation];
}

-(void) setParticleLength:(int)particleLength {
    [self resetVFXParticle];
    _particleLength = particleLength;
}

-(void) setFillColor:(UIColor *)fillColor {
    [self pauseVFXAnimation];
    _fillColor = fillColor;
    self.backgroundColor = _fillColor;
    [self resumeVFXAnimation];
}

-(UIColor*) fillColor {
    if(_fillColor == nil) { return [UIColor clearColor];}
    return _fillColor;
}

-(void) setError:(nullable NSError*) error {
    self->error = error;
}

-(void) setAnimationSpeed:(float)animationSpeed {
    [self pauseVFXAnimation];
    _animationSpeed = animationSpeed;
    [self resumeVFXAnimation];
}

-(void) setBlendMode:(CGBlendMode)blendMode {
    [self pauseVFXAnimation];
    _blendMode = blendMode;
    [self resumeVFXAnimation];
}

-(float) animationSpeed {
    if(_animationSpeed == 0) { return VFX_ANIMATION_SPEED; }
    return _animationSpeed;
}

-(BOOL) isReadyAnimation {
    if(self->error == nil && self->isInitialization == YES) { return YES; }
    return NO;
}

- (BOOL) isHadParticles {
    return (_particles != nil && _particles.count > 0);
}

#pragma mark VFXView life circle -

-(void) initializationVFXView {
    self->isAnimation = NO;
    self->isInitialization = NO;
    self->error = nil;
    //self->animationState = [[VFXViewAnimaStateManager alloc] initWithState:Initialized];
    _particles = [[NSMutableArray alloc] init];
    _blendMode = kCGBlendModeNormal;
    self.backgroundColor = [UIColor clearColor];
}

-(void) setupVFXViewWithRect:(CGRect) rect {
    [self generateVFXParticleWithRect:rect andComplete:^(VFXView * _Nullable view) {
        if(view != nil){
            if(view.delegate != nil && [view.delegate respondsToSelector:@selector(vfxParticleCreateWithView:)]){
                [view.delegate performSelector:@selector(vfxParticleCreateWithView:) withObject:view];
            }
            else {
                if(view.isReadyAnimation == YES){
                    [view startVFXAnimation];
                }
            }
        }
    }];
}

-(void) setupVFXViewWithRect:(CGRect) rect andComplete:(VFXViewCreatingParticleCompletion) complete {
    [self generateVFXParticleWithRect:rect andComplete:complete];
}

-(void) drawVFXView{
    if(self->isAnimation == YES){
        [self setNeedsDisplay];
    }
}

-(BOOL) drawVFXViewWith:(CGContextRef _Nullable) ctx {
    if(ctx == nil) { return NO;}
    [self drawVFXParticleWithContext:ctx];
    [self updateVFXParticle];
    if(self.enableDebug == YES){
        NSLog(@">>> Draw and Update %lu particles", (unsigned long)self.particles.count);
    }
    return YES;
}

#pragma mark VFXParticle life circle -

-(BOOL) createVFXParticleWithRect:(CGRect)rect {
    self->isInitialization = YES;
    return YES;
}

-(void) generateVFXParticleWithRect:(CGRect) rect andComplete:(nullable VFXViewCreatingParticleCompletion) complete {
    WEAK_SELF weak_self = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(weak_self != nil){
            BOOL result = [weak_self createVFXParticleWithRect:rect];
            if(result == NO){
                NSError* error = [NSError makeVFXErrorWithDescription:@"Create Particle was failed"];
                [weak_self setError:error];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(complete != nil){
                    complete(weak_self);
                }
                
                if(weak_self.delegate != nil){
                    if([weak_self.delegate respondsToSelector:@selector(vfxParticleCreateWithView:)] == YES){
                        [weak_self.delegate performSelector:@selector(vfxParticleCreateWithView:) withObject:weak_self];
                    }
                }
            });
        }
    });
}

-(void) refreshVFXParticleWithRect:(CGRect)rect {
    [self pauseVFXAnimation];
    if(self.particles != nil && self.particles.count > 0) {
        for (VFX2DParticle* item in self.particles) {
            [item refreshParticleWithRect:self.bounds];
        }
    }
    [self resumeVFXAnimation];
}

-(void) updateVFXParticle {
    if([self isVFXParticleEnd] == YES){
        return;
    }
}

-(void) updateVFXParticleWithRect:(CGRect) rect {
    if([self isVFXParticleEnd] == YES){
        return;
    }
}

-(void) drawVFXParticleWithContext:(CGContextRef) ctx {
    if(self.particles != nil && self.particles.count > 0) {
        for (VFX2DParticle* item in self.particles) {
            [item drawParticle:item withContext:ctx];
        }
    }
}


-(void) resetVFXParticle {
    [self stopVFXAnimation];
    if(self.particles != nil){
        [self.particles removeAllObjects];
    }
}

-(BOOL) isVFXParticleEnd {
    return NO;
}

#pragma mark VFXAnimation life circle -
-(void) startVFXAnimation {
    if(self->isAnimation == NO && self->loop == nil){
        self->isAnimation = YES;
        self->loop = [NSTimer scheduledTimerWithTimeInterval:self.animationSpeed target:self selector:@selector(drawVFXView) userInfo:nil repeats:YES];
    }
}

-(void) pauseVFXAnimation {
    if(self->isAnimation == YES){
        self->isAnimation = NO;
    }
}

-(void) resumeVFXAnimation {
    if(self->loop){
        self->isAnimation = YES;
    }
}

-(void) stopVFXAnimation {
    self->isAnimation = NO;
    if(self->loop){
        [self->loop invalidate];
        self->loop = nil;
    }
}

-(void) vfxRelease {
    [self stopVFXAnimation];
    if(_particles != nil) {
        [_particles removeAllObjects];
        _particles = nil;
    }
    _fillColor = nil;
    [self removeFromSuperview];
}


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx,[UIColor clearColor].CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx,self.blendMode);
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw particle"];
    }
}

#pragma mark UITouch life circle -
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.count > 0){
        _currentTouchPoint = [[touches anyObject] locationInView:self];
        _isTouchDown = YES;
    }
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.count > 0){
        CGPoint p = [[touches anyObject] locationInView:self];
        _touchDistant = CGPointMake(p.x - _currentTouchPoint.x, p.y - _currentTouchPoint.y);
        _currentTouchPoint = p;
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.count > 0){
        //_currentTouchPoint = [[touches anyObject] locationInView:self];
    }
    _isTouchDown = NO;
    _touchDistant = CGPointZero;
}

@end
