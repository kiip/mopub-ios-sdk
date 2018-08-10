//
//  KPKiipBannerCustomEvent.h
//  MoPubSampleApp
//
//  Created by encore on 10/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
#import <MoPubSDKFramework/MoPub.h>
#else
#import "MPBannerCustomEvent.h"
#import "MoPub.h"
#endif

@interface KPKiipMrectBannerCustomEvent : MPBannerCustomEvent

/**
 Initializes a Kiip object with the specified values.
 
 @param appKey The Application's key.
 @param appSecret The Application's secret.
 */
+ (void)setAppKey:(NSString *)appKey andSecret:(NSString *)appSecret;

@end
