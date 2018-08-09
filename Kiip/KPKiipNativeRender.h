//
//  KPKiipNativeRender.h
//  MoPubSampleApp
//
//  Created by encore on 06/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>
#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#else
#import "MPNativeAdRenderer.h"
#import "MPNativeAdRendererSettings.h"
#endif

@class MPNativeAdRendering;
@class MPNativeAdRendererConfiguration;

@interface KPKiipNativeRender : NSObject <MPNativeAdRendererSettings>

@property(nonatomic, readwrite, copy) MPNativeViewSizeHandler viewSizeHandler;

+ (MPNativeAdRendererConfiguration *)rendererConfigurationWithRendererSettings:(id<MPNativeAdRendererSettings>)rendererSettings;

@end
