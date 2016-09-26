//
//  PersonW.h
//  Know My Family
//
//  Created by FamilyLinks on 03/01/2016.
//  Copyright © 2016 Family-Tree-4SIM4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface personW : NSObject
@property(nonatomic) PFUser* user;
@property(nonatomic) NSString* personId;
@property(nonatomic) NSString* name;
@property(nonatomic) NSString* lastName;
@property(nonatomic) NSString* email;
@property(nonatomic) NSString* gender;
@property(nonatomic) NSString* dob;
@property(nonatomic) NSString* coutry;
@property(nonatomic) NSString* job;
@property(nonatomic) PFObject* father;
@property(nonatomic) PFObject* mother;
@property(nonatomic) PFObject* spouse;
@property(nonatomic) NSData* imageP;
@property(nonatomic) NSData* imageSP;
@property(nonatomic) NSString* fatherId;
@property(nonatomic) NSString* motherId;
@property(nonatomic) NSString* spouseId;
@end
