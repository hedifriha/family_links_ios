//
//  shared_User.m
//  Know My Family
//
//  Created by yosemite on 11/20/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "shared_User.h"

@interface shared_User ()

@end

@implementation shared_User
static PFUser *User = nil;
static PFObject *NewUser = nil;
static NSString *IdUser = @"";
static NSString* LName = @"";
static NSString* Name = @"";
static NSString* Email = @"";
static NSString* Gender = @"";
static NSString* Link = @"";
static NSString* Username = @"";
static NSString* Pass = @"";
static NSString* Job = @"";
static NSString* Country = @"";
static person* current=nil;
static person *selected=nil;
static PFObject* father=nil;
static PFObject* mother=nil;
static PFObject* spouse=nil;
static PFObject* parsePerson=nil;
static NSString* fatherId=nil;
static NSString* motherId=nil;
static NSString* spouseId=nil;
static NSMutableArray *familyResults=nil;
static NSString* wasin=nil;


static int Age = 1;



+ (void)setFamilyResults:(NSMutableArray*)newfamilyResults {
    familyResults = newfamilyResults;
}

+ (NSMutableArray*)getfamilyResults {
    return familyResults;
}

+ (PFObject*)getUser {
    return User;
}

+ (void)setUser:(PFUser*)User {
    User = User;
}

+ (PFObject*)getNewUser {
    return NewUser;
}

+ (void)setNewUser:(PFObject*)newUser {
    NewUser = newUser;
}

+ (PFObject*)getFather {
    return father;
}

+ (void)setFather:(PFObject*)newFather {
    father = newFather;
}

+ (person*)getCurrent {
    return current;
}

+ (void)setCurrent:(person*)newCurrent {
    current = newCurrent;
}

+ (person*)getSelected {
    return selected;
}

+ (void)setSelected:(person*)newSelected {
    selected = newSelected;
}

+ (PFObject*)getMother {
    return mother;
}

+ (void)setParsePerson:(PFObject*)parsePers {
    parsePerson = parsePers;
}

+ (PFObject*)getParsePerson {
    return parsePerson;
}

+ (void)setMother:(PFObject*)newMother {
    mother = newMother;
}
+ (PFObject*)getSpouse {
    return spouse;
}

+ (void)setSpouse:(PFObject*)newSpouse {
    spouse = newSpouse;
}

+ (NSString*)getFatherId {
    return fatherId;
}
+ (void)setFatherId:(NSString*)newFatherId {
    fatherId = newFatherId;
}

+ (NSString*)getMotherId {
    return motherId;
}
+ (void)setMotherId:(NSString*)newMotherId {
    motherId = newMotherId;
}

+ (NSString*)getEmail {
    return Email;
}
+ (void)setEmail:(NSString*)newEmail {
    Email = newEmail;
}

+ (NSString*)getCoutry {
    return Country;
}
+ (void)setCoutry:(NSString*)newCoutry {
    Country = newCoutry;
}

+ (NSString*)getJob {
    return Job;
}
+ (void)setJob:(NSString*)newJob {
    Job = newJob;
}

+ (NSString*)getSpouseId {
    return spouseId;
}
+ (void)setSpouseId:(NSString*)newSpouseId {
    spouseId = newSpouseId;
}


+ (NSString*)getIdUser {
    return IdUser;
}

+ (void)setIdUser:(NSString*)newIdUser {
    IdUser = newIdUser;
}

+ (NSString*)getLName {
    return LName;
}
+ (void)setLName:(NSString*)newLName {
    LName = newLName;
}

+ (NSString*)getName {
    return Name;
}
+ (void)setName:(NSString*)newName {
    LName = newName;
}
+ (NSString*)getUsername {
    return Username;
}
+ (void)setUsername:(NSString *)newUsername {
    Username = newUsername;
}
+ (NSString*)getPass{
    return Pass;
}
+ (void)setPass:(NSString*)newPass {
    Pass = newPass;
}


+ (NSString*)getGender {
    return Gender;
}
+ (void)setGender:(NSString*)newGender {
    Gender = newGender;
}

+ (NSString*)getLink {
    return Link;
}
+ (void)setLink:(NSString*)newLink {
    Link = newLink;
}

+ (int)getAge {
    return Age;
}

+ (void)setAge:(int)newAge {
    Age = newAge;
}

+ (NSString*)getWasIn {
    return wasin;
}
+ (void)setWasIn:(NSString*)newWasIn {
    wasin = newWasIn;
}

+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
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
