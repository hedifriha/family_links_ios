//
//  SingletonClass.h
//  Know My Family
//
//  Created by familyLinks on 17/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "person.h"

@interface SingletonClass : NSObject {
    
}

@property (nonatomic, retain) person *pers;



+ (id)sharedPerson;



@end

