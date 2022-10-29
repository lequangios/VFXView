//
//  NSError+VFX.m
//  iOSVFX
//
//  Created by Le Quang on 27/09/2022.
//

#import "NSError+VFX.h"

#define vfx_domain @"com.ios.vfx"
#define vfx_code -100
#define vfx_user_data @"vfx_user_data"

@implementation NSError (VFX)
@dynamic description;
@dynamic failureReason;
@dynamic userData;

-(NSString*) getDescription {
    return self.localizedDescription;
}

-(NSString*) getFailureReason {
    if (self.localizedFailureReason != nil) {
        return self.localizedFailureReason;
    }
    return @"";
}

-(NSString*) getUserData {
    if(self.userInfo != nil && [self.userInfo valueForKey:vfx_user_data] != nil) {
        return [self.userInfo valueForKey:vfx_user_data];
    }
    return @"";
}

-(void) vfxPrint {
    NSString* str = [NSString stringWithFormat:@"Description:%@\nFailureReason:%@\nUserData:%@", self.description, self.failureReason, self.userData];
    NSLog(@"%@", str);
}

+(instancetype) makeVFXErrorWithDescription:(NSString*) description {
    return [[NSError alloc] initWithDomain:vfx_domain code:vfx_code userInfo:nil];
}

+(instancetype) makeVFXErrorWithDescription:(NSString*) description andFailureReason:(NSString*) failureReason {
    NSDictionary* userInfo = @{NSLocalizedFailureReasonErrorKey:failureReason};
    return [[NSError alloc] initWithDomain:vfx_domain code:vfx_code userInfo:userInfo];
}

+(instancetype) makeVFXErrorWithDescription:(NSString*) description andFailureReason:(NSString*) failureReason andUserData:(NSString*) userData{
    NSDictionary* userInfo = @{NSLocalizedFailureReasonErrorKey:failureReason,vfx_user_data:userData};
    return [[NSError alloc] initWithDomain:vfx_domain code:vfx_code userInfo:userInfo];
}

@end
