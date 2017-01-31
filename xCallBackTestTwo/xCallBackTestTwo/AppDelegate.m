//
//  AppDelegate.m
//  xCallBackTestTwo
//
//  Created by Harman on 18/01/17.
//  Copyright © 2017 Harman. All rights reserved.
//

#import "AppDelegate.h"
#import "IACManager.h"
#import "KNaModel.h"
#import "ViewController.h"
#import "IACClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {  
    // Override point for customization after application launch.
    [IACManager sharedManager].callbackURLScheme = @"iamtestTwo";
    [application setStatusBarHidden:NO];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    [self handleAdd];
    [self handleFetch];
    return YES;
}
    
    
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"hello");
    return [[IACManager sharedManager] handleOpenURL:url];
}
    
    
    
-(void)handleAdd{
    [[IACManager sharedManager]handleAction:@"add" withBlock:^(NSDictionary *inputParameters, IACSuccessBlock success, IACFailureBlock failure) {
        if (success) {
            KNaModel *model = [[KNaModel alloc] init];
            model.potassium = [inputParameters objectForKey:@"potassium"];
            model.sodium = [inputParameters objectForKey:@"sodium"];
            
            [[NSUserDefaults standardUserDefaults] setObject:model.potassium forKey:@"potassium"];
            [[NSUserDefaults standardUserDefaults] setObject:model.sodium forKey:@"sodium"];
            NSLog(@"Success123 ");

        }
    }];
    
}

-(void)handleFetch{
    [[IACManager sharedManager]handleAction:@"fetch" withBlock:^(NSDictionary *inputParameters, IACSuccessBlock success, IACFailureBlock failure) {
        if (success) {
            [[NSUserDefaults standardUserDefaults] setObject:[inputParameters valueForKey:@"potassium"] forKey:@"fetchedPotassium"];
            [[NSUserDefaults standardUserDefaults] setObject:[inputParameters valueForKey:@"sodium"] forKey:@"fetchedSodium"];
            NSLog(@"Success123 ");
            
        }
    }];
    
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
