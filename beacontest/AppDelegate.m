//
//  AppDelegate.m
//  beacontest
//
//  Created by Cay-Eric Schimanski on 25.02.18.
//  Copyright © 2018 endform.net. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    CBPeripheralManager * _peripheralManager;
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application 
    _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];

    
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - CBPeripheralManagerDelegate
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state == CBManagerStatePoweredOn) 
    {
        NSLog(@"-- peripheral state changed: powered on");
        
        // comment out for custom beacon - no iBeacon compatible
//        NSDictionary *advertisingData = @{CBAdvertisementDataLocalNameKey:@"BLE Beacon Test", 
//                                          CBAdvertisementDataServiceUUIDsKey:@[[CBUUID UUIDWithString:@"123F0000-503E-4C75-BA94-3148F18D941E"]]};
        
        // comment out for iBeacon compatible - no background transmitting
        NSUUID * proximityID = [[NSUUID alloc]  initWithUUIDString:@"713D0000-503E-4C75-BA94-3148F18D941E"]; 
        CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityID major:1 minor:2 identifier:@"myBeacon"];
        NSDictionary * advertisingData = [beaconRegion peripheralDataWithMeasuredPower:nil];

        [_peripheralManager startAdvertising:advertisingData];
    }
}

- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error
{
    if (error)
        NSLog(@"error starting advertising: %@", [error localizedDescription]);
    else
        NSLog(@"did start advertising");
}


@end
