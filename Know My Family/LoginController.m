//
//  LoginController.m
//  Know My Family
//
//  Created by yosemite on 11/5/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "LoginController.h"
#import "HomeController.h"
#import "LeftMenuViewController.h"
#import "shared_User.h"
#import "Reachability.h"

@interface LoginController ()

@end
person *pers1;
int endParse;
@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    pers1 =[[person alloc]init];
    endParse=0;
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];

    if (networkStatus == NotReachable) {
        
        NSLog(@"Device is not connected to the internet");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!! "
                                                        message:@"Your are not Connected"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        _logButton.hidden=true;
        
    }else{
        NSLog(@"Device is connected to the internet with WIFI");
        
    }

    // Do any additional setup after loading the view.
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"fls.sqlite"];
  //  _emailField.delegate = self;
  //  _passField.delegate = self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if ((theTextField == _emailField)||(theTextField == _passField)){
        [theTextField resignFirstResponder];
    }
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(id)sender {
    _logButton.enabled=NO;
    [PFUser logInWithUsernameInBackground:_emailField.text password:_passField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            [shared_User setUser:user];
                                            [shared_User setWasIn:@"login"];
                                            PFQuery *query = [PFQuery queryWithClassName:@"Person"];
                                            [query whereKey:@"User" equalTo:user];
                                            [query getFirstObjectInBackgroundWithBlock:^(PFObject *person, NSError *error) {
                                                if (!error) {
                                                    // The find succeeded.
                                                    //NSLog(@"Successfully retrieved %d scores.", objects.count);
                                                    // Do something with the found objects
                                                    //NSString *aa=person[@"FatherP"].objectId;
                                                    [shared_User setIdUser:person.objectId];
                                                    [shared_User setLName:person[@"LastName"]];
                                                    [shared_User setGender:person[@"Gender"]];
                                                    [shared_User setName:person[@"FirstName"]];
                                                    [shared_User setGender:person[@"Gender"]];
                                                    [shared_User setCoutry:person[@"Country"]];
                                                    [shared_User setJob:person[@"Job"]];
                                                    [shared_User setEmail:person[@"Email"]];
                                                    [shared_User setFather:person[@"Father"]];
                                                    [shared_User setMother:person[@"Mother"]];
                                                    [shared_User setSpouse:person[@"Spouse"]];
                                                    //[shared_User setFatherId:person[@"FatherP"]];
                                                    
                                                    PFObject *fatherP = person[@"FatherP"];
                                                    [shared_User setFatherId:fatherP.objectId];
                                                    
                                                    PFObject *motherP = person[@"MotherP"];
                                                    [shared_User setMotherId:motherP.objectId];
                                                    
                                                    PFObject *spouseP = person[@"SpouseP"];
                                                    [shared_User setSpouseId:spouseP.objectId];
                                                    
                                                    pers1.personId=person.objectId;
                                                    
                                                        pers1.name=person[@"FirstName"];
                                                        pers1.lastName=person[@"LastName"];
                                                        //P.email=pers1[@"Email"];
                                                        pers1.dob=person[@"DOB"];
                                                        pers1.gender=person[@"Gender"];
                                                        pers1.job=person[@"Job"];
                                                        pers1.coutry=person[@"Country"];
                                                        PFObject *fatherP2 = person[@"FatherP"];
                                                        pers1.fatherId=fatherP2.objectId;
                                                        PFObject *motherP2 = person[@"MotherP"];
                                                        pers1.motherId=motherP2.objectId;
                                                        PFObject *spouseP2 = person[@"SpouseP"];
                                                        pers1.spouseId=spouseP2.objectId;
                                                        PFFile *imageP = person[@"image"];
                                                        pers1.email=@"";
                                                        [imageP getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                                                            if (!error) {
                                                                dispatch_async(dispatch_get_main_queue(), ^ {
                                                                    pers1.imageP=data;
                                                                });
                                                            }
                                                        }];
                                                        pers1.email=person[@"Email"];
                                                            [shared_User setCurrent:pers1];
                                                            [shared_User setSelected:pers1];
                                                    
                                                    
                                                    NSLog(@"fatherrr %@",[shared_User getFatherId]);
                                                        
                                                    

                                                } else {
                                                    // Log details of the failure
                                                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                                                }
                                            }];
                                            UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                            
                                            LoginController *vc =[mainS instantiateViewControllerWithIdentifier:@"Home"];
                                            [self.navigationController pushViewController: vc animated:YES];
                                        } else {
                                            // The login failed. Check error to see why.
                                             _messageLabel.text=@"Invalid Username/Password";
                                            
                                        }
                                    }];
    _logButton.enabled=YES;

//
//        NSLog(@"Name %@",ID);
//    
//    }
//    else{ _messageLabel.text=@"Invalid E-mail/pass";};
   
}
@end
