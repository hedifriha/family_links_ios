//
//  person.m
//  Know My Family
//
//  Created by yosemite on 11/5/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "person.h"
@interface person ()

@end

@implementation person
@synthesize user;
@synthesize personId;
@synthesize name;
@synthesize lastName;
@synthesize email;
@synthesize gender;
@synthesize dob;
@synthesize coutry;
@synthesize job;
@synthesize father;
@synthesize mother;
@synthesize spouse;
@synthesize fatherId;
@synthesize motherId;
@synthesize spouseId;
@synthesize imageP;
@synthesize imageSP;
/*
+ (PFUser*)getUser {
    return user;
}

+ (void)setUser:(PFUser*)newUser {
    user = newUser;
}

+ (PFUser*)getFather {
    return father;
}

+ (void)setFather:(PFUser*)newFather {
    father = newFather;
}

+ (PFUser*)getMother {
    return mother;
}

+ (void)setMother:(PFUser*)newMother {
    mother = newMother;
}

+ (NSString*)getLastName {
    return lastName;
}
+ (void)setLName:(NSString*)newLastName {
    lastName = newLastName;
}

+ (NSString*)getName {
    return name;
}
+ (void)setName:(NSString*)newName {
    name = newName;
}

+ (NSString*)getGender {
    return gender;
}
+ (void)setGender:(NSString*)newGender {
    gender = newGender;
}

+ (NSString*)getDob {
    return dob;
}
+ (void)setDob:(NSString*)newDob {
    dob = newDob;
}

+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

-(person*)initwithname:(NSString *)name withprenom:(NSString *)lastName withdateOfBirth:(NSString*)dob withgender:(NSString*)gender

{
    self.setName(name);
    self.lastName=lastName;
    self.dob=dob;
    self.gender=gender;
    return self;
}
-(person*)initwithname:(NSString *)name withprenom:(NSString *)lastName withdateOfBirth:(NSString*)dob withgender:(NSString*)gender withfather:(PFUser*)Father withmother:(PFUser*)Mother
{
    self.name=name;
    self.lastName=lastName;
    self.dob=dob;
    self.gender=gender;
    self.father=Father;
    self.mother=Mother;
    return self;
}*/

@end
