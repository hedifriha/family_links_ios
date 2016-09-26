//
//  PrincipalController.m
//  Know My Family
//
//  Created by yosemite on 11/5/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "PrincipalController.h"
#import "LeftMenuViewController.h"

@interface PrincipalController ()

@end

@implementation PrincipalController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

@end
