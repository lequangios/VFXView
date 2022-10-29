//
//  UIView+VFX.h
//  iOSVFX
//
//  Created by Le Quang on 22/09/2022.
//
#pragma clang system_header
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (VFX)

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGPoint centerXY;
@property(nonatomic, assign, readonly) CGFloat maxX;
@property(nonatomic, assign, readonly) CGFloat maxY;
@property(nonatomic, assign) CGSize size;

@end

NS_ASSUME_NONNULL_END
