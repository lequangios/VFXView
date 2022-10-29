//
//  VFXBokehPatternView.h
//  iOSVFX
//
//  Created by Le Quang on 04/10/2022.
//

#import "iOSVFX.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXBokehPatternView : VFXView

@property(nonatomic, assign) int bokehCount;
@property(nonatomic, retain) NSArray* colorRange;

-(instancetype) initWithFrame:(CGRect) frame andCount:(int) count;
-(instancetype) initWithFrame:(CGRect) frame andCount:(int) count andColorRange:(NSArray*) colors;

@end

NS_ASSUME_NONNULL_END
