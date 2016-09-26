//
//  shared_User.h
//  Know My Family
//
//  Created by yosemite on 11/20/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "person.h"
@interface shared_User : NSObject
+ (void)setFamilyResults:(NSMutableArray*)newfamilyResults;
+ (NSMutableArray*)getfamilyResults;

+ (PFUser*)getUser;
+ (void)setUser:(PFUser*)User;

+ (PFObject*)getNewUser;
+ (void)setNewUser:(PFObject*)newUser;

+ (PFObject*)getFather;
+ (void)setFather:(PFObject*)newFather;

+ (person*)getCurrent;
+ (void)setCurrent:(person*)newCurrent;

+ (person*)getSelected;
+ (void)setSelected:(person*)newSelected;

+ (PFObject*)getParsePerson;
+ (void)setParsePerson:(PFObject*)parsePerson;

+ (PFObject*)getMother;
+ (void)setMother:(PFObject*)newMother;

+ (PFObject*)getSpouse;
+ (void)setSpouse:(PFObject*)newSpouse;

+ (NSString*)getUsername;
+ (void)setUsername:(NSString*)Username;

+ (NSString*)getPass;
+ (void)setPass:(NSString*)Pass;

+ (NSString*)getIdUser;
+ (void)setIdUser:(NSString*)number;

+ (NSString*)getName;
+ (void)setName:(NSString*)Name;

+ (NSString*)getLName;
+ (void)setLName:(NSString*)Lname;

+ (NSString*)getFatherId;
+ (void)setFatherId:(NSString*)newFatherId;

+ (NSString*)getMotherId;
+ (void)setMotherId:(NSString*)newMotherId;

+ (NSString*)getSpouseId;
+ (void)setSpouseId:(NSString*)newSpouseId;

+ (NSString*)getGender;
+ (void)setGender:(NSString*)Gender;

+ (NSString*)getLink;
+ (void)setLink:(NSString*)Link;

+ (int)getAge;
+ (void)setAge:(int)Age;

+ (NSString*)getCoutry;
+ (void)setCoutry:(NSString*)newCoutry;

+ (NSString*)getJob;
+ (void)setJob:(NSString*)newJob;

+ (NSString*)getEmail;
+ (void)setEmail:(NSString*)newEmail;

+ (NSString*)getWasIn;
+ (void)setWasIn:(NSString*)newWasIn;

@end

