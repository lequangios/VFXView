//
//  VFXComponentViewObj.h
//  iOSVFX Example
//
//  Created by Le Quang on 10/10/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface VFXComponentItem : NSObject
@property(nonatomic, retain) NSString* name;
@property(nonatomic, assign) SEL show;
@property(nonatomic, assign) SEL hide;
+(instancetype) component:(NSString*) name andShow:(NSString*) show andHide:(NSString*) hide;
@end

@interface VFXComponentViewObj : NSObject
@property(nonatomic, retain, readonly) NSArray<VFXComponentItem *>* list;
@property(nonatomic, assign, readonly) CGFloat itemWidth, itemHeight, itemSpace, totalHeight, offsetLeft;
@property(nonatomic, assign, readonly) int itemPerLine;
@property(nonatomic, assign) CGRect rect;

-(instancetype) initWithContainerView:(UIView*) containerView;
-(void) showView;
-(void) showVFXComponentWithItem:(VFXComponentItem*) item;
-(void) hideVFXComponentWithItem:(VFXComponentItem*) item;
-(CGRect) itemRectWithIndex:(int) index;

@end

NS_ASSUME_NONNULL_END
