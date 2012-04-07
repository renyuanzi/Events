//
//  einSwitch003AppDelegate.h
//  einSwitch003
//
//  Created by Olivia Bornstein on 3/30/12.
//  Copyright 2012 Hoover Middle School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface einSwitch003AppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
	UITabBarController *tabBarController;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

