//
//  addpersonController.h
//  Know My Family
//
//  Created by FamilyLinks on 19/11/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DBManager.h"
#import "UUDatePicker.h"
#import "RegisterController2.h"
#import "tableFamilleController.h"
#import "SingletonClass.h"

@interface addpersonController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UUDatePickerDelegate>
{
    UIImagePickerController *picker;
    UIImage *image;
}

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *lname;
@property (weak, nonatomic) IBOutlet UITextField *dob;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *job;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UIImageView *Image1;
@property (strong, nonatomic) IBOutlet UIImageView *imagedata;
@property (strong, nonatomic) IBOutlet UITextField *confirmpass;
@property(strong,nonatomic) UIStoryboard* main;

@property (weak, nonatomic) IBOutlet UIButton *upload;
@property (weak, nonatomic) IBOutlet UITextField *pass;
- (IBAction)LoadImage:(id)sender ;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)cameraButton:(UIButton *)sender;

- (IBAction)next:(id)sender;
@property(strong,nonatomic) NSArray* myarray3;
@property(nonatomic) DBManager* DB;
@end
