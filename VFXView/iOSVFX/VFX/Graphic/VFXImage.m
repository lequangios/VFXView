//
//  VFXImage.m
//  izvisualFX
//
//  Created by Le Viet Quang on 7/1/18.
//  Copyright © 2018 Le Viet Quang. All rights reserved.
//

#import "VFXImage.h"

@implementation VFXImage

@synthesize length              = _length;
@synthesize width               = _width;
@synthesize height              = _height;
@synthesize bytesPerPixel       = _bytesPerPixel;
@synthesize bitsPerComponent    = _bitsPerComponent;
@synthesize bytesPerRow         = _bytesPerRow;
@synthesize image               = _image;

-(instancetype) initWithImage:(UIImage*) img {
    self = [super init];
    if (self != nil){
        _image = img;
        [self initVFX];
    }
    return self;
}

-(void) initVFX {
    if(_image != nil){
        // This Pixel Size
        _width      = (NSUInteger) _image.size.width*_image.scale;
        _height     = (NSUInteger) _image.size.height*_image.scale;
        
        // Create Defaul value
        _bytesPerPixel      = 4; // 4 mean 4 byte for red, green, blue, alpha
        _bitsPerComponent   = 8;
        _bytesPerRow        = _bytesPerPixel*_width;
        
        [self getBitmapArray];
    }
}

-(void) getBitmapArray
{
    // First get the image into your data buffer
    CGImageRef imageRef = [_image CGImage];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    bitmap = (unsigned char*) calloc(_height * _width * _bytesPerPixel, sizeof(unsigned char));
    CGContextRef context = CGBitmapContextCreate(bitmap, _width, _height,
                                                 _bitsPerComponent, _bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, _width, _height), imageRef);

    CGContextRelease(context);
    _length = (long) _height * _width * _bytesPerPixel;
}

-(CGImageRef) exportImageRefFromBitmap:(unsigned char *) map
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    
    CGContextRef ctx = CGBitmapContextCreate(map,
                                             _width,
                                             _height,
                                             _bitsPerComponent,
                                             _bytesPerRow,
                                             colorSpace,
                                             kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big );
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(ctx);
    return imageRef;
}

-(UIImage*) imageFromBitmap:(unsigned char *) map {
    CGImageRef imageRef     = [self exportImageRefFromBitmap:map];
    UIImage* rawImage       = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return rawImage;
}

//-(NSUInteger) rowSizeInBytes {
//    return (((_bytesPerPixel * _width + 31) * _bytesPerPixel) / 4);
//}
//-(NSUInteger) bitmapAddressAtX:(NSUInteger) x andY:(NSUInteger) y {
//    return [self rowSizeInBytes] * y + ((x * _bytesPerPixel) / 8);
//}

-(NSUInteger) byteIndexAt:(int) x andY:(int) y
{
    return (_bytesPerRow * y) + x * _bytesPerPixel;
}

-(NSUInteger) nextByteIndexFrom:(NSUInteger) byteIndex
{
    return (byteIndex + _bytesPerPixel);
}

-(void) forEach:(void(^)(int byteIndex, char bitmap1, char bitmap2, char bitmap3, char bitmap4)) handler {
    int byteIndex = 0;
    for (int i = 0; i < _width*_height; ++i) {
        handler(byteIndex, bitmap[byteIndex],bitmap[byteIndex+1],bitmap[byteIndex+2],bitmap[byteIndex+3]);
        byteIndex += _bytesPerPixel;
    }
}

-(void) clearVFXImage
{
    free(bitmap);
    _image = nil;
}

@end
