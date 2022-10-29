//
//  VFXBubblyView.h
//  iOSVFX
//
//  Created by Le Quang on 07/10/2022.
//

#import "iOSVFX.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXBubblyView : VFXView
{
    CGPoint touchPoint;
    BOOL isRandomColor;
}

@property(nonatomic, retain) NSArray<UIColor*>* colors;
@property(nonatomic, assign) CGFloat radius, growth;

-(instancetype) initWithFrame:(CGRect)frame withColors:(NSArray<UIColor*>*)colors;
-(instancetype) initWithFrame:(CGRect)frame withColors:(NSArray<UIColor*>*)colors withRadius:(CGFloat) radius;
-(instancetype) initWithFrame:(CGRect)frame withColors:(NSArray<UIColor*>*)colors withRadius:(CGFloat) radius withGrowth:(CGFloat) growth;

@end

NS_ASSUME_NONNULL_END
