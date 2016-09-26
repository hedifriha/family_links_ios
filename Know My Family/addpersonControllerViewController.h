//
//  addpersonControllerViewController.h
//  Family2
//
//  Created by hedi friha on 11/11/2015.
//  Copyright © 2015 hedi friha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface addpersonControllerViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *fname;
@property (weak, nonatomic) IBOutlet UITextField *lname;
@property (weak, nonatomic) IBOutlet UITextField *dob;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)addperson:(id)sender;


@end
