//
//  AppDelegate.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[HomeViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
