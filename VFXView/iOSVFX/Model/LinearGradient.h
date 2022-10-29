//
//  LinearGradient.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//

#pragma clang system_header

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+VFX.h"

NS_ASSUME_NONNULL_BEGIN

#define GradientRGBAColor(r,g,b,a,l) [[LinearGradient alloc] initWithColor:[UIColor VFXColorWithRed:r green:g blue:b alpha:a] andPosition:l]
#define GradientHexColor(hex,l) [[LinearGradient alloc] initWithColorHex:hex andPosition:l]

@interface LinearGradient : NSObject

@property(nonatomic, retain) UIColor* color;
@property(nonatomic, retain) NSNumber* position;

-(instancetype) initWithRed:(CGFloat) red andGreen:(CGFloat) green andBlue:(CGFloat) blue andAlpha:(CGFloat) alpha andPostion:(CGFloat) position;
-(instancetype) initWithColor:(UIColor*) color andPosition:(CGFloat) position;
-(instancetype) initWithColorHex:(NSString*) hex andPosition:(CGFloat) position;
+(NSArray*) mapCGColor:(NSArray<LinearGradient*>*) list;
+(NSArray*) mapLocation:(NSArray<LinearGradient*>*) list;

@end

NS_ASSUME_NONNULL_END
