//
//  SearchTableViewController.m
//  Know My Family
//
//  Created by familyLinks on 17/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _savedPersons3=[shared_User getfamilyResults];
    _searchResult=_savedPersons3;
}

-(void)viewDidAppear:(BOOL)animated

{

    [_table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    _table.dataSource=self;
    _table.delegate=self;
    
    //refresh code
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [_table addSubview:refreshControl];

}


- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [refreshControl endRefreshing];
}
    
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    

}                     // called when keyboard search button pressed

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{


}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    
    // _searchResult.removeAllObjects;
    for (person *person in _savedPersons3) {
        //NSLog(@"data read %@",person.imageP);
        NSLog(@"person fatherId %@",person.name);
        if([person.name isEqualToString:@"asd"])
        {
            [_searchResult addObject:person];
            NSLog(@"sibling++++++++");
        }
    }
    [_table reloadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _searchResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    return [tableView dequeueReusableCellWithIdentifier:@"myCell"];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UILabel *Name = (UILabel *)[tableView viewWithTag:1];
    
    person *pers;
    
    pers=[_searchResult  objectAtIndex:indexPath.row];
    Name.text=[NSString stringWithFormat:@"%@",pers.name];
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
