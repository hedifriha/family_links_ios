//
//  SingletonClass.m
//  Know My Family
//
//  Created by familyLinks on 17/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "SingletonClass.h"

@implementation SingletonClass

@synthesize pers;


#pragma mark Singleton Methods


+ (id)sharedPerson {
    static SingletonClass *sharedPerson = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPerson = [[self alloc] init];
    });
    return sharedPerson;
}


- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end