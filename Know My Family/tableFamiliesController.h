//
//  tableFamiliesController.h
//  Know My Family
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

#import "AAPLSearchControllerBaseViewController.h"


@interface tableFamiliesController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) NSArray* myarray;
@property(nonatomic) DBManager* DB;
- (IBAction)searchButton:(id)sender;





@end
