//
//  SearchTableViewController.h
//  Know My Family
//
//  Created by familyLinks on 17/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "person.h"
#import "shared_User.h"

@interface SearchTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) IBOutlet UISearchBar *mySearchBar;

@property(strong,nonatomic) NSMutableArray* savedPersons3;

@property(strong,nonatomic) NSMutableArray *persons3;

@property(strong,nonatomic) NSMutableArray *searchResult;


@end
