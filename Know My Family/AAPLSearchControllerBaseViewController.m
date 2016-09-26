/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A table view controller that displays filtered strings (used by other view controllers for simple displaying and filtering of data).
*/

#import "AAPLSearchControllerBaseViewController.h"

NSString *const AAPLSearchControllerBaseViewControllerTableViewCellIdentifier = @"searchResultsCell";

@interface AAPLSearchControllerBaseViewController ()

@property (copy) NSArray *allResults;
@property (readwrite, copy) NSArray *visibleResults;

@end

@implementation AAPLSearchControllerBaseViewController

#pragma mark - View Life Cycle
NSInteger indicenom;
- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"familyLinks.sqlite"];
    NSString* requete=@"select * from user";
    _myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
    self.allResults=_myarray;
    //self.allResults = @[@"Here's", @"to", @"the", @"crazy", @"ones.", @"The", @"misfits.", @"The", @"rebels.", @"The", @"troublemakers.", @"The", @"round", @"pegs", @"in"];
    
    self.visibleResults = self.allResults;
}

#pragma mark - Property Overrides

- (void)setFilterString:(NSString *)filterString {
    _filterString = filterString;
    
    if (!filterString || filterString.length <= 0) {
        self.visibleResults = self.allResults;
    }
    else {
        NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"self contains[c] %@", filterString];
        self.visibleResults = [self.allResults filteredArrayUsingPredicate:filterPredicate];
    }
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{NSInteger ii=_myarray.count;
    return ii;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    indicenom=[_DB.arrColumnNames indexOfObject:@"name"];
    NSString* nom=[[_myarray objectAtIndex:indexPath.row]objectAtIndex:indicenom];
    
    
    UITableViewCell* myCell=[tableView dequeueReusableCellWithIdentifier:AAPLSearchControllerBaseViewControllerTableViewCellIdentifier forIndexPath:indexPath];
    
    //UILabel *Name = (UILabel *)[tableView viewWithTag:101];
    myCell.textLabel.text = [NSString stringWithFormat:@"%@",nom];
    //Name.text = [NSString stringWithFormat:@"Nom : %@",nom];
    
    return myCell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* nom2=[[_myarray objectAtIndex:indexPath.row]objectAtIndex:indicenom];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",nom2];
}

@end
