//
//  KPNativeAdapter.m
//  MoPubSampleApp
//
//  Created by encore on 06/08/18.
//  Copyright © 2018 MoPub. All rights reserved.
//

#import "KPNativeAdapter.h"

@implementation KPNativeAdapter

@synthesize defaultActionURL;
@synthesize properties;

- (instancetype)initWithNativeReward:(NSDictionary *)adProps{
    
    
}

- (void)displayContentForURL:(NSURL *)URL rootViewController:(UIViewController *)controller
{
    if (!controller) {
        return;
    }
    
    if (!URL || ![URL isKindOfClass:[NSURL class]] || ![URL.absoluteString length]) {
        return;
    }

}

//- (UIView *)privacyInformationIconView {
//    return _adChoicesView;
//}
//
//- (BOOL)enableThirdPartyClickTracking {
//    return YES;
//}

@end
