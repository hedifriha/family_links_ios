//
//  tableFamilleController.h
//  Know My Family
//
//  Created by yosemite on 11/20/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DBManager.h"
#import "UPStackMenu.h"
#import "SlideNavigationController.h"
#import "SingletonClass.h"
#import "shared_User.h"
#import "person.h"
@protocol UITableViewDelegateLongPress;


@interface tableFamilleController: UIViewController<UITableViewDataSource,UITableViewDelegate,SlideNavigationControllerDelegate,UIAlertViewDelegate>
//@interface tableFamilleController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UPStackMenuDelegate,SlideNavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *backtoRegister;

@property (strong, nonatomic) IBOutlet UITableView *table;
- (IBAction)swipecell:(UISwipeGestureRecognizer *)sender;

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender;

@property(strong,nonatomic) person* selected;
@property(strong,nonatomic) NSMutableArray* myarrayP;
@property(strong,nonatomic) NSMutableArray* myarraySi;
@property(strong,nonatomic) NSMutableArray* myarraySp;
@property(strong,nonatomic) NSMutableArray* myarrayC;
@property(strong,nonatomic) NSMutableArray* myarrayOther;
@property(strong,nonatomic) NSMutableArray* myarrayUncle;
@property(strong,nonatomic) NSMutableArray* myarrayGp;
@property(strong,nonatomic) NSMutableArray *persons;
@property(strong,nonatomic) NSMutableArray *savedPersons;
- (IBAction)backtomylist:(UIBarButtonItem *)sender;
@property(nonatomic) DBManager* DB;
@end

