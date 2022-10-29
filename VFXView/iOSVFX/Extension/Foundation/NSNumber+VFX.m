//
//  NSNumber+VFX.m
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//
#include <stdlib.h>
#import "NSNumber+VFX.h"

@implementation NSNumber (VFX)

-(CGFloat) vfxRandom {
    return ((CGFloat) rand() / RAND_MAX);
}

+(CGFloat) vfxDegreesToRads:(CGFloat) degrees {
    return (degrees*M_PI)/180.0;
}

+(CGFloat) vfxRandomFloat {
    return ((CGFloat)rand() / RAND_MAX);
}

+(int) vfxRandomIntFrom:(int) min to:(int) max {
    return roundf([NSNumber vfxRandomFloat]*(max - min) + min);
}

+(CGFloat) vfxRandomRads {
    return [NSNumber vfxRandomFloat]*2.0*M_PI;
}

@end
