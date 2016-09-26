//
//  RegisterController2.h
//  Know My Family
//
//  Created by hedi friha on 10/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DBManager.h"
#import "RegisterController.h"
#import "UUDatePicker.h"
#import "shared_User.h"
@interface RegisterController2 : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UUDatePickerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *SpecifiedTime2;
@property (weak, nonatomic) IBOutlet UITextField *SpecifiedTime3;
@property (weak, nonatomic) IBOutlet UITextField *nameFather;

@property (weak, nonatomic) IBOutlet UITextField *dobf;
@property (weak, nonatomic) IBOutlet UITextField *jobf;
@property (weak, nonatomic) IBOutlet UIImageView *imagef;
@property (weak, nonatomic) IBOutlet UITextField *nameMother;
@property (weak, nonatomic) IBOutlet UITextField *LastNameMother;
@property (weak, nonatomic) IBOutlet UITextField *dobm;
@property (weak, nonatomic) IBOutlet UITextField *jobm;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UIButton *btnImgM;
@property (weak, nonatomic) IBOutlet UIButton *btnImgF;
@property (weak, nonatomic) IBOutlet UIButton *SignInBtn;

@property(nonatomic) int imageN;

- (IBAction)SignIn:(id)sender;

- (IBAction)LoadImagef:(id)sender ;

- (IBAction)LoadImagem:(id)sender ;

@end
