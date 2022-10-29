//
//  VFXFlyBubbleView.m
//  iOSVFX
//
//  Created by Le Quang on 29/09/2022.
//

#import "VFXFlyBubbleView.h"
#import "VFXFlyBubbleParticle.h"
#import "NSError+VFX.h"

@implementation VFXFlyBubbleView
@synthesize beginColor      = _beginColor;
@synthesize endColor        = _endColor;
@synthesize bubbleCount     = _bubbleCount;

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self.blendMode = kCGBlendModeSourceOut;
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect) frame andCount:(int) count andBeginColor:(UIColor*) beginColor andEndColor:(UIColor*) endColor {
    self = [[VFXFlyBubbleView alloc] initWithFrame:frame];
    if(self){
        _beginColor     = beginColor;
        _endColor       = endColor;
        _bubbleCount    = count;
    }
    return self;
}

-(void) setBubbleCount:(int)bubbleCount{
    [self resetVFXParticle];
    _bubbleCount = bubbleCount;
}

-(void) setBeginColor:(UIColor *)beginColor {
    [self resetVFXParticle];
    _beginColor = beginColor;
}

-(void) setEndColor:(UIColor *)endColor{
    [self resetVFXParticle];
    _endColor = endColor;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.bubbleCount; i++) {
        VFXFlyBubbleParticle* item = [[VFXFlyBubbleParticle alloc] initWithRect:rect andBeginColor:self.beginColor andEndColor:self.endColor];
        [particles addObject:item];
    }
    self.particles = particles;
    [VFXFlyBubbleParticle logParticlePoint:particles];
    return result;
}

-(void) updateVFXParticle {
    for (VFXFlyBubbleParticle* item in self.particles) {
        [item updateParticleWithRect:self.bounds andBeginColor:nil andEndColor:nil];
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx,[UIColor clearColor].CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx,self.blendMode);
    //[self.endColor setStroke];
    //[self.endColor setFill];
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw Bubble particle"];
    }
}

@end
