//
//  LinearGradient.m
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#import "LinearGradient.h"

@implementation LinearGradient

@synthesize color;
@synthesize position;

-(instancetype) initWithRed:(CGFloat) red andGreen:(CGFloat) green andBlue:(CGFloat) blue andAlpha:(CGFloat) alpha andPostion:(CGFloat) position {
    self = [super init];
    if(self){
        self.color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        self.position = [NSNumber numberWithFloat:position];
    }
    return self;
}

-(instancetype) initWithColor:(UIColor*) color andPosition:(CGFloat) position {
    self = [super init];
    if(self){
        self.color = color;
        self.position = [NSNumber numberWithFloat:position];
    }
    return self;
}

-(instancetype) initWithColorHex:(NSString*) hex andPosition:(CGFloat) position {
    self = [super init];
    if(self){
        self.color = [UIColor VFXColorFromHexValue:hex];
        self.position = [NSNumber numberWithFloat:position];
    }
    return self;
}

+(NSArray*) mapCGColor:(NSArray<LinearGradient*>*) list {
    NSMutableArray* result = [[NSMutableArray alloc] init];
    [list enumerateObjectsUsingBlock:^(LinearGradient * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [result addObject:(id) obj.color.CGColor];
    }];
    return result;
}

+(NSArray*) mapLocation:(NSArray<LinearGradient*>*) list {
    NSMutableArray* result = [[NSMutableArray alloc] init];
    [list enumerateObjectsUsingBlock:^(LinearGradient * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [result addObject:(id) obj.position];
    }];
    return result;
}
@end
