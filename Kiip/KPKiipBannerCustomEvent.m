//
//  KPKiipBannerCustomEvent.m
//  MoPubSampleApp
//
//  Created by encore on 10/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#import "KPKiipBannerCustomEvent.h"
#import <KiipSDK/KiipSDK.h>

@interface KPKiipBannerCustomEvent ()<KPPoptartDelegate, KPModalDelegate>
@property (strong, nonatomic) KPNativeRewardView *nativeRewardView;
@end


@implementation KPKiipBannerCustomEvent


- (id)init
{
    self = [super init];
    if (self)
    {
        self.nativeRewardView = [[KPNativeRewardView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

static KPKiipBannerCustomEvent *sInstance = nil;

+ (KPKiipBannerCustomEvent *)sharedInstance
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
}

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info
{
    
    if ([Kiip sharedInstance] == nil && info != nil) {
        if ([info objectForKey:@"appKey"] && [info objectForKey:@"appSecret"]) {
            [Kiip initWithAppKey:[info objectForKey:@"appKey"] andSecret:[info objectForKey:@"appSecret"]];
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
        
        if ([info objectForKey:@"momentId"]) {
            void (^handler)(KPPoptart *, NSError *) = ^(KPPoptart *poptart, NSError *error) {
                if (error) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    [alert show];
                }
                
                poptart.delegate = self;
                
                if (poptart.modal) {
                    poptart.modal.delegate = self;
                }
                self.nativeRewardView.frame = CGRectMake(0, 0, 300, 250);
                [self.delegate bannerCustomEvent:self didLoadAd:self.nativeRewardView];
                [poptart showNativeRewardView:self.nativeRewardView];
                
            };
            [[Kiip sharedInstance] saveMoment:[info objectForKey:@"momentId"] withCompletionHandler:handler];
        }
    }
}

- (void) willPresentModal:(KPModal *)modal{
    [self.delegate bannerCustomEventWillBeginAction:self];
}

/**
 Tells the delegate that a Modal was dismissed.
 
 @param modal The Modal that was dismissed.
 */
- (void) didDismissModal:(KPModal *)modal {
    [self.delegate bannerCustomEventDidFinishAction:self];
}


@end
