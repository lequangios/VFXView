//
//  VFXSnowViewParticle.m
//  iOSVFX
//
//  Created by Le Quang on 05/10/2022.
//

#import "VFXSnowViewParticle.h"
#import "NSNumber+VFX.h"

@implementation VFXSnowViewParticle
@synthesize r = _r;
@synthesize d = _d;

-(instancetype) initWithRadius:(CGFloat) radius andColor:(UIColor*) color andRect:(CGRect) rect andIndex:(int) index {
    self = [super init];
    if(self){
        self.color = color;
        self.width = rect.size.width;
        self.height = rect.size.height;
        self.p = CGPointMake(self.width*[NSNumber vfxRandomFloat], self.height*[NSNumber vfxRandomFloat]);
        self.r = radius*[NSNumber vfxRandomFloat] + 1;
        self.d = index*[NSNumber vfxRandomFloat];
    }
    return self;
}

-(instancetype) initWithRadius:(CGFloat) radius andColor:(UIColor*) color andRect:(CGRect) rect andCount:(int) count  {
    self = [super init];
    if(self){
        self.color = color;
        self.width = rect.size.width;
        self.height = rect.size.height;
        self.p = CGPointMake(self.width*[NSNumber vfxRandomFloat], self.height*[NSNumber vfxRandomFloat]);
        self.r = radius*[NSNumber vfxRandomFloat] + 1;
        self.d = count*[NSNumber vfxRandomFloat];
    }
    return self;
}

-(void) updateParticleWithRect:(CGRect) rect andAngle:(float) angle {
    self.width = rect.size.width;
    self.height = rect.size.height;
    float x = self.p.x + sin(angle) * 2.0;
    float y = self.p.y + cos(angle + self.d) + 1.0 + self.r/2.0;
    if(x > self.width + 5 || x < -5 || y > self.height){
        //66.67% of the flakes
        if(self.index % 3 > 0) {
            x = [NSNumber vfxRandomFloat]* self.width;
            y = -10;
        }
        else {
            //If the flake is exitting from the right
            if(sin(angle) > 0){
                //Enter from the left
                x = -5;
                y = [NSNumber vfxRandomFloat]*self.height;
            }
            else {
                //If the flake is exitting from the right
                x = self.width + 5;
                y = [NSNumber vfxRandomFloat] * self.height;
            }
        }
    }
    self.p = CGPointMake(x, y);
}

-(void) drawParticle:(id)value withContext:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    CGContextBeginPath(ctx);
    CGContextAddArc(ctx, self.p.x, self.p.y, self.r, 0, 2*M_PI, true);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

@end
