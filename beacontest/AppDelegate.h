//
//  AppDelegate.h
//  beacontest
//
//  Created by Cay-Eric Schimanski on 25.02.18.
//  Copyright © 2018 endform.net. All rights reserved.
//

#import <UIKit/UIKit.h>

// for custom beacon advertising
#import <CoreBluetooth/CoreBluetooth.h>

// for iBeacon advertising only
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CBPeripheralManagerDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

