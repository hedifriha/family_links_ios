//
//  TodayViewController.m
//  familyLinksWidget
//
//  Created by familyLinks on 01/01/2016.
//  Copyright © 2016 Family-Tree-4SIM4. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(self.preferredContentSize.width,165);
    self.preferredContentSize = CGSizeMake(0, 44);
    // Initialize Parse.
    [Parse setApplicationId:@"NULJ74YbTTSQNw3kLlgchZngdINgb8cDfcOMqEAh"
                  clientKey:@"ip5rrLANHQ5vzCMno73JR1j19ANXLBHjQDnV6ekt"];
    
    //[Parse enableLocalDatastore];
    // [Optional] Track statistics around application opens.
    PFUser *user = [PFUser currentUser];
    NSString *nn=user.username;
    NSLog(@"name %@",nn);
    
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError*error)
     {
         if (!error) {
             _widgetLabel.text =[NSString stringWithFormat:@"%lu",(unsigned long)objects.count];
         } else {
             // Log details of the failure
             NSLog(@"Error: %@ %@", error, [error userInfo]);
         }
     }];

    
    
    
    NSLog(@"ksdjfhksdjfhskdjfhskfjhfkjhskj");
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
