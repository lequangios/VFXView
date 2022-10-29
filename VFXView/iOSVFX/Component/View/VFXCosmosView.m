//
//  VFXCosmosView.m
//  iOSVFX
//
//  Created by Le Quang on 06/10/2022.
//
#import "UIColor+VFX.h"
#import "VFXCosmosView.h"
#import "VFXCosmosParticle.h"
#import "NSError+VFX.h"

@implementation VFXCosmosView
@synthesize begin = _begin;
@synthesize repeat = _repeat;
@synthesize count = _count;
@synthesize flow = _flow;

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        _count = 650;
        _begin = 50;
        _repeat = 20;
        _flow = _begin;
        self->isTouchDown = NO;
        self->touchPoint = CGPointZero;
        self->flowInterval = nil;
        self.fillColor = [UIColor VFXColorWithHue:242 saturation:30 lightness:5 alpha:0.55];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect) frame andCount:(int) count {
    VFXCosmosView* obj = [[VFXCosmosView alloc] initWithFrame:frame];
    obj.count = count;
    return obj;
}

-(instancetype) initWithFrame:(CGRect) frame andBegin:(int) begin andRepeat:(int) repeat andCount:(int) count {
    VFXCosmosView* obj = [[VFXCosmosView alloc] initWithFrame:frame];
    obj.begin = begin;
    obj.flow = begin;
    obj.repeat = repeat;
    obj.count = count;
    return obj;
}

-(CGFloat) force {
    //CGFloat f = MAX(self.frame.size.width, self.frame.size.height)*0.09;
    CGFloat f = MAX(self.frame.size.width, self.frame.size.height)*0.1;
    if(self->isTouchDown == YES) { return 2*f;}
    return f;
}

-(void) setBegin:(int)begin{
    [self pauseVFXAnimation];
    _begin = begin;
    _flow = begin;
    [self resumeVFXAnimation];
}

-(void) setRepeat:(int)repeat {
    [self pauseVFXAnimation];
    _repeat = repeat;
    [self resumeVFXAnimation];
}

-(void) setCount:(int)count{
    [self resetVFXParticle];
    _count = count;
}

-(void) updateFlowValue {
    if(self->isAnimation == YES && self->flowInterval){
        if(self.flow == self.repeat){
            [self->flowInterval invalidate];
            self->flowInterval = nil;
        }
        self.flow = self.flow - 1;
    }
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect {
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.count; i++) {
        VFXCosmosParticle* item = [[VFXCosmosParticle alloc] initWithRect:rect];
        [particles addObject:item];
    }
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    for (VFXCosmosParticle* item in self.particles) {
        [item updateParticleWithMove:self->touchPoint andFlow:self.flow andForce:self.force];
    }
}

#pragma mark VFXAnimation life circle -
-(void) startVFXAnimation {
    [super startVFXAnimation];
    if(self->flowInterval == nil){
        self->flowInterval = [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(updateFlowValue) userInfo:nil repeats:YES];
    }
}

-(void) stopVFXAnimation {
    [super stopVFXAnimation];
    if(self->flowInterval){
        [self->flowInterval invalidate];
        self->flowInterval = nil;
    }
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(ctx,kCGBlendModeSourceIn);
    CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx, kCGBlendModeLighten);
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw Cosmos particle"];
    }
}

#pragma mark Touch life circle -
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self->isTouchDown = YES;
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.count > 0){
        self->touchPoint = [[touches anyObject] locationInView:self];
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self->isTouchDown = NO;
}


@end
