//
//  VFXCosmosView.h
//  iOSVFX
//
//  Created by Le Quang on 06/10/2022.
//

#import "VFXBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXCosmosView : VFXView
{
    BOOL isTouchDown;
    CGPoint touchPoint;
    NSTimer* flowInterval;
}

@property(nonatomic, assign) int begin, repeat, count, flow;
@property(nonatomic, assign, readonly) CGFloat force;

-(instancetype) initWithFrame:(CGRect) frame andCount:(int) count;
-(instancetype) initWithFrame:(CGRect) frame andBegin:(int) begin andRepeat:(int) repeat andCount:(int) count;

@end

NS_ASSUME_NONNULL_END
