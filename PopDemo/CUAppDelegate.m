//
//  CUAppDelegate.m
//  PopDemo
//
//  Created by yuguang on 7/5/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUAppDelegate.h"
#import "CUHomeViewController.h"
#import "FBTweakShakeWindow.h"

@implementation CUAppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[FBTweakShakeWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  self.window.rootViewController = [CUHomeViewController new];

  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
