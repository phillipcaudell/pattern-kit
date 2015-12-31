//
//  AppDelegate.m
//  PatternKitDemo
//
//  Created by Phillip Caudell on 07/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[RootViewController new]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
