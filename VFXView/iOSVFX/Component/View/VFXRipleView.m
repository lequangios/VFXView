//
//  VFXRipleView.m
//  iOSVFX
//
//  Created by Le Quang on 12/10/2022.
//

#import "VFXRipleView.h"
#import "VFXImage.h"
#import "UIImage+VFX.h"
#import "NSError+VFX.h"


@implementation VFXRipleView
@synthesize imageObj    = _imageObj;
@synthesize view        = _view;

-(instancetype) initWithFrame:(CGRect)frame andImage:(UIImage*) image
{
    self = [super initWithFrame:frame];
    if(self != nil){
        move = 1;
        _imageObj = [[VFXImage alloc] initWithImage:image];
        _view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _view.backgroundColor = [UIColor redColor];
        [self addSubview:_view];
    }
    return self;
}

-(BOOL) createVFXParticleWithRect:(CGRect)rect{
    if(_imageObj == nil || _imageObj.image == nil) {
        particleNotReady = YES;
        return YES;
    }
    move            = 1;
    width           = (NSUInteger) (_imageObj.image.size.width*_imageObj.image.scale);
    height          = (NSUInteger) (_imageObj.image.size.height*_imageObj.image.scale);
    halfWidth       = (NSUInteger) width >> 1;
    halfHeight      = (NSUInteger) height >> 1;
    size            = width * (height + 2) * 4; // space for 2 images (old and new), +2 to cover ripple radius <= 3
    delay           = 30; // delay is desired FPS
    oldIdx          = width;
    newIdx          = width * (height + 3); // +2 from above size calc +1 more to get to 2nd image
    rippleRad       = 3;
    
    lastMap         = (unsigned char*) calloc(size, sizeof(unsigned char));
    rippleMap       = (unsigned char*) calloc(size, sizeof(unsigned char));
    
    texture         = (unsigned char*) calloc(_imageObj.length, sizeof(unsigned char));
    ripple          = (unsigned char*) calloc(_imageObj.length, sizeof(unsigned char));
    
    NSLog(@"size = %lu", size);
    NSLog(@"length = %lu", _imageObj.length);
    NSLog(@"newIdx = %lu", newIdx);
    
    // Any image can be used, but we will create a simple pattern instead
    // So need some variables to create the background/underwater image
    stripeWidth     = 25;
    step            = width*2;
    count           = (NSUInteger) (height / stripeWidth);
    
    memset(lastMap, (char)0, size);
    memset(rippleMap, (char)0, size);
    
    for (int i=0; i < size; i++) {
        lastMap[i]      = (int) 1;
        rippleMap[i]    = (int) 0;
    }
    
    for (int i = 0; i < _imageObj.length; i++) {
        texture[i]  = _imageObj->bitmap[i];
        ripple[i]   = _imageObj->bitmap[i];
    }
    particleNotReady = NO;
    return [super createVFXParticleWithRect:rect];
}

//Create the next frame of the ripple effect
-(void) newframe
{
    NSUInteger i;
    double a, b;
    NSUInteger data, oldData;
    NSUInteger curPixel, newPixel;
    
    // Store indexes - old and new may be misleading/confusing
    //               - current and next is slightly more accurate
    //               - previous and current may also help in thinking
    i = oldIdx;
    oldIdx = newIdx;
    newIdx = i;
    
    // Initialize the looping values - each will be incremented
    i = 0;
    mapIdx = oldIdx;
    move = move + 1;
    if(move > 500) {move = 1;}
    
    for (int y = 0; y < height; y++)
    {
        for (int x = 0; x < width; x++)
        {
            // Use rippleMap to set data value, mapIdx = oldIdx
            // Use averaged values of pixels: above, below, left and right of current
            data = (
                    rippleMap[mapIdx - width] +
                    rippleMap[mapIdx + width] +
                    rippleMap[mapIdx - 1] +
                    rippleMap[mapIdx + 1]) >> 1;    // right shift 1 is same as divide by 2
            
            // Subtract 'previous' value (we are about to overwrite rippleMap[newIdx+i])
            data -= rippleMap[newIdx + i];
            
            // Reduce value more -- for damping
            // data = data - (data / 32)
            data -= data >> 5;
            
            // Set new value
            rippleMap[newIdx + i] = data;
            
            // If data = 0 then water is flat/still,
            // If data > 0 then water has a wave
            data = 1024 - data;
            
            oldData = lastMap[i];
            lastMap[i] = data;
            curPixel = [_imageObj byteIndexAt:x andY:y];
            
            //if (oldData != data)  // if no change no need to alter image
           
            if (curPixel % move == 0)
            {
                // Recall using "<< 0" forces integer value
                // Calculate pixel offsets
                a = (((x - halfWidth) * data / 1024) << 0) + halfWidth;
                b = (((y - halfHeight) * data / 1024) << 0) + halfHeight;
                
                // Don't go outside the image (i.e. boundary check)
                if (a >= width) a = width - 1;
                if (a < 0) a = 0;
                if (b >= height) b = height - 1;
                if (b < 0) b = 0;
                
                // Set indexes
                //newPixel = (NSUInteger) (a + (b * width)) * 4;
                newPixel = [_imageObj byteIndexAt:a andY:b];
                //curPixel = i * 4;
                
                
                // Apply values
                ripple[curPixel]       = texture[newPixel];
                ripple[curPixel + 1] = texture[newPixel + 1];
                ripple[curPixel + 2] = texture[newPixel + 2];
            }
            else {
                // Apply values
                ripple[curPixel]       = texture[curPixel];
                ripple[curPixel + 1] = texture[curPixel + 1];
                ripple[curPixel + 2] = texture[curPixel + 2];
            }
            
            mapIdx++;
            i++;
        }
    }
}

-(char) rippleDataMapIdx:(NSUInteger) mapIdx andNewIdx:(NSUInteger) newIdx andWidth:(NSUInteger) width andIndex:(NSUInteger) index {
    // Use rippleMap to set data value, mapIdx = oldIdx
    // Use averaged values of pixels: above, below, left and right of current
    NSUInteger data = (
                       rippleMap[mapIdx - width] +
                       rippleMap[mapIdx + width] +
                       rippleMap[mapIdx - 1] +
                       rippleMap[mapIdx + 1]) >> 1;    // right shift 1 is same as divide by 2
    // Subtract 'previous' value (we are about to overwrite rippleMap[newIdx+i])
    data -= rippleMap[newIdx + index];
    
    // Reduce value more -- for damping
    // data = data - (data / 32)
    data -= data >> 5;
    
    // Set new value
    rippleMap[newIdx + index] = data;
    
    // If data = 0 then water is flat/still,
    // If data > 0 then water has a wave
    data = 1024 - data;
    return data;
}

//-(CGPoint)

-(void) updateVFXParticle {
    //NSLog(@"update VFX");
    if(particleNotReady == YES){
        _imageObj = [[VFXImage alloc] initWithImage:[UIImage vfxGetImageFromCurrentCGContext]];
        [self createVFXParticleWithRect:self.bounds];
    }
    else {
        [self newframe];
    }
}

-(void) drawImage
{
    //CGImageRef imageRef     = [_imageObj exportImageRefFromBitmap:ripple];
    CGImageRef imageRef     = [_imageObj exportImageRefFromBitmap:ripple];
    UIImage* rawImage       = [UIImage imageWithCGImage:imageRef];
    _view.image             = rawImage;
    CGImageRelease(imageRef);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawImage];
    BOOL result = [self drawVFXViewWith:ctx];
    if(result == NO) {
        self->error = [NSError makeVFXErrorWithDescription:@"Can't draw particle"];
    }
}

-(void) vfxRelease {
    [super vfxRelease];
    [_imageObj clearVFXImage];
    _imageObj   = nil;
    [_view removeFromSuperview];
    _view       = nil;
//    free(rippleMap);
//    free(lastMap);
//    free(ripple);
//    free(texture);
}

@end
