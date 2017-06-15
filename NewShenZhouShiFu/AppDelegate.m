//
//  AppDelegate.m
//  NewShenZhouShiFu
//
//  Created by Admin on 2017/6/7.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "BaseNavViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BaseTabBarController *tabBarVC=[[BaseTabBarController alloc]init];
    tabBarVC.delegate=self;
    
    self.window.rootViewController=tabBarVC;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}








- (void)applicationWillResignActive:(UIApplication *)application {
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
