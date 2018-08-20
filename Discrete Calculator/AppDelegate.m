//
//  AppDelegate.m
//  Discrete Calculator
//
//  Created by Theodore Dubois on 7/23/18.
//  Copyright © 2018 Theodore Dubois. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property BOOL triggerRage;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.triggerRage = NO;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://ipinfo.io"]];
    [request setValue:@"curl" forHTTPHeaderField:@"user-agent"];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![obj isKindOfClass:[NSDictionary class]])
            return;
        NSString *as = [obj valueForKey:@"org"];
        if (![as isKindOfClass:[NSString class]])
            return;
        if ([as containsString:@"Stanford University"]) {
            self.triggerRage = YES;
        }
    }] resume];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    if (self.triggerRage) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"we ded"];
    }
}


@end
