//
//  NSMutableArray+VFX.m
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#import "NSMutableArray+VFX.h"
#import "NSNumber+VFX.h"

@implementation NSMutableArray (VFX)

-(id) vfxObjectWithRandomIndex {
    int index = [NSNumber vfxRandomIntFrom:0 to:(int)self.count];
    if(index >= self.count) {index = (int)self.count-1;}
    return [self objectAtIndex:index];
}

@end
