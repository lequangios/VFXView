//
//  VFXRipleView.h
//  iOSVFX
//
//  Created by Le Quang on 12/10/2022.
//

#import "iOSVFX.h"

NS_ASSUME_NONNULL_BEGIN
@class VFXImage;

@interface VFXRipleView : VFXView
{
    NSUInteger width;
    NSUInteger height;
    NSUInteger halfWidth;
    NSUInteger halfHeight;
    NSUInteger size;
    NSUInteger delay;
    NSUInteger oldIdx;
    NSUInteger newIdx;
    NSUInteger rippleRad;
    unsigned char * rippleMap;
    unsigned char * lastMap;
    NSUInteger mapIdx;
    unsigned char * ripple;
    unsigned char * texture;
    NSUInteger stripeWidth;
    NSUInteger step;
    NSUInteger count;
    BOOL particleNotReady;
    int move;
}
@property(nonatomic, retain) VFXImage* imageObj;
@property(nonatomic, retain) UIImageView* view;

-(instancetype) initWithFrame:(CGRect)frame andImage:(UIImage*) image;

@end

NS_ASSUME_NONNULL_END
