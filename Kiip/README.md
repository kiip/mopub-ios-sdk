# Integrating Kiip iOS SDK with MoPub iOS SDK

Follow the integration documentation provided by MoPub on Integrating MoPub iOS SDK into the iOS App.

## Kiip Interstitial Instruction

1. You can download Kiip forked MoPub iOS SDK [here](https://github.com/kiip/mopub-ios-sdk). 

2. All the Kiip SDK required frameworks are in the Kiip folder. In case if you are wondering whether the Kiip SDK is up to date, you can check the version of Kiip iOS SDK [here](https://docs.kiip.me).

3.  Since Kiip SDK 3.0.0+, there are two dependent frameworks you need to add - KIIPMoatMobileAppKit and XIDLibrary. Be sure to follow the instructions down below.
 - In `Build Phases`, verify that `KiipSDK.framework`, `KIIPMoatMobileAppKit.framework`, and `XIDLibrary.framework` are in the `Link Binary with Libraries` and the `KiipSDKResources.bundle` in `Copy Bundle Resources` section
 -  Go to app settings and click the `Build Settings` tab, and navigate to `Build Options` and change `Always Embed Swift Standard Libraries` to Yes.
 -  Go to the `General` tab, and navigate to `Embedded Binaries` and add the `XIDLibrary.framework`.

4. Login to https://app.mopub.com, and click on the "Apps" category and create New App or select existing apps which you would like to add the Kiip engine.

5. Click "New ad unit" and you can Name it as "Kiip Reward Unit" and choose a Device type and Format it as "Fullscreen" and set Layout to your preference and click save.

6. It will open up a "Code integration" page and copy the Ad unit ID that MoPub has provided to you.

7. Navigate to "Networks" and click on "Add a Network" to add "Custom Native Network". Provide a title as "Kiip Network", make sure the App is listed in "Set Up Your Inventory" section.

8. Add "KPKiipInterstitialCustomEvent" in "Custom Event Class" section.

9. Add {"appKey":"<KIIP_APP_KEY>",
        "appSecret":"<KIIP_APP_SECRET>",
        "momentId":"<KIIP_MOMENT_ID>",  
        "testMode":<true/false>} in "Custom Event Class Data" section. That's it you all done.
        
        Note** There are few more parameters like userId, gender, birthday, and etc.that you can set. Check out `KPKiipInterstitialCustomEvent.m` file to see what they are.  **

10. Use the MoPub Ad unit Id and follow MoPub code integration guide.
 
 
 ## Kiip Native(Mrect) Instruction
 
 1. You can download Kiip forked MoPub iOS SDK [here](https://github.com/kiip/mopub-ios-sdk). 
 
 2. All the Kiip SDK required frameworks are in the Kiip folder. In case if you are wondering whether the Kiip SDK is up to date, you can check the version of Kiip iOS SDK [here](https://docs.kiip.me).
 
 3.  Since Kiip SDK 3.0.0+, there are two dependent frameworks you need to add - KIIPMoatMobileAppKit and XIDLibrary. Be sure to follow the instructions down below.
 - In `Build Phases`, verify that `KiipSDK.framework`, `KIIPMoatMobileAppKit.framework`, and `XIDLibrary.framework` are in the `Link Binary with Libraries` and the `KiipSDKResources.bundle` in `Copy Bundle Resources` section
 -  Go to app settings and click the `Build Settings` tab, and navigate to `Build Options` and change `Always Embed Swift Standard Libraries` to Yes.
 -  Go to the `General` tab, and navigate to `Embedded Binaries` and add the `XIDLibrary.framework`.
 
 4. Login to https://app.mopub.com, and click on the "Apps" category and create New App or select existing apps which you would like to add the Kiip engine.
 
 5. Click "New ad unit" and you can Name it as "Kiip Reward Unit" and choose a Device type and Format it as "Medium (300 x 250)" and set refresh interval to 0 second and click save.
 
 6. It will open up a "Code integration" page and copy the Ad unit ID that MoPub has provided to you.
 
 7. Navigate to "Networks" and click on "Add a Network" to add "Custom Native Network". Provide a title as "Kiip Network", make sure the App is listed in "Set Up Your Inventory" section.
 
 8. Add `KPKiipMrectBannerCustomEvent` in "Custom Event Class" section.
 
 9. Add {"appKey":"<KIIP_APP_KEY>",
 "appSecret":"<KIIP_APP_SECRET>",
 "momentId":"<KIIP_MOMENT_ID>",  
 "testMode":<true/false>} in "Custom Event Class Data" section. That's it you all done.
 
 Note** There are few more parameters like userId, gender, birthday, and etc.that you can set. Check out `KPKiipMrectBannerCustomEvent.m` file to see what they are.  **
 
 10. Use the MoPub Ad unit Id and follow MoPub code integration guide.
 
Congratulations and Thank you for adding Kiip Network





  
