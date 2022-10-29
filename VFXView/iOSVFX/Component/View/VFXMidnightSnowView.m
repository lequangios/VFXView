//
//  VFXMidnightSnowView.m
//  iOSVFX
//
//  Created by Le Quang on 12/10/2022.
//

#import "VFXMidnightSnowView.h"
#import "VFXMidnightSnowParticle.h"
#import "UIColor+VFX.h"
#import "NSError+VFX.h"

@interface VFXMidnightSnowView ()
@property(nonatomic, retain) UIColor* beginColor;
@property(nonatomic, retain) UIColor* endColor;

@end

@implementation VFXMidnightSnowView
@synthesize beginColor = _beginColor;
@synthesize endColor = _endColor;

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame andParticleLength:600];
    if(self){
        //_beginColor = [UIColor VFXColorWithHue:360 saturation:100 lightness:100 alpha:1];
        //_endColor = [UIColor VFXColorWithHue:360 saturation:100 lightness:100 alpha:0];
        _beginColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
        _endColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength {
    self = [super initWithFrame:frame andParticleLength:particleLength];
    if(self){
        _beginColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
        _endColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    }
    return self;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    for (int i=0; i < self.particleLength; i++) {
        VFXMidnightSnowParticle* item = [[VFXMidnightSnowParticle alloc] initWithRect:rect andBeginColor:self.beginColor andEndColor:self.endColor];
        [particles addObject:item];
    }
    
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    for (VFXMidnightSnowParticle* item in self.particles) {
        [item updateParticleWithRect:self.bounds];
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx,[UIColor clearColor].CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx,kCGBlendModeNormal);
    
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw particle"];
    }
}


@end
