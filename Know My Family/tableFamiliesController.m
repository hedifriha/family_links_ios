//
//  tableFamiliesController.m
//  Know My Family
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "tableFamiliesController.h"
#import "AAPLSearchResultsViewController.h"

@interface tableFamiliesController ()
//@property (nonatomic, strong) UISearchController *searchController;

@end
NSInteger indicenom;
@implementation tableFamiliesController

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"familyLinks.sqlite"];
    NSString* requete=@"select * from user";
    _myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger ii=_myarray.count;
    return ii;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    indicenom=[_DB.arrColumnNames indexOfObject:@"name"];
    NSString* nom=[[_myarray objectAtIndex:indexPath.row]objectAtIndex:indicenom];
    
    
    UITableViewCell* myCell=[tableView dequeueReusableCellWithIdentifier:@"familyCell" forIndexPath:indexPath];
    
    //UILabel *Name = (UILabel *)[tableView viewWithTag:101];
    myCell.textLabel.text = [NSString stringWithFormat:@"%@",nom];
    //Name.text = [NSString stringWithFormat:@"Nom : %@",nom];
    
    return myCell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)searchButton:(id)sender {
  /*  // Create the search results view controller and use it for the UISearchController.
    AAPLSearchResultsViewController *searchResultsController = [self.storyboard instantiateViewControllerWithIdentifier:AAPLSearchResultsViewControllerStoryboardIdentifier];
    
    // Create the search controller and make it perform the results updating.
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    self.searchController.searchResultsUpdater = searchResultsController;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    // Present the view controller.
    [self presentViewController:self.searchController animated:YES completion:nil];*/
}
@end
