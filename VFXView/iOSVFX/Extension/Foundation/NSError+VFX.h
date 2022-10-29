//
//  NSError+VFX.h
//  iOSVFX
//
//  Created by Le Quang on 27/09/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define WEAK_SELF __weak __typeof__(self)

@interface NSError (VFX)
@property(nonatomic, retain, readonly) NSString* description;
@property(nonatomic, retain, readonly) NSString* failureReason;
@property(nonatomic, retain, readonly) NSString* userData;
-(void) vfxPrint;
+(instancetype) makeVFXErrorWithDescription:(NSString*) description;
+(instancetype) makeVFXErrorWithDescription:(NSString*) description andFailureReason:(NSString*) failureReason;
+(instancetype) makeVFXErrorWithDescription:(NSString*) description andFailureReason:(NSString*) failureReason andUserData:(NSString*) userData;
@end

NS_ASSUME_NONNULL_END
