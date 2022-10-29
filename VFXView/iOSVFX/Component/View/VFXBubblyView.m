//
//  VFXBubblyView.m
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#import "VFXBubblyView.h"
#import "NSArray+VFX.h"
#import "NSMutableArray+VFX.h"
#import "UIColor+VFX.h"
#import "VFXBubblyParticle.h"
#import "NSNumber+VFX.h"
#import "NSError+VFX.h"

@interface VFXBubblyView()

@property(nonatomic, retain, readonly) NSArray<UIColor*>* earth;
@property(nonatomic, retain, readonly) NSArray<UIColor*>* fire;
@property(nonatomic, retain, readonly) NSArray<UIColor*>* water;
@property(nonatomic, retain, readonly) NSArray<NSArray*>* bubblyColorArray;
@property(nonatomic, assign) int max_particles;

@end

@implementation VFXBubblyView
@synthesize colors = _colors;
@synthesize radius = _radius;
@synthesize growth = _growth;

-(NSArray<UIColor*>*) earth {
    return [[NSArray alloc] initWithObjects:[UIColor VFXRandomColorWithRed:0 green:38 blue:28],[UIColor VFXRandomColorWithRed:4 green:76 blue:41],[UIColor VFXRandomColorWithRed:22 green:127 blue:57],[UIColor VFXRandomColorWithRed:69 green:191 blue:85],[UIColor VFXRandomColorWithRed:150 green:237 blue:137], nil];
}

-(NSArray<UIColor*>*) fire {
    return [[NSArray alloc] initWithObjects:[UIColor VFXRandomColorWithRed:242 green:193 blue:102],[UIColor VFXRandomColorWithRed:242 green:134 blue:39],[UIColor VFXRandomColorWithRed:217 green:63 blue:7],[UIColor VFXRandomColorWithRed:140 green:29 blue:4],[UIColor VFXRandomColorWithRed:65 green:15 blue:4], nil];
}

-(NSArray<UIColor*>*) water {
    return [[NSArray alloc] initWithObjects:[UIColor VFXRandomColorWithRed:0 green:48 blue:90],[UIColor VFXRandomColorWithRed:0 green:75 blue:141],[UIColor VFXRandomColorWithRed:0 green:116 blue:217],[UIColor VFXRandomColorWithRed:65 green:147 blue:217],[UIColor VFXRandomColorWithRed:122 green:186 blue:242], nil];
}

-(NSArray<NSArray*>*) bubblyColorArray {
    return [[NSArray alloc] initWithObjects:self.earth, self.fire, self.water, nil];
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self->touchPoint = CGPointMake(frame.size.width/2, frame.size.height/2);
        self->isRandomColor = YES;
        self.radius = 10;
        self.growth = 20;
        self.max_particles = 100;
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame withColors:(NSArray<UIColor*>*)colors {
    self = [super initWithFrame:frame];
    if(self){
        self->touchPoint = CGPointMake(frame.size.width/2, frame.size.height/2);
        self->isRandomColor = NO;
        self.colors = colors;
        self.radius = 10;
        self.growth = 20;
        self.max_particles = 100;
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame withColors:(NSArray<UIColor*>*)colors withRadius:(CGFloat) radius {
    VFXBubblyView* obj = [[VFXBubblyView alloc] initWithFrame:frame withColors:colors];
    obj.radius = radius;
    return obj;
}

-(instancetype) initWithFrame:(CGRect)frame withColors:(NSArray<UIColor*>*)colors withRadius:(CGFloat) radius withGrowth:(CGFloat) growth {
    VFXBubblyView* obj = [[VFXBubblyView alloc] initWithFrame:frame withColors:colors withRadius:radius];
    obj.growth = growth;
    return obj;
}

-(NSArray<UIColor*>*) colors {
    if(_colors == nil){
        _colors = [self.bubblyColorArray vfxObjectWithRandomIndex];
    }
    return _colors;
}

-(void) setColors:(NSArray<UIColor *> *)colors {
    [self resetVFXParticle];
    _colors = colors;
    self->isRandomColor = NO;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    BOOL result = [super createVFXParticleWithRect:rect];
    NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
    VFXBubblyParticle* item = [[VFXBubblyParticle alloc] initWithPoint:self->touchPoint withMove:CGPointZero withColor:[self.colors vfxObjectWithRandomIndex] withRadius:10 withGrowth:20];
    [particles addObject:item];
    self.particles = particles;
    return result;
}

-(void) updateVFXParticle {
    [self pauseVFXAnimation];
    CGFloat vx = ([NSNumber vfxRandomFloat] - 0.5)*5 + ([NSNumber vfxRandomFloat] < 0.5 ? -2 : 2);
    CGFloat vy = ([NSNumber vfxRandomFloat] - 0.5)*5 + ([NSNumber vfxRandomFloat] < 0.5 ? -2 : 2);
    CGFloat r = [NSNumber vfxRandomFloat]*20 +30;
    for (VFXBubblyParticle* item in self.particles) {
        [item updateParticleWithRect:self.frame];
    }
    VFXBubblyParticle* newParticle = [[VFXBubblyParticle alloc] initWithPoint:self->touchPoint withMove:CGPointMake(vx, vy) withColor:[self.colors vfxObjectWithRandomIndex] withRadius:r withGrowth:-0.5];
    
    [self.particles addObject:newParticle];
    if(self.particles.count > self.max_particles){
        NSMutableArray<VFX2DParticle*>* particles = [[NSMutableArray alloc] init];
        for (VFXBubblyParticle* item in self.particles) {
            if(item.isNeedRemove == NO){
                [particles addObject:item];
            }
        }
        self.particles = particles;
    }
    [self resumeVFXAnimation];
}


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    CGContextClearRect(ctx,rect);
    CGContextSetBlendMode(ctx,self.blendMode);
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw Bubbly particle"];
    }
}

#pragma mark Touch life circle -
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(touches.count > 0){
        self->touchPoint = [[touches anyObject] locationInView:self];
    }
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
