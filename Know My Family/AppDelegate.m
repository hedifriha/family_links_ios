//
//  AppDelegate.m
//  Know My Family
//
//  Created by Family-Tree-4SIM4 on 17/10/2015.
//  Copyright (c) 2015 Family-Tree-4SIM4. All rights reserved.
#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"NULJ74YbTTSQNw3kLlgchZngdINgb8cDfcOMqEAh"
                  clientKey:@"ip5rrLANHQ5vzCMno73JR1j19ANXLBHjQDnV6ekt"];
    
    UIStoryboard *mainStoryboard = [self grabStoryboard];
    // grab correct storyboard depending on screen height
    //UIStoryboard *storyboard = [self grabStoryboard];
    
    // display storyboard
    self.window.rootViewController = [mainStoryboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    
    LeftMenuViewController *leftMenu = (LeftMenuViewController*)[mainStoryboard
                                                                 instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
    
   
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    [self Parse];
    // Override point for customization after application launch.
    return YES;
}
-(void) Parse{
//    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.sim.lagha"];
//    [sharedDefaults setObject:@"ahmed" forKey:@"MyNumberKey"];
//    [sharedDefaults synchronize];   // (!!) This is crucial.
    
    
    _persons2 = [[NSMutableArray alloc]init];
    
    NSString* requete=[NSString stringWithFormat:@"Delete from Person"];
    [_DB executeQuery:requete];
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    
    [query includeKey:@"FatherP"];
    [query includeKey:@"MotherP"];
    [query includeKey:@"SpouseP"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError*error)
     {
         if (!error) {
             
             
             //NSLog(@"%@", objects);
             int i=0;
        //     NSLog(@"objects.count %ld", objects.count);
             for (PFObject 	*pers1 in objects) {
                 i++;
                 NSLog(@"i %d", i);
                 //NSLog(@"%@", object.objectId);
                 person* P =[[person alloc]init];
                 P.personId=pers1.objectId;
                 if (![P.personId isEqualToString:@"RyQlY5U6UM"]){
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
                     P.email=@"";
                     [imageP getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                         if (!error) {
                             dispatch_async(dispatch_get_main_queue(), ^ {
                                 P.imageP=data;
                             });
                         }
                     }];
                     if ([P.personId isEqualToString:[shared_User getIdUser]])
                     {P.email=pers1[@"Email"];
                         [shared_User setCurrent:P];
                         [shared_User setSelected:P];
                     }
                     [_persons2 addObject:P];
                     
                     NSString* requete2=[NSString stringWithFormat:@"insert into Person values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",
                                         pers1.objectId,pers1[@"FirstName"],pers1[@"LastName"],pers1[@"DOB"],pers1[@"Gender"],pers1[@"Job"],pers1[@"Country"],fatherP.objectId,motherP.objectId,spouseP.objectId,P.email];
                     [_DB executeQuery:requete2];
                 }else{
                     //if(i==(int)(objects.count)){
                     //*********************** get data in table(person) sqlite**********************
                     NSString* requete=[NSString stringWithFormat:@"select * from Person"];
                     _myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
                     
                     NSInteger ii=_myarray.count;
                     NSInteger n;
                     //    if(ii!=0){
                     NSInteger indiceId=[_DB.arrColumnNames indexOfObject:@"objectId"];
                     NSInteger indiceName=[_DB.arrColumnNames indexOfObject:@"FirstName"];
                     NSInteger indiceLName=[_DB.arrColumnNames indexOfObject:@"LastName"];
                     NSInteger indiceDOB=[_DB.arrColumnNames indexOfObject:@"DOB"];
                     NSInteger indiceGender=[_DB.arrColumnNames indexOfObject:@"Gender"];
                     NSInteger indiceJob=[_DB.arrColumnNames indexOfObject:@"Job"];
                     NSInteger indiceCoutry=[_DB.arrColumnNames indexOfObject:@"Country"];
                     NSInteger indiceFid=[_DB.arrColumnNames indexOfObject:@"FatherId"];
                     NSInteger indiceMid=[_DB.arrColumnNames indexOfObject:@"MotherId"];
                     NSInteger indiceSid=[_DB.arrColumnNames indexOfObject:@"SpouseId"];
                     NSInteger indiceEmail=[_DB.arrColumnNames indexOfObject:@"Email"];
                     for(n = 0; n <ii; n = n + 1){
                         person* P =[[person alloc]init];
                         P.personId=[[_myarray objectAtIndex:n]objectAtIndex:indiceId];
                         P.name=[[_myarray objectAtIndex:n]objectAtIndex:indiceName];
                         P.lastName=[[_myarray objectAtIndex:n]objectAtIndex:indiceLName];
                         P.dob=[[_myarray objectAtIndex:n]objectAtIndex:indiceDOB];
                         P.gender=[[_myarray objectAtIndex:n]objectAtIndex:indiceGender];
                         P.job=[[_myarray objectAtIndex:n]objectAtIndex:indiceJob];
                         P.coutry=[[_myarray objectAtIndex:n]objectAtIndex:indiceCoutry];
                         P.fatherId=[[_myarray objectAtIndex:n]objectAtIndex:indiceFid];
                         P.motherId=[[_myarray objectAtIndex:n]objectAtIndex:indiceMid];
                         P.spouseId=[[_myarray objectAtIndex:n]objectAtIndex:indiceSid];
                         P.email=[[_myarray objectAtIndex:n]objectAtIndex:indiceEmail];
                         if([P.gender isEqualToString:@"Female"])
                             P.imageP=UIImageJPEGRepresentation([UIImage imageNamed: @"mother-1"], 0.5f);
                         else(P.imageP=UIImageJPEGRepresentation([UIImage imageNamed: @"father-1"], 0.5f));
                         [_persons2 addObject:P];
                         //}
                     }
                 }
             }
             //             NSString* requete=@"select * from Person";
             //             _dbarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
             //             NSLog(@"_dbarray count1 %lu",(unsigned long)_dbarray.count);
             
             [shared_User setFamilyResults:_persons2];
      //        NSLog(@"persons %ld",_persons2.count);
             NSLog(@"okok");
             
             
         } else {
             // Log details of the failure
             NSLog(@"Error: %@ %@", error, [error userInfo]);
         }
     }];
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (UIStoryboard *)grabStoryboard {
    
    // determine screen size
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIStoryboard *storyboard;
    
    switch (screenHeight) {
            
            // iPhone 4s
        case 480:
            storyboard = [UIStoryboard storyboardWithName:@"Main-4s" bundle:nil];
            break;
            
            // iPhone 5s
        case 568:
            storyboard = [UIStoryboard storyboardWithName:@"Main-5s" bundle:nil];
            break;
            
            // iPhone 6
        case 667:
            storyboard = [UIStoryboard storyboardWithName:@"Main-6" bundle:nil];
            break;
            
            // iPhone 6 Plus
        case 736:
            storyboard = [UIStoryboard storyboardWithName:@"Main-6-Plus" bundle:nil];
            break;
            
        default:
            // it's an iPad
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            break;
    }
    
    return storyboard;
}


@end