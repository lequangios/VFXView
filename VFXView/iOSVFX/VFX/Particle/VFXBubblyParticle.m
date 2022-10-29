//
//  VFXBubblyParticle.m
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#import "VFXBubblyParticle.h"

@implementation VFXBubblyParticle
@synthesize v = _v;
@synthesize alpha = _alpha;
@synthesize radius = _radius;
@synthesize growth = _growth;

-(instancetype) initWithPoint:(CGPoint)p withMove:(CGPoint)v withColor:(UIColor *)color withRadius:(CGFloat)radius withGrowth:(CGFloat)growth{
    self = [super init];
    if(self){
        self.p = p;
        self.color = color;
        _v = v;
        _alpha = 1;
        _radius = radius;
        _growth = growth;
    }
    return self;
}

-(BOOL) isNeedRemove {
    return (_alpha < 0 || _radius < 3);
}

-(void) updateParticleWithRect:(CGRect)rect {
    CGFloat x = self.p.x + self.v.x;
    CGFloat y = self.p.y + self.v.y;
    self.p = CGPointMake(x, y);
    self.alpha = self.alpha - 0.015;
    self.radius = self.radius + self.growth;
}

-(void) drawParticle:(id) value withContext:(CGContextRef) ctx {
    if(self.isNeedRemove == YES) { return; }
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    [[self.color colorWithAlphaComponent:self.alpha] setStroke];
    [[UIColor clearColor] setFill];
    CGContextAddArc(ctx, self.p.x, self.p.y, self.radius, 0, 2*M_PI, YES);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}


@end
