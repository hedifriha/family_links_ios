//
//  ProfileOtherController.h
//  Know My Family
//
//  Created by familyLinks on 17/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "person.h"

@interface ProfileOtherController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameAndLastName;
@property (strong, nonatomic) IBOutlet UILabel *job;
@property (strong, nonatomic) IBOutlet UILabel *coutry;
@property (strong, nonatomic) IBOutlet UILabel *dob;
//- (IBAction)back:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *image;
@end
