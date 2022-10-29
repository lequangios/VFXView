//
//  VFXContourView.h
//  iOSVFX
//
//  Created by Le Quang on 14/10/2022.
//

#import "iOSVFX.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFXContourView : VFXView

-(instancetype) initWithFrame:(CGRect)frame;
-(instancetype) initWithFrame:(CGRect)frame andParticleLength:(int) particleLength;

@end

NS_ASSUME_NONNULL_END
