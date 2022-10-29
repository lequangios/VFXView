//
//  VFXPopupView.m
//  iOSVFX Example
//
//  Created by Le Quang on 11/10/2022.
//

#import "VFXPopupView.h"

@implementation VFXPopupView
@synthesize  vfx = _vfx;
@synthesize vfxName = _vfxName;
@synthesize closeBtn = _closeBtn;
@synthesize vfxLabel = _vfxLabel;
@synthesize contentView = _contentView;
@synthesize backgroundView = _backgroundView;
@synthesize backgroundImage = _backgroundImage;

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-self.topHeight-5, 5, self.topHeight-10, self.topHeight-10)];
        [_closeBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
        [_closeBtn setBackgroundColor:[UIColor whiteColor]];
        [_closeBtn addTarget:self action:@selector(hideVFXPopupView) forControlEvents:UIControlEventTouchUpInside];
        _vfxLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width-self.topHeight, self.topHeight)];
        _vfxLabel.textColor = [UIColor blackColor];
        _vfxLabel.font = [UIFont systemFontOfSize:16 weight:500];
        _vfxLabel.backgroundColor = [UIColor whiteColor];
        _contentView = [[UIView alloc] initWithFrame:self.vfxRect];
        
        _backgroundView = [[UIImageView alloc] initWithFrame:_contentView.bounds];
        _backgroundView.backgroundColor = [UIColor grayColor];
        _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        [_contentView addSubview:_backgroundView];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:_vfxLabel];
        [self addSubview:_closeBtn];
        [self addSubview:_contentView];
        self.hidden = YES;
        self.alpha = 0;
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame andName:(NSString *)name {
    self = [self initWithFrame:frame];
    self.vfxName = name;
    return self;
}

-(CGFloat) topHeight {return 50.0;}
-(CGRect) vfxRect { return  CGRectMake(0, self.topHeight, self.frame.size.width, self.frame.size.height - self.topHeight);}
-(UIImage*) backgroundImage {
    if(_backgroundView != nil && _backgroundImage.images.count > 0) {
        return [_backgroundImage.images objectAtIndex:0];
    }
    return nil;
}
-(void) setBackgroundImage:(nullable UIImage *)backgroundImage {
    if(_backgroundView == nil){
        _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.topHeight, self.frame.size.width, self.frame.size.height-self.topHeight)];
    }
    [_backgroundView setImage:backgroundImage];
}

-(void) setVfx:(VFXView *)vfx {
    if(_vfx != nil){
        [_vfx vfxRelease];
    }
    _vfx = vfx;
    [_contentView addSubview:_vfx];
}

-(void) setVfxName:(NSString *)vfxName {
    _vfxName = vfxName;
    _vfxLabel.text = _vfxName;
}

-(void) showWithVFXView:(VFXView *)vfxView {
    self.vfx = vfxView;
    self.userInteractionEnabled = NO;
    self.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
        [self.vfx setupVFXViewWithRect:self.vfxRect];
    }];
}

-(void) showWithVFXView:(VFXView*) vfxView andName:(NSString*) name {
    self.vfxName = name;
    [self showWithVFXView:vfxView];
}

-(void) showWithVFXView:(VFXView*) vfxView andName:(NSString*) name andImage:(UIImage*) image {
    self.backgroundImage = image;
    [self showWithVFXView:vfxView andName:name];
}

-(void) hideVFXPopupView {
    self.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
        self.hidden = YES;
        self.backgroundImage = nil;
        [self.vfx vfxRelease];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
