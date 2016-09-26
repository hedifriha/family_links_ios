//
//  addpersonControllerViewController.m
//  Family2
//
//  Created by hedi friha on 11/11/2015.
//  Copyright © 2015 hedi friha. All rights reserved.
//

#import "addpersonControllerViewController.h"

@interface addpersonControllerViewController ()

@end

@implementation addpersonControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(IBAction)addperson:(id)sender
{
    NSString *fnameString = _fname.text;
    NSString *lnameString= _lname.text;
    NSString *dobString = _dob.text;
    NSString *genderString = _gender.text;
    NSString *emailString = _email.text;
    NSString *passString = _password.text;
    
    PFObject *newPerson = [PFObject objectWithClassName:@"Person"];
    newPerson[@"FirstName"] = fnameString;
    newPerson[@"LastName"] = lnameString;
    newPerson[@"DOB"] = dobString;
    newPerson[@"Gender"] = genderString;
    newPerson[@"Email"] = emailString;
    newPerson[@"Password"] = passString;
    
    [newPerson saveInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
        
        if (succeeded == YES) {
           // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"success" message:@"your new person has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            // [alert show];
              UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"success"
                                        message:@"your person has been saved"
                                      preferredStyle:UIAlertControllerStyleAlert
                                    ];
            
            
            
          [self presentViewController:alert animated:YES completion:nil];
        } else {
         //   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:@"your new has not been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //        [alert show];
            UIAlertController * alert=   [UIAlertController
                                        alertControllerWithTitle:@"error"
            
                                     message:@"your person has not been saved"
            
                                    preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
    
    
}
@end

