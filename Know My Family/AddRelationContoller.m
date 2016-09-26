//
//  ViewControllerAddperson.m
//  Know My Family
//
//  Created by hedi friha on 04/11/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "AddRelationController.h"
//#import "shared_User.h"
@interface ViewControllerAddperson ()
@end

@implementation ViewControllerAddperson
//NSInteger idUser;
//NSString* typeRelation;
//NSString *idCurrUser;
- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    _currentGender=[shared_User getGender];
//    
//    //NSInteger firstUser = [[[NSUserDefaults standardUserDefaults] objectForKey:@"FirstUser"] intValue];
//    
//    _currentUser = [shared_User getSelected];
//    
//    typeRelation = [shared_User getLink];
//    
//    NSLog(@"*******///******type relation*****///***** %@",typeRelation);
//    if(![typeRelation isEqualToString:@"Spouse"])
//    {
//        _lastName.text=[shared_User getLName];
//        _segmentedControl.hidden= NO;
//    }
//    else{
//        if([_currentGender isEqual:@"Male"]){_genderValue=@"Female";}
//        else{_genderValue=@"Male";}}
//    
//    _DB=[[DBManager alloc]initWithDatabaseFilename:@"familyLinks.sqlite"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addperson:(id)sender {
    
//    if (_segmentedControl.selectedSegmentIndex == 0) {
//        _genderValue=@"Male";
//        NSLog(@"/////////////gender male/////////////////// %@",_genderValue);
//    } else if(_segmentedControl.selectedSegmentIndex == 1) {
//        _genderValue=@"Female";
//        NSLog(@"/////////////gender Female/////////////////// %@",_genderValue);
//    }
//    
//    
//    PFObject *Person= [PFObject objectWithClassName:@"Person"];
//    Person[@"FirstName"] = _name.text;
//    Person[@"LastName"] = _lastName.text;
//    Person[@"DOB"] = _dob.text;
//    Person[@"Gender"] = _genderValue;
//    if([typeRelation isEqual:@"Children"]){
//        Person[@"Father"] = _currentUser;}
//    else if([typeRelation isEqual:@"Sibling"]){
//        Person[@"Father"] = [shared_User getFather];}
//    [Person saveInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
//        if (succeeded == YES) {
//        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!!"
//                                                            message:errorString
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//        }
//        
//    }];
//    
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
//    [query whereKey:@"User" equalTo:_currentUser];
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject *objects, NSError *error) {
//        if (!error) {
//            // The find succeeded.
//            //NSLog(@"Successfully retrieved %d scores.", objects.count);
//            // Do something with the found objects
////            if([typeRelation isEqual:@"Parent"]){
////                if([_genderValue isEqual:@"Male"])[objects setObject:user forKey:@"Father"];
////                else [objects setObject:user forKey:@"Mother"];
////            }
////            else if([typeRelation isEqual:@"Spouse"]){[objects setObject:user forKey:@"Spouse"];}
//            // Save
//            [objects saveInBackground];
//            
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!! "
//                                                            message:@"Your account have been saved"
//                                                           delegate:@"Login"
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//            UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            
//            
//            ViewControllerAddperson *vc =[mainS instantiateViewControllerWithIdentifier:@"Listed"];
//            [self.navigationController pushViewController: vc animated:YES];
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];
    
    /*PFObject *newLink = [PFObject objectWithClassName:@"Person"];
     newLink[@"user1"] =  _currentUser;
     //[PFObject objectWithoutDataWithClassName:@"_User" objectId:user.objectId];
     newLink[@"user2"] = user;
     
     newLink[@"TypeRelation"] = typeRelation;
     [newLink saveInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
     if (succeeded == YES) {
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!! "
     message:@"A new relation has been added!!"
     delegate:@"Login"
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
     [alert show];
     
     } else {
     NSLog(@"Problem when creating the relation");
     }
     }];*/



// 5edma sqlite
/*NSString* requete=[NSString stringWithFormat:@"insert into user('name','lastName','dateOfBirth','gender','email') values('%@','%@','%@','%@','%@')",_name.text,_lastName.text,_dob.text,_genderValue,_email.text];
 [_DB executeQuery:requete];
 NSLog(@"*************inser requete ********** %@",requete);
 
 NSString* requete3=@"select Max(id) as id from user";
 _idarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete3]];
 NSInteger indiceId=[_DB.arrColumnNames indexOfObject:@"id"];
 NSString* ID=[[_idarray objectAtIndex:0]objectAtIndex:indiceId];
 
 NSString* requete2=[NSString stringWithFormat:@"insert into links('id1','id2','typeRelation') values('%ld','%@','%@')",(long)[shared_User getIdUser],ID,typeRelation];
 [_DB executeQuery:requete2];
 NSLog(@"/////////////requete add link/////////////////// %@",requete2);*/


/*
 if([typeRelation isEqual:@"Parent"]&&[_genderValue isEqual:@"Male"]){
 
 _currentUser[@"DOB"] = @"5/5/1955";
 [_currentUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
 if (!error) {   // Hooray! Let them use the app now.
 
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!! "
 message:@"A new relation has been added!!"
 delegate:@"Login"
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 [alert show];
 } else {   NSString *errorString = [error userInfo][@"error"];
 // Show the errorString somewhere and let the user try again.
 NSLog(@"erreur father %@",errorString);
 }
 }];
 }*/

//NSInteger id = [ID intValue];


}



@end
