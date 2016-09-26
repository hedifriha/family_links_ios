//
//  RegisterController2.m
//  Know My Family
//
//  Created by hedi friha on 10/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "RegisterController2.h"
#import "RegisterController.h"
#import "LoginController.h"
@class RegisterController;
@interface RegisterController2 ()

@end

@implementation RegisterController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dobf.delegate = self;
    _jobf.delegate = self;
    _nameMother.delegate = self;
    _LastNameMother.delegate = self;
    _dobm.delegate = self;
    _jobm.delegate = self;
    _imagem.image=[UIImage imageNamed: @"mother-1"];
    _imagef.image=[UIImage imageNamed: @"father-1"];
    
    NSDate *now = [NSDate date];
    //block
    //NSArray *txfAry = @[YMDHM,YMD,MDHM,HM,Max,Min];
    NSArray *txfAry2 = @[self.dobf];
    for (int i=0; i<txfAry2.count; i++) {
        
        UITextField *field2 = txfAry2[i];
        
        UUDatePicker *datePicker2
        = [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                 PickerStyle:1
                                 didSelected:^(NSString *year2,
                                               NSString *month2,
                                               NSString *day2,
                                               NSString *hour2,
                                               NSString *minute2,
                                               NSString *weekDay2) {
                                     field2.text = [NSString stringWithFormat:@"%@-%@-%@",year2,month2,day2];
                                 }];
        field2.inputView = datePicker2;
    }
    NSArray *txfAry3 = @[self.dobm];
    for (int i=0; i<txfAry3.count; i++) {
        
        UITextField *field3 = txfAry3[i];
        
        UUDatePicker *datePicker3
        = [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                 PickerStyle:1
                                 didSelected:^(NSString *year3,
                                               NSString *month3,
                                               NSString *day3,
                                               NSString *hour3,
                                               NSString *minute3,
                                               NSString *weekDay3) {
                                     field3.text = [NSString stringWithFormat:@"%@-%@-%@",year3,month3,day3];
                                 }];
        field3.inputView = datePicker3;
    }
    
    UUDatePicker *datePicker2= [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 0, 0)
                                                        Delegate:self
                                                     PickerStyle:UUDateStyle_YearMonthDay];
    datePicker2.ScrollToDate = now;
    datePicker2.maxLimitDate = now;
    datePicker2.minLimitDate = [now dateByAddingTimeInterval:-111111111];
    _SpecifiedTime2.inputView = datePicker2;
    
    //delegate
    UUDatePicker *datePicker3= [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 0, 0)
                                                        Delegate:self
                                                     PickerStyle:UUDateStyle_YearMonthDay];
    datePicker3.ScrollToDate = now;
    datePicker3.maxLimitDate = now;
    datePicker3.minLimitDate = [now dateByAddingTimeInterval:-111111111];
    _SpecifiedTime3.inputView = datePicker3;
}

#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker:(UUDatePicker *)datePicker
                year:(NSString *)year2
               month:(NSString *)month2
                 day:(NSString *)day2

{
    _SpecifiedTime2.text = [NSString stringWithFormat:@"%@-%@-%@",year2,month2,day2];
}
#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker2:(UUDatePicker *)datePicker
                year:(NSString *)year3
               month:(NSString *)month3
                 day:(NSString *)day3

{
    _SpecifiedTime3.text = [NSString stringWithFormat:@"%@-%@-%@",year3,month3,day3];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if ((theTextField == _dobf)||(theTextField == _jobf)||(theTextField == _nameMother)||(theTextField == _LastNameMother)||(theTextField == _dobm)||(theTextField == _jobm)) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
//hide keyboard on touch out
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    if(_imageN==1)
    _imagef.image = image;
    else _imagem.image = image;
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
- (IBAction)LoadImagef:(id)sender {
    _imageN=1;
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate=self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:Nil];
    
 
}

- (IBAction)LoadImagem:(id)sender {
    _imageN=2;
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate=self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:Nil];
    
}

- (IBAction)SignIn:(id)sender {
    _dobf.delegate = self;
    _jobf.delegate = self;
    _nameMother.delegate = self;
    _LastNameMother.delegate = self;
    _dobm.delegate = self;
    _jobm.delegate = self;
    _nameFather.delegate = self;
    
    if ([_jobf.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect father's job"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_jobm.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect mother's job"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_nameMother.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect mother's name!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_LastNameMother.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect mother's lastname!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else if ([_nameFather.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur!! "
                                                        message:@"Incorrect father's name!"
                                                       delegate:@"Login"
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else
    {
        PFObject *me=[shared_User getParsePerson];
        PFObject *PersonF= [PFObject objectWithClassName:@"Person"];
        PersonF[@"FirstName"] = _nameFather.text;
        PersonF[@"LastName"] = me[@"LastName"];
        PersonF[@"DOB"] = _dobf.text;
        PersonF[@"Job"] = _jobf.text;
        PersonF[@"Gender"] = @"Male";
        PersonF[@"Country"] = me[@"Country"];
        PersonF[@"FatherP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
        PersonF[@"MotherP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
        NSData *imageData2 = UIImageJPEGRepresentation(_imagef.image, 0.5f);
        PFFile *imageFile2 = [PFFile fileWithName:@"imageFios.jpg" data:imageData2];
        PersonF[@"image"] = imageFile2;
        
        [PersonF save];
        
        PFObject *PersonM= [PFObject objectWithClassName:@"Person"];
        PersonM[@"FirstName"] = _nameMother.text;
        PersonM[@"LastName"] = _LastNameMother.text;
        PersonM[@"DOB"] = _dobm.text;
        PersonM[@"Job"] = _jobm.text;
        PersonM[@"Gender"] = @"Female";
        PersonM[@"Country"] = me[@"Country"];
        PersonM[@"FatherP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
        PersonM[@"MotherP"] = [PFObject objectWithoutDataWithClassName:@"Person" objectId:@"RyQlY5U6UM"];
        PersonM[@"SpouseP"] = PersonF;
        NSData *imageData3 = UIImageJPEGRepresentation(_imagem.image, 0.5f);
        PFFile *imageFile3 = [PFFile fileWithName:@"imageMios.jpg" data:imageData3];
        
        PersonM[@"image"] = imageFile3;
        [PersonM save];
        
        PersonF[@"SpouseP"] = PersonM;
        
        
        
        
        
        [PersonF save];
        me[@"FatherP"] = PersonF;
        me[@"MotherP"] = PersonM;
        
        [me saveInBackground];
        
        
        
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginController *vc =[mainS instantiateViewControllerWithIdentifier:@"Login"];
        [self.navigationController pushViewController: vc animated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
