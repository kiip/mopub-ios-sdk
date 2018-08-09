//
//  KPKiipNativeCustomEvent.m
//  MoPubSampleApp
//
//  Created by encore on 02/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#import "KPKiipNativeCustomEvent.h"
#import <KiipSDK/KiipSDK.h>

@interface KPKiipNativeCustomEvent () <KiipDelegate, KPPoptartDelegate>

@property (nonatomic, strong) KPPoptart *sPoptart;
@property (strong, nonatomic) KPNativeRewardView *nativeRewardView;

@end

@implementation KPKiipNativeCustomEvent

static KPKiipNativeCustomEvent *sInstance = nil;

+ (KPKiipNativeCustomEvent *)sharedInstance
{
    @synchronized(self) {
        if (sInstance == nil) {
            sInstance = [[self alloc] init];
        }
    }
    return sInstance;
}

+ (void)setAppKey:(NSString *)appKey andSecret:(NSString *)appSecret
{
    [Kiip initWithAppKey:appKey andSecret:appSecret];
    [[Kiip sharedInstance] setDelegate:[KPKiipNativeCustomEvent sharedInstance]];
}

- (void)requestAdWithCustomEventInfo:(NSDictionary *)info {
    
  //  _serverInfo = info;
    if ([Kiip sharedInstance] == nil && info != nil) {
        if ([info objectForKey:@"appKey"] && [info objectForKey:@"appSecret"]) {
            [Kiip initWithAppKey:[info objectForKey:@"appKey"] andSecret:[info objectForKey:@"appSecret"]];
            [[Kiip sharedInstance] setDelegate:self];
        }
    }

    
    if ([Kiip sharedInstance] && info != nil) {
        
        if ([info objectForKey:@"email"]) {
            [[Kiip sharedInstance] setEmail:[info objectForKey:@"email"]];
        }
        
        if ([info objectForKey:@"userId"]) {
            [[Kiip sharedInstance] setUserId:[info objectForKey:@"userId"]];
        }
        
        if ([info objectForKey:@"gender"]) {
            [[Kiip sharedInstance] setGender:[info objectForKey:@"gender"]];
        }
        
        if ([info objectForKey:@"birthday"]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"MM/dd/yyyy"];
            NSDate *birthDate = [dateFormatter dateFromString:[info objectForKey:@"birthday"]];
            [[Kiip sharedInstance] setBirthday:birthDate];
        }
        
        if ([info objectForKey:@"ageGroup"]) {
            [[Kiip sharedInstance] setAgegroup:[[info objectForKey:@"ageGroup"] intValue]];
        }
        
        if ([info objectForKey:@"testMode"]) {
            [[Kiip sharedInstance] setTestMode:[[info objectForKey:@"testMode"] boolValue]];
        }
        
        void (^handler)(KPPoptart *, NSError *) = ^(KPPoptart *poptart, NSError *error) {
            if (error) {
                [self.delegate nativeCustomEvent:self didFailToLoadAdWithError:MPNativeAdNSErrorForInvalidAdServerResponse(@"Invalid Server Response")];
            }
            
            // Since we've implemented this block, Kiip will no longer show the poptart automatically
            poptart.delegate = self;
            
            if (poptart.modal) {
                poptart.modal.delegate = self;
            }
            [poptart showNativeRewardView:self.nativeRewardView];
        };
        [[Kiip sharedInstance] saveMoment:[info objectForKey:@"momentId"] withCompletionHandler:handler];
    }

}


@end
