//
//  VFXBokehPatternView.m
//  iOSVFX
//
//  Created by Le Quang on 04/10/2022.
//

#import "VFXBokehPatternView.h"

@implementation VFXBokehPatternView

-(NSString*) viewName {
    return @"bokeh_pattern";
}

-(instancetype) initWithFrame:(CGRect)frame andCount:(int)count {
    self = [super initWithFrame:frame];
    if(self){}
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andCount:(int)count andColorRange:(NSArray *)colors {
    self = [super initWithFrame:frame];
    if(self){}
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
