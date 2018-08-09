//
//  KPKiipNativeRender.m
//  MoPubSampleApp
//
//  Created by encore on 06/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#import "KPKiipNativeRender.h"
#import <KiipSDK/KiipSDK.h>
#import "KPNativeAdapter.h"

#if __has_include("MoPub.h")
#import "MPLogging.h"
#import "MPNativeAdAdapter.h"
#import "MPNativeAdConstants.h"
#import "MPNativeAdError.h"
#import "MPNativeAdRendererConfiguration.h"
#import "MPNativeAdRendererImageHandler.h"
#import "MPNativeAdRendering.h"
#import "MPNativeAdRenderingImageLoader.h"
#import "MPNativeView.h"
#import "MPStaticNativeAdRendererSettings.h"
#endif


@interface KPKiipNativeRender ()<MPNativeAdRendererImageHandlerDelegate>

/// Publisher adView which is rendering.
@property(nonatomic, strong) UIView<MPNativeAdRendering> *adView;

/// MPGoogleAdMobNativeAdAdapter instance.
@property(nonatomic, strong) KPNativeAdapter *adapter;

/// YES if adView is in view hierarchy.
@property(nonatomic, assign) BOOL adViewInViewHierarchy;

/// MPNativeAdRendererImageHandler instance.
@property(nonatomic, strong) MPNativeAdRendererImageHandler *rendererImageHandler;

/// Class of renderingViewClass.
@property(nonatomic, strong) Class renderingViewClass;

/// GADNativeAppInstallAdView instance.
@property (strong, nonatomic) KPNativeRewardView *nativeRewardView;

@end


@implementation KPKiipNativeRender

+ (MPNativeAdRendererConfiguration *)rendererConfigurationWithRendererSettings:(id<MPNativeAdRendererSettings>)rendererSettings{
    
    MPNativeAdRendererConfiguration *config = [[MPNativeAdRendererConfiguration alloc] init];
    config.rendererClass = [self class];
    config.rendererSettings = rendererSettings;
    config.supportedCustomEvents = @[@"KPKiipNativeCustomEvent"];

    return config;

}

- (instancetype)initWithRendererSettings:(id<MPNativeAdRendererSettings>)rendererSettings {
    if (self = [super init]) {
        MPStaticNativeAdRendererSettings *settings =
        (MPStaticNativeAdRendererSettings *)rendererSettings;
        _renderingViewClass = settings.renderingViewClass;
        _viewSizeHandler = [settings.viewSizeHandler copy];
        _rendererImageHandler = [MPNativeAdRendererImageHandler new];
        _rendererImageHandler.delegate = self;
    }
    
    return self;
}


- (UIView *)retrieveViewWithAdapter:(id<MPNativeAdAdapter>)adapter error:(NSError **)error {
    if (!adapter || ![adapter isKindOfClass:[KPNativeAdapter class]]) {
        if (error) {
            *error = MPNativeAdNSErrorForRenderValueTypeError();
        }
        
        return nil;
    }
    
    self.adapter = (KPNativeAdapter *)adapter;
    
    if ([self.renderingViewClass respondsToSelector:@selector(nibForAd)]) {
        self.adView = (UIView<MPNativeAdRendering> *)[
                                                      [[self.renderingViewClass nibForAd] instantiateWithOwner:nil options:nil] firstObject];
    } else {
        self.adView = [[self.renderingViewClass alloc] init];
    }
    
    self.adView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
        [self renderAppInstallAdViewWithAdapter:self.adapter];
//    } else {
//        [self renderContentAdViewWithAdapter:self.adapter];
//    }
//
    return self.adView;
}

- (void)renderAppInstallAdViewWithAdapter:(id<MPNativeAdAdapter>)adapter {
    
    self.nativeRewardView  = [[KPNativeRewardView alloc] initWithCGpoint:CGPointMake(20, 80) setViewType:FLUID_RECTANGLE];
    self.nativeRewardView.backgroundColor = [UIColor grayColor];
    [self.adView addSubview:self.nativeRewardView];

}


@end
