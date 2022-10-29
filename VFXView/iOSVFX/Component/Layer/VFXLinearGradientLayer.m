//
//  LinearGradientLayer.m
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#import "VFXLinearGradientLayer.h"
#import "NSNumber+VFX.h"
#import "VFXPoint.h"

@implementation VFXLinearGradientLayer

@synthesize colorGradients = _colorGradients;
@synthesize deg = _deg;

-(instancetype) init {
    self = [super init];
    if(self){
        self.type = kCAGradientLayerAxial;
    }
    return self;
}

-(instancetype) initWithColors:(NSArray<LinearGradient*>*) colorGradients andAngle:(CGFloat) angle {
    self = [super init];
    if(self){
        self.type = kCAGradientLayerAxial;
        _colorGradients = [[NSMutableArray alloc] initWithArray:colorGradients];
        _deg = angle;
    }
    return self;
}

-(void) setColorGradients:(NSMutableArray<LinearGradient *> *)colorGradients {
    _colorGradients = colorGradients;
    self.colors = [LinearGradient mapCGColor:self.colorGradients];
    self.locations = [LinearGradient mapLocation:self.colorGradients];
    self.needsDisplayOnBoundsChange = YES;
}

-(void) setDeg:(CGFloat)deg {
    _deg = deg;
    [self calulatingPoint:_deg];
    self.needsDisplayOnBoundsChange = YES;
}

-(void) calulatingPoint:(CGFloat) angle {
    if(angle == 0){
        self.startPoint = p(0.5,1.0);
    }
    else if(angle == 45){
        self.startPoint = p(0.0,1.0);
    }
    else if(angle == 90){
        self.startPoint = p(0.0,0.5);
    }
    else if(angle == 135){
        self.startPoint = p(0.0,0.0);
    }
    else if(angle == 180){
        self.startPoint = p(0.5,0.0);
    }
    else if(angle == 225){
        self.startPoint = p(1.0,0.0);
    }
    else if(angle == 270){
        self.startPoint = p(1.0,0.5);
    }
    else if(angle == 315){
        self.startPoint = p(1.0,1.0);
    }
    else if(angle > 315 || angle < 45){
        CGFloat x = (0.5 - tan([NSNumber vfxDegreesToRads:angle] * 0.5));
        self.startPoint = p(x,1.0);
    }
    else if(angle > 45 && angle < 135){
        CGFloat y = 0.5 + tan([NSNumber vfxDegreesToRads:90] - [NSNumber vfxDegreesToRads:angle]) * 0.5;
        self.startPoint = p(0.0,y);
    }
    else if(angle > 135 && angle < 225){
        CGFloat x = 0.5 - tan([NSNumber vfxDegreesToRads:180] - [NSNumber vfxDegreesToRads:angle]) * 0.5;
        self.startPoint = p(x, 0.0);
    }
    else if(angle > 225 && angle < 359){
        CGFloat y = 0.5 - tan([NSNumber vfxDegreesToRads:270] - [NSNumber vfxDegreesToRads:angle]) * 0.5;
        self.startPoint = p(1.0, y);
    }
    self.endPoint = p(1.0-self.startPoint.x, 1.0-self.startPoint.y);
}

@end
