//
//  ProfileController.h
//  Know My Family
//
//  Created by yosemite on 11/10/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UPStackMenu.h"
#import "SlideNavigationController.h"
@interface ProfileController : UIViewController<UPStackMenuDelegate,SlideNavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lastname;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dob;
@property (weak, nonatomic) IBOutlet UILabel *fathername;
@property (weak, nonatomic) IBOutlet UILabel *mothername;

@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *country;

@end
