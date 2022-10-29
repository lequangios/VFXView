//
//  VFXPopupView.h
//  iOSVFX Example
//
//  Created by Le Quang on 11/10/2022.
//

#import <UIKit/UIKit.h>
#import <VFXView/VFXView.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFXPopupView : UIView
@property(nonatomic, retain) VFXView* vfx;
@property(nonatomic, retain) UIView* contentView;
@property(nonatomic, retain) UIImageView* backgroundView;
@property(nonatomic, retain) UIImage* _Nullable  backgroundImage;
@property(nonatomic, retain) NSString* vfxName;
@property(nonatomic, retain) UIButton* closeBtn;
@property(nonatomic, retain) UILabel* vfxLabel;
@property(nonatomic, assign, readonly) CGFloat topHeight;
@property(nonatomic, assign, readonly) CGRect vfxRect;

-(instancetype) initWithFrame:(CGRect)frame andName:(NSString*) name;
-(void) showWithVFXView:(VFXView*) vfxView;
-(void) showWithVFXView:(VFXView*) vfxView andName:(NSString*) name;
-(void) showWithVFXView:(VFXView*) vfxView andName:(NSString*) name andImage:(UIImage*) image;
-(void) hideVFXPopupView;

@end

NS_ASSUME_NONNULL_END
