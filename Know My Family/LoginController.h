//
//  LoginController.h
//  Know My Family
//
//  Created by yosemite on 11/5/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DBManager.h"
#import "PrincipalController.h"
#import "person.h"


@interface LoginController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
- (IBAction)loginButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *logButton;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property(strong,nonatomic) NSArray* myarray;
@property(strong,nonatomic) NSArray* dbarray;
@property(nonatomic) DBManager* DB;
@property(strong,nonatomic) NSMutableArray *persons2;

@end
