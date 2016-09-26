//
//  AppDelegate.h
//  Know My Family
//
//  Created by Family-Tree-4SIM4 on 17/10/2015.
//  Copyright (c) 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import <Parse/Parse.h>
#import "DBManager.h"
#import "person.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) NSArray* myarray;
@property(strong,nonatomic) NSArray* dbarray;
@property(nonatomic) DBManager* DB;
@property(strong,nonatomic) NSMutableArray *persons2;


@end

