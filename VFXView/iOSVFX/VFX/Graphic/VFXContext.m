//
//  VFXContext.m
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#import "VFXContext.h"

@interface VFXContext ()

@property(nonatomic, assign) CGContextRef ctx;

@end

@implementation VFXContext

-(instancetype) initWithContext:(CGContextRef) ctx {
    self = [super init];
    if(self){
        self.ctx = ctx;
    }
    return self;
}

-(void) setFillColor:(UIColor*) color {
    CGContextSetFillColorWithColor(self.ctx, color.CGColor);
}

-(void) setStrokeColor:(UIColor*) color {
    CGContextSetStrokeColorWithColor(self.ctx, color.CGColor);
}

-(void) setBlendMode:(CGBlendMode) blendMode {
    CGContextSetBlendMode(self.ctx,blendMode);
}

-(void) clearRect:(CGRect) rect {
    CGContextClearRect(self.ctx,rect);
}

-(void) beginPath {
    CGContextBeginPath(self.ctx);
}

-(void) closePath {
    CGContextClosePath(self.ctx);
}

@end
