//
//  M2AppDelegate.m
//  m2048
//
//  Created by Danqing on 3/16/14.
//  Copyright (c) 2014 Danqing. All rights reserved.
//

#import "M2AppDelegate.h"
#import "Amplitude.h"
#import "AMPRevenue.h"

@implementation M2AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [Amplitude instance].trackingSessionEvents = YES;
  [[Amplitude instance] initializeApiKey:@"cd6312957e01361e6c876290f26d9104"];

    [Amplitude instanceWithName:@"app2"].trackingSessionEvents = YES;
    [[Amplitude instanceWithName:@"app2"] initializeApiKey:@"c6fa6b27f515fb3f0e5ece6caf86027b"];
    [[Amplitude instanceWithName:@"app2"] setMinTimeBetweenSessionsMillis:5000];

    [Amplitude instanceWithName:@"app3"].trackingSessionEvents = YES;
    [[Amplitude instanceWithName:@"app3"] initializeApiKey:@"c6fa6b27f515fb3f0e5ece6caf86027b"];
    [[Amplitude instanceWithName:@"app3"] setMinTimeBetweenSessionsMillis:1000];

    [Amplitude instanceWithName:@"app16"].trackingSessionEvents = YES;
    [[Amplitude instanceWithName:@"app16"] initializeApiKey:@"c6fa6b27f515fb3f0e5ece6caf86027b"];
    [[Amplitude instanceWithName:@"app16"] setMinTimeBetweenSessionsMillis:1000];
    [[Amplitude instanceWithName:@"app16"] logEvent:@"logging event on app 16"];

    AMPRevenue *revenue = [[[[AMPRevenue revenue] setProductIdentifier:@"prod.productIdentifier"] setPrice:[NSNumber numberWithDouble:-55.99]] setQuantity:10];
    [[revenue setRevenueType:@"lost revenue"] setEventProperties:[NSDictionary dictionaryWithObject:@"Boston" forKey:@"city"]];
    NSString *receipt = @"cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc";
    [revenue setReceipt:[receipt dataUsingEncoding:NSUTF8StringEncoding]];
    [[Amplitude instance] logRevenueV2:revenue];
    [[Amplitude instance] setGroup:@"slick" groupName:@"deals"];


    NSDictionary *eventProperties = @{
        @"currency_0": @63,
        @"name": @"Gold",
        @"num_rarity_0": @9,
        @"num_rarity_1": @2,
        @"num_rarity_2": @0,
        @"num_rarity_3": @0,
        @"num_rarity_stacks_0": @2,
        @"num_rarity_stacks_1": @1,
        @"num_rarity_stacks_2": @0,
        @"num_rarity_stacks_3": @0,
        @"num_total_cards": @11,
        @"oid": @"150,1,1",
        @"rank": @1,
        @"rewards": @"63x 1,0,0, 2x 42,201,0, 6x 42,200,0, 3x 42,200,0"
    };
    [[Amplitude instance] logEvent:@"test event properties" withEventProperties:eventProperties];

  // Add action for remind later.
  UIMutableUserNotificationAction *laterAction = [[UIMutableUserNotificationAction alloc] init];
  [laterAction setIdentifier:@"later_action_id"];
  [laterAction setTitle:@"Later..."];
  [laterAction setActivationMode:UIUserNotificationActivationModeBackground];

  // Add action for play now.
  UIMutableUserNotificationAction *playAction = [[UIMutableUserNotificationAction alloc] init];
  [playAction setIdentifier:@"play_action_id"];
  [playAction setTitle:@"Play Now!"];
  [playAction setActivationMode:UIUserNotificationActivationModeForeground];

  UIMutableUserNotificationCategory* category = [[UIMutableUserNotificationCategory alloc] init];
  [category setIdentifier:@"reminder_category_id"];
  [category setActions:@[laterAction, playAction] forContext:UIUserNotificationActionContextDefault];
  NSSet* categories = [NSSet setWithArray:@[category]];

  NSUInteger types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge;
  if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
    NSLog(@"Requesting permission for push notifications..."); // iOS 8
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [UIApplication.sharedApplication registerUserNotificationSettings:settings];
  } else {
    NSLog(@"Registering device for push notifications..."); // iOS 7 and earlier
    [UIApplication.sharedApplication registerForRemoteNotificationTypes:types];
  }

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[Amplitude instance] logEvent:@"ENTER BACKGROUND"];
  [self sendReminderNotification:5];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}


#pragma mark - Push Notifications

- (void)sendReminderNotification:(long)delay
{
  // Schedule reminder local notification.
  long score = (long)[Settings integerForKey:@"Best Score"];
  UILocalNotification *localNotification = [[UILocalNotification alloc] init];
  localNotification.alertBody = [NSString stringWithFormat:@"You got all the way to %ld points. Play again and go higher!", score];
  localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
  localNotification.category = @"reminder_category_id";
  localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:delay];
  localNotification.timeZone = [NSTimeZone defaultTimeZone];
  [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)application:(UIApplication *)application
        didRegisterUserNotificationSettings:(UIUserNotificationSettings *)settings
{
    NSLog(@"Registering device for push notifications..."); // iOS 8
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application
        didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)token
{
    NSLog(@"Registration successful, bundle identifier: %@, device token: %@",
          [NSBundle.mainBundle bundleIdentifier], token);
}

- (void)application:(UIApplication *)application
        didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Failed to register: %@", error);
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
        forRemoteNotification:(NSDictionary *)notification completionHandler:(void(^)())completionHandler
{
    NSLog(@"Received push notification: %@, identifier: %@", notification, identifier); // iOS 8
    [[Amplitude instance] initializeApiKey:@"cd6312957e01361e6c876290f26d9104"];
    [[Amplitude instance] logEvent:@"Opened Remote Notification"];
    [[Amplitude instance] regenerateDeviceId];

    completionHandler();
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
        forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler
{
  if ([notification.category isEqualToString:@"reminder_category_id"])
  {
    [[Amplitude instance] initializeApiKey:@"cd6312957e01361e6c876290f26d9104" userId:nil];
    [[Amplitude instance] logEvent:@"Local Notification Action" withEventProperties:@{@"Action": identifier}];

    if ([identifier isEqualToString:@"later_action_id"])
    {
      [self sendReminderNotification:10];
    }
    else if ([identifier isEqualToString:@"play_action_id"])
    {
      NSLog(@"Play now was pressed");
    }
  }

  completionHandler();
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
        fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler
{
    NSLog(@"Received push notification: %@ %ld", userInfo[@"aps"], (long)application.applicationState); // iOS 7 and earlier
}

@end
