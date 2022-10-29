//
//  VFXSVGParticle.m
//  iOSVFX
//
//  Created by Le Quang on 25/10/2022.
//

#import "VFXSVGParticle.h"

@implementation VFXSVGParticle

@synthesize path = _path;
@synthesize fill = _fill;
@synthesize stroke = _stroke;

-(instancetype) init {
    self = [super init];
    if(self){
        _fill = [UIColor clearColor];
        _stroke = [UIColor clearColor];
    }
    return self;
}

-(void) drawSVGWithContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    [_fill setFill];
    [_stroke setStroke];
    [_path stroke];
    [_path fill];
    CGContextRestoreGState(ctx);
}

-(void) applySVGWithTransform:(CGAffineTransform)transform {
    [_path applyTransform:transform];
}

@end
