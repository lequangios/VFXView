//
//  VFXImage.h
//  izvisualFX
//
//  Created by Le Viet Quang on 7/1/18.
//  Copyright © 2018 Le Viet Quang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFXImage : NSObject
{
@public unsigned char * bitmap;
}
@property(nonatomic, assign) long length;
@property(nonatomic, assign) NSUInteger width;
@property(nonatomic, assign) NSUInteger height;
@property(nonatomic, assign) NSUInteger bytesPerPixel;
@property(nonatomic, assign) NSUInteger bitsPerComponent;
@property(nonatomic, assign) NSUInteger bytesPerRow;
@property(nonatomic, retain) UIImage* image;

-(instancetype) initWithImage:(UIImage*) img;
-(void) clearVFXImage;

-(void) initVFX;
//-(NSUInteger) rowSizeInBytes;
//-(NSUInteger) bitmapAddressAtX:(NSUInteger) x andY:(NSUInteger) y;
-(NSUInteger) byteIndexAt:(int) x andY:(int) y;
-(NSUInteger) nextByteIndexFrom:(NSUInteger) byteIndex;
-(void) getBitmapArray;
-(CGImageRef) exportImageRefFromBitmap:(unsigned char *) map;
-(UIImage*) imageFromBitmap:(unsigned char *) map;
-(void) forEach:(void(^)(int byteIndex, char bitmap1, char bitmap2, char bitmap3, char bitmap4)) handler;

@end
