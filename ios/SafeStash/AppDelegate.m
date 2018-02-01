/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import <LinkKit/LinkKit.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  #if USE_CUSTOM_CONFIG
    [self setupPlaidLinkWithCustomConfiguration];
  #else
    [self setupPlaidLinkWithSharedConfiguration];
  #endif

  NSURL *jsCodeLocation;
  
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"SafeStash"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

#pragma mark Plaid Link setup with shared configuration from Info.plist
- (void)setupPlaidLinkWithSharedConfiguration {
  // <!-- SMARTDOWN_SETUP_SHARED -->
  // With shared configuration from Info.plist
  [PLKPlaidLink setupWithSharedConfiguration:^(BOOL success, NSError * _Nullable error) {
    if (success) {
      // Handle success here, e.g. by posting a notification
      NSLog(@"Plaid Link setup was successful");
      [[NSNotificationCenter defaultCenter] postNotificationName:@"PLDPlaidLinkSetupFinished" object:self];
    }
    else {
      NSLog(@"Unable to setup Plaid Link due to: %@", [error localizedDescription]);
    }
  }];
  // <!-- SMARTDOWN_SETUP_SHARED -->
}


#pragma mark Plaid Link setup with custom configuration
- (void)setupPlaidLinkWithCustomConfiguration {
  
  // <!-- SMARTDOWN_SETUP_CUSTOM -->
  // With custom configuration
  PLKConfiguration* linkConfiguration;
  @try {
    linkConfiguration = [[PLKConfiguration alloc] initWithKey:@"<#YOUR_PLAID_PUBLIC_KEY#>"
                                                          env:PLKEnvironmentDevelopment
                                                      product:PLKProductAuth];
    linkConfiguration.clientName = @"Link Demo";
    [PLKPlaidLink setupWithConfiguration:linkConfiguration completion:^(BOOL success, NSError * _Nullable error) {
      if (success) {
        // Handle success here, e.g. by posting a notification
        NSLog(@"Plaid Link setup was successful");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PLDPlaidLinkSetupFinished" object:self];
      }
      else {
        NSLog(@"Unable to setup Plaid Link due to: %@", [error localizedDescription]);
      }
    }];
  } @catch (NSException *exception) {
    NSLog(@"Invalid configuration: %@", exception);
  }
  // <!-- SMARTDOWN_SETUP_CUSTOM -->
}

@end
