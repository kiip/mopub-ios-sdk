//
//  KPNativeAdapter.h
//  MoPubSampleApp
//
//  Created by encore on 06/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>
#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#else
#import "MPNativeAdAdapter.h"
#endif

@interface KPNativeAdapter : NSObject<MPNativeAdAdapter>

@property (nonatomic, weak) id<MPNativeAdAdapterDelegate> delegate;

- (instancetype)initWithNativeReward:(NSDictionary *)adProps;

@end
