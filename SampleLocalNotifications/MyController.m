//
//  MyController.m
//  SampleLocalNotifications
//
//  Created by Peter Chen on 1/7/14.
//  Copyright (c) 2014 Peter Chen. All rights reserved.
//

#import "MyController.h"

#define kScheduleNotificationSecondsFromNow 3

@interface MyController ()

@end

@implementation MyController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Local Notifications";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10, 70, 300, 44);
    [button setTitle:[NSString stringWithFormat:@"Set alarm for %d seconds from now", kScheduleNotificationSecondsFromNow] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)_buttonTapped {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:kScheduleNotificationSecondsFromNow];
    localNotification.alertBody = @"Some Alert Body";
    localNotification.alertAction = @"Some Action Title";
    localNotification.userInfo = @{ @"someUserInfoKey" : @"someUserInfoValue" };
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Local Notification Set" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
