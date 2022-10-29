//
//  VFXComponentViewObj.m
//  iOSVFX Example
//
//  Created by Le Quang on 10/10/2022.
//

#import "VFXComponentViewObj.h"
#import <VFXView/VFXView.h>
#import "VFXPopupView.h"

@implementation VFXComponentItem

+(instancetype) component:(NSString*) name andShow:(NSString*) show andHide:(NSString*) hide{
    VFXComponentItem* obj = [[VFXComponentItem alloc] init];
    obj.name = name;
    obj.show = NSSelectorFromString(show);
    obj.hide = NSSelectorFromString(hide);
    return obj;
}

@end
@interface VFXComponentViewObj ()
@property(nonatomic, retain) VFXPopupView* popupView;
@property(nonatomic, retain) UIScrollView* contentView;
@property(nonatomic, retain) UIView* containerView;
@end

@implementation VFXComponentViewObj
@synthesize containerView = _containerView;
@synthesize rect          = _rect;
@synthesize popupView      = _popupView;

-(instancetype) initWithContainerView:(UIView*) containerView {
    self = [super init];
    if(self){
        if(containerView == nil){
            NSAssert(NO, @"containerView cannot nil");
        }
        _containerView = containerView;
        _contentView = [[UIScrollView alloc] initWithFrame:_containerView.bounds];
        _popupView = [[VFXPopupView alloc] initWithFrame:CGRectMake(0, 20, _containerView.bounds.size.width, _containerView.bounds.size.height-20)];
        [_containerView addSubview:_contentView];
        [_containerView addSubview:_popupView];
    }
    return self;
}

-(void) showView {
    int i = 0;
    for (VFXComponentItem* item in self.list) {
        UIView* view = [self makeViewWithItem:item andIndex:i];
        [self.contentView addSubview:view];
        i = i + 1;
    }
    self.contentView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.totalHeight);
}

-(void) showVFXComponentWithItem:(VFXComponentItem*) item {
    if([self respondsToSelector:item.show]){
        IMP imp = [self methodForSelector:item.show];
        void (*func)(id, SEL) = (void *)imp;
        func(self, item.show);
    }
}

-(UIView*) makeViewWithItem:(VFXComponentItem*) item andIndex:(int) index {
    CGRect rect = [self itemRectWithIndex:index];
    UIView* view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    view.layer.cornerRadius = 5;
    
    UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake((self.itemWidth-50)/2, self.itemSpace, 50, 50)];
    img.image = [UIImage imageNamed:@"item_btn"];
    
    UILabel* lb = [[UILabel alloc] initWithFrame:CGRectMake(0, img.frame.size.height + img.frame.origin.y + self.itemSpace, rect.size.width, 30)];
    lb.text = item.name;
    lb.textColor = [UIColor blackColor];
    lb.font = [UIFont systemFontOfSize:14];
    lb.textAlignment = NSTextAlignmentCenter;
    
    UIButton* btn = [[UIButton alloc] initWithFrame:view.bounds];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:item.show forControlEvents:UIControlEventTouchUpInside];
    btn.tag = index;
    [view addSubview:img];
    [view addSubview:lb];
    [view addSubview:btn];
    return view;
}

-(NSArray<VFXComponentItem *>*) list {
    NSMutableArray* data = [[NSMutableArray alloc] init];
    [data addObject:[VFXComponentItem component:@"VFXSnowView" andShow:@"showVFXSnowView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXFlyBubbleView" andShow:@"showVFXFlyBubbleView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXCosmosView" andShow:@"showVFXCosmosView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXBubblyView" andShow:@"showVFXBubblyView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXLiquidView" andShow:@"showVFXLiquidView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXRainView" andShow:@"showVFXRainView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXRipleView" andShow:@"showVFXRipleView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXMidnightSnowView" andShow:@"showVFXMidnightSnowView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXContourView" andShow:@"showVFXContourView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXAntigravityFlowView" andShow:@"showVFXAntigravityFlowView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXLiquidView" andShow:@"showVFXLiquidView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXLiquidView" andShow:@"showVFXLiquidView:" andHide:@"hideComponent"]];
    [data addObject:[VFXComponentItem component:@"VFXLiquidView" andShow:@"showVFXLiquidView:" andHide:@"hideComponent"]];
    return data;
}

-(CGFloat) itemWidth { return 150;}
-(CGFloat) itemHeight { return 150;}
-(CGFloat) itemSpace { return 15;}
-(CGFloat) totalHeight {
    int line = (int) self.list.count/self.itemPerLine + 1;
    return line*self.itemHeight + (line+1)*self.itemSpace;
}
-(CGFloat) offsetLeft {
    return (self.containerView.bounds.size.width - (self.itemWidth*self.itemPerLine + (self.itemPerLine-1)*self.itemSpace))/2;
}
-(int) itemPerLine { return 2;}
-(CGPoint) pointWithRange:(int) range andIndex:(int) index andLength:(int) length {
    int y = (int) index/range;
    int x = index % length;
    return CGPointMake(x, y);
}

-(CGRect) itemRectWithIndex:(int) index {
    int py = (int) index/self.itemPerLine;
    int px = index % self.itemPerLine;
    int y = (py+1)*self.itemSpace + py*self.itemHeight;
    int x = self.itemWidth*px + px*self.itemSpace + self.offsetLeft;
    if(px == 0) { x = self.offsetLeft; }
    return CGRectMake(x, y, self.itemWidth, self.itemHeight);
}

-(void) hideVFXComponentWithItem:(VFXComponentItem*) item {
    if([self respondsToSelector:item.hide]){
        IMP imp = [self methodForSelector:item.hide];
        void (*func)(id, SEL) = (void *)imp;
        func(self, item.hide);
    }
}


-(void) showVFXViewWithVFX:(VFXView*) vfxView andButton:(UIButton*) btn andImage:(nullable UIImage*) image {
    if(self.popupView == nil){ vfxView = nil; }
    VFXComponentItem* item = [self.list objectAtIndex:btn.tag];
    if(image == nil){
        [self.popupView showWithVFXView:vfxView andName:item.name];
    }
    else {
        [self.popupView showWithVFXView:vfxView andName:item.name andImage:image];
    }
}

#pragma mark VFXView show and hide -
-(void) showVFXSnowView:(UIButton*) btn {
    VFXSnowView* snowView = [[VFXSnowView alloc] initWithFrame:self.containerView.frame];
    snowView.fillColor = [UIColor clearColor];
    snowView.snowColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    snowView.snowCount = 30;
    snowView.snowRadius = 5;
    [self showVFXViewWithVFX:snowView andButton:btn andImage:[UIImage imageNamed:@"winter_bg"]];
}

-(void) showVFXFlyBubbleView:(UIButton*) btn  {
    VFXFlyBubbleView* bubbleView = [[VFXFlyBubbleView alloc] initWithFrame:self.containerView.bounds andCount:20 andBeginColor:[[UIColor blueColor] colorWithAlphaComponent:0.5] andEndColor:[[UIColor purpleColor] colorWithAlphaComponent:0.2]];
    bubbleView.enableDebug = NO;
    [self showVFXViewWithVFX:bubbleView andButton:btn andImage:[UIImage imageNamed:@"field_bg"]];
}

-(void) showVFXCosmosView:(UIButton*) btn  {
    VFXCosmosView* cosmos = [[VFXCosmosView alloc] initWithFrame:self.containerView.frame];
    [self showVFXViewWithVFX:cosmos andButton:btn andImage:nil];
}

-(void) showVFXBubblyView:(UIButton*) btn  {
    VFXBubblyView* bubbly = [[VFXBubblyView alloc] initWithFrame:self.containerView.frame];
    [self showVFXViewWithVFX:bubbly andButton:btn andImage:nil];
}

-(void) showVFXLiquidView:(UIButton*) btn  {
    VFXLiquidView* liquid = [[VFXLiquidView alloc] initWithFrame:self.containerView.frame andParticleLength:100];
    [self showVFXViewWithVFX:liquid andButton:btn andImage:nil];
}

-(void) showVFXRainView:(UIButton*) btn {
    VFXRainView* view = [[VFXRainView alloc] initWithFrame:self.containerView.frame];
    [self showVFXViewWithVFX:view andButton:btn andImage:[UIImage imageNamed:@"rain_bg"]];
}

-(void) showVFXRipleView:(UIButton*) btn {
    VFXRipleView* view = [[VFXRipleView alloc] initWithFrame:self.containerView.frame andImage:[UIImage imageNamed:@"rain_bg"]];
    [self showVFXViewWithVFX:view andButton:btn andImage:nil];
}

-(void) showVFXMidnightSnowView:(UIButton*) btn {
    VFXMidnightSnowView* view = [[VFXMidnightSnowView alloc] initWithFrame:self.containerView.frame];
    [self showVFXViewWithVFX:view andButton:btn andImage:[UIImage imageNamed:@"midnight"]];
}

-(void) showVFXContourView:(UIButton*) btn {
    VFXContourView* view = [[VFXContourView alloc] initWithFrame:self.containerView.frame];
    [self showVFXViewWithVFX:view andButton:btn andImage:nil];
}

-(void) showVFXAntigravityFlowView:(UIButton*) btn {
    VFXAntigravityFlowView* view = [[VFXAntigravityFlowView alloc] initWithFrame:self.containerView.frame];
    [self showVFXViewWithVFX:view andButton:btn andImage:nil];
}

@end
