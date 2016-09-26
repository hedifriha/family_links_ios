//
//  addpersonController.m
//  Know My Family
//
//  Created by FamilyLinks on 19/11/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "RegisterController.h"
#import "shared_User.h"


@interface addpersonController ()
@property (weak, nonatomic) IBOutlet UITextField *SpecifiedTime;
@end

@implementation addpersonController
NSString* genderValue;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _main =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // Do any additional setup after loading the view.
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"familyLinks.sqlite"];
    _Image1.image=[UIImage imageNamed: @"profilPhoto"];
    // NSData *data = UIImageJPEGRepresentation(_Image1.image, 1.0);
    
    _username.delegate = self;
    _name.delegate = self;
    _lname.delegate = self;
    _dob.delegate = self;
    _email.delegate = self;
    _job.delegate = self;
    _country.delegate = self;
    _pass.delegate = self;
    _confirmpass.delegate = self;
    
    
    NSDate *now = [NSDate date];
    //block
    NSArray *txfAry = @[self.dob];
    for (int i=0; i<txfAry.count; i++) {
        
        UITextField *field = txfAry[i];
        
        UUDatePicker *datePicker
        = [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                 PickerStyle:1
                                 didSelected:^(NSString *year,
                                               NSString *month,
                                               NSString *day,
                                               NSString *hour,
                                               NSString *minute,
                                               NSString *weekDay) {
                                     field.text = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
                                 }];
        field.inputView = datePicker;
    }
    
    //delegate
    UUDatePicker *datePicker= [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 0, 0)
                                                        Delegate:self
                                                     PickerStyle:UUDateStyle_YearMonthDay];
    datePicker.ScrollToDate = now;
    datePicker.maxLimitDate = now;
    datePicker.minLimitDate = [now dateByAddingTimeInterval:-111111111];
    _SpecifiedTime.inputView = datePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker:(UUDatePicker *)datePicker
                year:(NSString *)year
               month:(NSString *)month
                 day:(NSString *)day

{
    _SpecifiedTime.text = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if ((theTextField == _name)||(theTextField == _lname)||(theTextField == _email)||(theTextField == _job)||(theTextField == _country)||(theTextField == _pass)||(theTextField == _confirmpass)||(theTextField == _username)) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

//hide keyboard on touch out
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)cameraButton:(UIButton *)sender {
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
}
-(void)imagePickerController:(nonnull UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info
{
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [_Image1 setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (IBAction)next:(id)sender {
    NSLog(@"nextStep");
    //||("" == _dob)||(theTextField == _job)
    if (_gender.selectedSegmentIndex == 0) {
        genderValue=@"Male";
        NSLog(@"/////////////gender male/////////////////// %@",genderValue);
    } else if(_gender.selectedSegmentIndex == 1) {
        genderValue=@"Female";
        NSLog(@"/////////////gender Female/////////////////// %@",genderValue);
    }
    if ([_name.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"incorrect Firstname"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_lname.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"incorrect Lastname"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_confirmpass.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Be sure of your password!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_country.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect country!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_pass.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect password!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_email.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect email!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_dob.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect date of birth!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else
    {
        //([_country  isEqual: @""])||(![_confirmpass  isEqual: _pass])) {
        //}
        PFObject *Person= [PFObject objectWithClassName:@"Person"];
        PFUser *user = [PFUser user];
        user.username = _username.text;
        user.password = _pass.text;
        user.email = _email.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {   // Hooray! Let them use the app now.
                Person[@"FirstName"] = _name.text;
                Person[@"LastName"] = _lname.text;
                Person[@"DOB"] = _dob.text;
                Person[@"Email"] = _email.text;
                Person[@"Gender"] = genderValue;
                Person[@"Job"] = _job.text;
                Person[@"Country"] = _country.text;
                Person[@"User"] = user;
                Person[@"FatherP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
                Person[@"MotherP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
                Person[@"SpouseP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
                NSData *imageData = UIImageJPEGRepresentation(_Image1.image, 0.5f);
                
                PFFile *imageFile = [PFFile fileWithName:@"imageazep.jpg" data:imageData];
                Person[@"image"] = imageFile;
                //int go=0;
                [Person saveInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
                    if (succeeded == YES) {
                        if(![Person isEqual:nil]){
                            
                            PFQuery* query  = [PFQuery queryWithClassName:@"Person"];
                            [query whereKey:@"FirstName" containsString:_name.text];
                            [query whereKey:@"LastName" containsString:_lname.text];
                            [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError *  error) {
                                if(!error){
                                    if(objects.count>0){
                                        for (PFObject *pers1 in objects) {
                                            person* P =[[person alloc]init];
                                            P.personId=pers1.objectId;
                                            P.name=pers1[@"FirstName"];
                                            P.lastName=pers1[@"LastName"];
                                            //P.email=pers1[@"Email"];
                                            P.dob=pers1[@"DOB"];
                                            P.gender=pers1[@"Gender"];
                                            P.job=pers1[@"Job"];
                                            P.coutry=pers1[@"Country"];
                                            PFObject *fatherP = pers1[@"FatherP"];
                                            P.fatherId=fatherP.objectId;
                                            PFObject *motherP = pers1[@"MotherP"];
                                            P.motherId=motherP.objectId;
                                            PFObject *spouseP = pers1[@"SpouseP"];
                                            P.spouseId=spouseP.objectId;
                                            PFFile *imageP = pers1[@"image"];
                                            [imageP getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                                                if (!error) {
                                                    dispatch_async(dispatch_get_main_queue(), ^ {
                                                        P.imageP=data;
                                                    });
                                                }
                                            }];
                                            [shared_User setWasIn:@"register1"];
                                            [shared_User setSelected:P];
                                            [shared_User setUser:user];
                                            [shared_User setNewUser:pers1];
                                            tableFamilleController *vc =[_main instantiateViewControllerWithIdentifier:@"Listed"];
                                            [self.navigationController pushViewController: vc animated:YES];return;
                                            
                                        }
                                    }else{
                                        RegisterController2 *vc =[_main instantiateViewControllerWithIdentifier:@"register2"];
                                        [self.navigationController pushViewController: vc animated:YES];
                                    }
                                }
                            }];
                        }
                        
                        
                    } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!!"
                                                                        message:errorString
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
                        [alert show];
                    }
                    
                }];
                
            } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!!"
                                                                message:errorString
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }];
        [shared_User setParsePerson:Person];
        
    }
}

    - (void)imagePickerController:(UIImagePickerController *)picker2
didFinishPickingImage:(UIImage *)image2 editingInfo:(NSDictionary *)editingInfo
    {
        _Image1.image = image2;
        [[picker2 parentViewController] dismissModalViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    
    - (IBAction)LoadImage:(id)sender {
        
        UIImagePickerController * picker2 = [[UIImagePickerController alloc] init];
        picker2.delegate=self;
        [picker2 setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
        [self presentViewController:picker2 animated:YES completion:Nil];
        
    }
    
    /*
     - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
     {
     
     [self dismissViewControllerAnimated:NO completion:nil];
     //.....
     }*/
    @end
