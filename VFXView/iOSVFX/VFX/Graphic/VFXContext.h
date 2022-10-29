//
//  VFXContext.h
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#pragma clang system_header

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFXContext : NSObject

-(instancetype) initWithContext:(CGContextRef) ctx;
-(void) setFillColor:(UIColor*) color;
-(void) setStrokeColor:(UIColor*) color;
-(void) setBlendMode:(CGBlendMode) blendMode;
-(void) clearRect:(CGRect) rect;

-(void) beginPath;
-(void) closePath;

@end

NS_ASSUME_NONNULL_END
