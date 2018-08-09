//
//  KPKiipNativeCustomEvent.h
//  MoPubSampleApp
//
//  Created by encore on 02/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//
#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#else
#import "MPNativeAd.h"
#import "MoPub.h"

#endif

#import <Foundation/Foundation.h>
#import <KiipSDK/KiipSDK.h>

@interface KPKiipNativeCustomEvent : MPNativeCustomEvent


+ (void)setAppKey:(NSString *)appKey andSecret:(NSString *)appSecret;

@end
