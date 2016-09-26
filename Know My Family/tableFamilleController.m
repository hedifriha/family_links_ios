//
//  tableFamilleController.m
//  Know My Family
//
//  Created by yosemite on 11/20/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "tableFamilleController.h"
#import "PrincipalController.h"

NSString * Cellule = @"myCell";

@interface tableFamilleController ()

@end

@implementation tableFamilleController
{
   
}
NSString* nomT2;
NSString* lNameT2;
NSString* dobT2;
NSInteger row;
PFUser *currUser;
NSString *idCurrentUser;
person *pers;
NSString* personId=@"";
person *father;
person *mother;
person *selected;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[shared_User getWasIn] isEqualToString:@"register1"]){
        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to say hello?"
                                                    message:@"More info..."
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Say Hello",nil];
    [alert show];
     };
    UILongPressGestureRecognizer* longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [_table addGestureRecognizer:longPressRecognizer];

    UISwipeGestureRecognizer* swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipecell:)];
    [_table addGestureRecognizer:swipeRecognizer];
    
    //refresh code
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [_table addSubview:refreshControl];
    
    _myarrayC = [[NSMutableArray alloc]init];
    _myarrayOther= [[NSMutableArray alloc]init];
    _myarrayP= [[NSMutableArray alloc]init];
    _myarraySp= [[NSMutableArray alloc]init];
    _myarraySi= [[NSMutableArray alloc]init];
    _myarrayUncle= [[NSMutableArray alloc]init];
    _myarrayGp= [[NSMutableArray alloc]init];
    
    _table.dataSource=self;
    _table.delegate=self;

    
//    [self Parse];
//    [self CreateList];

    [self CreateList];
    [_table reloadData];
    
    
    
//    _DB=[[DBManager alloc]initWithDatabaseFilename:@"familyLinks.sqlite"];
//    [self loadpersons];
//    [_table reloadData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    
}

//- (void)alertView:(UIAlertView *)alertView
//clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == [alertView cancelButtonIndex]){
//        //cancel clicked ...do your action
//    }else{
//        [self.navigationItem.backBarButtonItem setAction:@selector(performBackNavigation:)];
//    }
//}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
        PFUser *u=[shared_User getUser];
        PFObject *s=[shared_User getNewUser];
        s[@"User"] = u;
        [s save];
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        tableFamilleController *vc =[mainS instantiateViewControllerWithIdentifier:@"register2"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (buttonIndex == 1) {
        NSLog(@"OK Tapped. Hello World!");
        
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        tableFamilleController *vc =[mainS instantiateViewControllerWithIdentifier:@"Login"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


//- (void)performBackNavigation:(id)sender
//{
//    // Do operations
//    [self.navigationController popViewControllerAnimated:NO];
//}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [self CreateList];
    [_table reloadData];
    [refreshControl endRefreshing];
}




-(void) CreateList{
    //NSLog(@"shared father %@",[shared_User getFather].objectId);
    //NSLog(@"getfamilyResults %@",[shared_User getfamilyResults]);
    [_myarrayC removeAllObjects];
    [_myarrayOther removeAllObjects];
    [_myarrayP removeAllObjects];
    [_myarraySp removeAllObjects];
    [_myarraySi removeAllObjects];
    [_myarrayUncle removeAllObjects];
    [_myarrayGp removeAllObjects];
    father=nil;
    mother=nil;
    
    _savedPersons=[shared_User getfamilyResults];
    //NSLog(@"persons %ld",_savedPersons.count);
    selected=[shared_User getSelected];
    
    //PFObject *father=[shared_User getFather];
    //PFObject *mother=[shared_User getMother];
    NSString *personId;
    for (person *person in _savedPersons) {
        personId=person.personId;
        //NSLog(@"data read %@",person.imageP);
        //NSLog(@"person fatherId %@",person.fatherId);
        //NSLog(@"shared fatherId %@",[shared_User getFatherId]);
        if(![person.fatherId isEqualToString:@"RyQlY5U6UM"])
        {
        if([person.fatherId isEqual:selected.fatherId]&&(![personId isEqualToString:[shared_User getIdUser]])){[_myarraySi addObject:person];}
            
        else if([person.fatherId isEqual:selected.personId])[_myarrayC addObject:person];
        else if([person.motherId isEqual:selected.personId])[_myarrayC addObject:person];
            
        }else if ([personId isEqual:selected.fatherId]){father=person;[_myarrayP addObject:father];}
        
        else if ([personId isEqual:selected.motherId]){mother=person;[_myarrayP addObject:mother];}
        
        else if (([person.motherId isEqual:selected.personId])&&(![person.motherId isEqualToString:@"RyQlY5U6UM"]))[_myarrayC addObject:person];
        
        else if([person.personId isEqual:selected.spouseId]){[_myarraySp addObject:person];}
    }
    
    for (person *person in _savedPersons) {
        if([father.personId isEqual:person.father]){[_myarrayUncle addObject:person];}
        else if([person.father isEqual: mother.personId]){[_myarrayUncle addObject:person];}
        else if([person.personId isEqual:father.fatherId]){[_myarrayGp addObject:person];}
        else if([person.personId isEqual:father.motherId]){[_myarrayGp addObject:person];}
        else if([person.personId isEqual:mother.fatherId]){[_myarrayGp addObject:person];}
        else if([person.personId isEqual:mother.motherId]){[_myarrayGp addObject:person];}
    }
    
    NSLog(@"person Siblings %lu",(unsigned long)_myarraySi.count);
    NSLog(@"person Other %lu",(unsigned long)_myarrayOther.count);
    NSLog(@"person Parent %lu",(unsigned long)_myarrayP.count);
    NSLog(@"person Children %lu",(unsigned long)_myarrayC.count);
    NSLog(@"person count5 %lu",(unsigned long)[shared_User getfamilyResults].count);
}




-(void)viewDidAppear:(BOOL)animated

{
    [self CreateList];
    [_table reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {

        case 0:
            return _myarraySp.count;
            break;
        case 1:
            return _myarrayGp.count;
            break;
        case 2:
            return _myarrayP.count;
            break;
        case 3:
            return _myarraySi.count;
            break;
        case 4:
            return _myarrayC.count;
            break;
        case 5:
            return _myarrayUncle.count;
            break;
        default:
            return 0;
            break;
    }
//    NSLog(@"person count2 %lu",(unsigned long)[shared_User getfamilyResults].count);
//    return [shared_User getfamilyResults].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...

    Cellule = @"myCell";
    
    return [tableView dequeueReusableCellWithIdentifier:Cellule];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    row=indexPath.row;
    
    UILabel *Name = (UILabel *)[tableView viewWithTag:101];
    UILabel *dob = (UILabel *)[tableView viewWithTag:103];
    UIImageView *ImagePerson = (UIImageView *)[tableView viewWithTag:105];
    
    ImagePerson.layer.cornerRadius = 5;
    ImagePerson.layer.masksToBounds = YES;
    ImagePerson.layer.borderWidth = 0;
    
    person *pers;
    
    switch (indexPath.section) {
        case 0:
        {
            pers=[_myarraySp objectAtIndex:row];
            ImagePerson.image=[UIImage imageWithData:pers.imageSP];
        }
            break;
        case 1:
        {
            pers=[_myarrayGp objectAtIndex:row];
            ImagePerson.image=[UIImage imageWithData:pers.imageP];
        }
            break;
        case 2:
        {
            pers=[_myarrayP objectAtIndex:row];
            ImagePerson.image=[UIImage imageWithData:pers.imageP];
        }
            break;
        case 3:
        {
            pers=[_myarraySi objectAtIndex:row];
            ImagePerson.image=[UIImage imageWithData:pers.imageP];
        }
            break;
            
        case 4:
        {
            pers=[_myarrayC objectAtIndex:row];
            ImagePerson.image=[UIImage imageWithData:pers.imageP];
        }
            break;
        case 5:
        {
            pers=[_myarrayUncle objectAtIndex:row];
            ImagePerson.image=[UIImage imageWithData:pers.imageP];
        }
            break;
        default:
            cell.hidden=YES;
            break;
    }
    
    Name.text=[NSString stringWithFormat:@"%@ %@ (%d)",pers.name,pers.lastName,18];
    dob.text=pers.dob;
    
    }



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        
        case 0:
            if(_myarraySp.count!=0)return @"Spouse";else return nil;
            break;
        case 1:
            if(_myarrayGp.count!=0)return @"Grand parent";else return nil;
            break;
        case 2:
            if(_myarrayP.count!=0)return @"Parent";else return nil;
            break;
        case 3:
            if(_myarraySi.count!=0)return @"Siblings";else return nil;
            break;
        case 4:
            if(_myarrayC.count!=0)return @"Children";else return nil;
            break;
        case 5:
            if(_myarrayUncle.count!=0)return @"Uncle";else return nil;
            break;
            
        default:
            if(_myarrayOther.count!=0)return @"Nothing";else return nil;
            break;
    }
}
- (IBAction)swipecell:(UISwipeGestureRecognizer *)sender {
    CGPoint p = [sender locationInView:self.table];
    
    NSIndexPath *indexPath = [self.table indexPathForRowAtPoint:p];
    row=indexPath.row;
    if (indexPath == nil) {
        NSLog(@"long press on table view but not on a row");
    } else {
        UITableViewCell *cell = [self.table cellForRowAtIndexPath:indexPath];
        if (cell.isHighlighted) {
            switch (indexPath.section) {
                case 0:
                {
                    pers=[_myarraySp objectAtIndex:row];
                }
                    break;
                case 1:
                {
                    pers=[_myarrayGp objectAtIndex:row];
                }
                    break;
                case 2:
                {
                    pers=[_myarrayP objectAtIndex:row];
                }
                    break;
                case 3:
                {
                    pers=[_myarraySi objectAtIndex:row];
                }
                    break;
                    
                case 4:
                {
                    pers=[_myarrayC objectAtIndex:row];
                }
                    break;
                case 5:
                {
                    pers=[_myarrayUncle objectAtIndex:row];
                }
                    break;
                default:
                    
                    break;
                    //Name.text =@"No one";
                    //dob.text =@"No one";
            }
            SingletonClass *sing= [SingletonClass sharedPerson];
            [sing setPers:pers];
            UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            tableFamilleController *vc =[mainS instantiateViewControllerWithIdentifier:@"profilOther"];
            [self.navigationController pushViewController: vc animated:YES];
        }
    }
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint p = [sender locationInView:self.table];
        
        NSIndexPath *indexPath = [self.table indexPathForRowAtPoint:p];
        row=indexPath.row;
        if (indexPath == nil) {
            NSLog(@"long press on table view but not on a row");
        } else {
            UITableViewCell *cell = [self.table cellForRowAtIndexPath:indexPath];
            if (cell.isHighlighted) {
                switch (indexPath.section) {
                    case 0:
                    {
                        pers=[_myarraySp objectAtIndex:row];
                    }
                        break;
                    case 1:
                    {
                        pers=[_myarrayGp objectAtIndex:row];
                    }
                        break;
                    case 2:
                    {
                        pers=[_myarrayP objectAtIndex:row];
                    }
                        break;
                    case 3:
                    {
                        pers=[_myarraySi objectAtIndex:row];
                    }
                        break;
                        
                    case 4:
                    {
                        pers=[_myarrayC objectAtIndex:row];
                    }
                        break;
                    case 5:
                    {
                        pers=[_myarrayUncle objectAtIndex:row];
                    }
                        break;
                    default:
                        break;
                }
                [shared_User setSelected:pers];
                
                [self CreateList];
                [_table reloadData];
            }
        }
    }
    
    
}

//-(void) tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    switch (indexPath.section) {
//        case 0:
//        {
//            pers=[_myarraySp objectAtIndex:row];
//        }
//            break;
//        case 1:
//        {
//            pers=[_myarrayGp objectAtIndex:row];
//        }
//            break;
//        case 2:
//        {
//            pers=[_myarrayP objectAtIndex:row];
//        }
//            break;
//        case 3:
//        {
//            pers=[_myarraySi objectAtIndex:row];
//        }
//            break;
//
//        case 4:
//        {
//            pers=[_myarrayC objectAtIndex:row];
//        }
//            break;
//        case 5:
//        {
//            pers=[_myarrayUncle objectAtIndex:row];
//        }
//            break;
//        default:
//
//            break;
//            //Name.text =@"No one";
//            //dob.text =@"No one";
//
//    }
//
//
//    SingletonClass *sing= [SingletonClass sharedPerson];
//    [sing setPers:pers];
//}

/*
 
 -(void)loadpersons
 {
 
 currentUser = [PFUser currentUser];
 idCurrUser= currentUser.objectId;
 PFQuery *query = [PFUser query];
 [query whereKey:@"gender" equalTo:@"female"];  find all women
 _myarraySp = [query findObjects];
 //getUserObjectWithId:objectId
currUser = [PFUser currentUser];
idCurrentUser= currUser.objectId;

NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user1 = %@ and TypeRelation=%@", currUser,@"5/5/2005"];
PFQuery *query = [PFQuery queryWithClassName:@"Relation" predicate:predicate];
//_myarraySp = [query findObjects];
// _myarrayP = [query findObjects];
// _myarraySi = [query findObjects];
// _myarrayC = [query findObjects];
//_myarraySp = [query findObjects];






[query findObjectsInBackgroundWithBlock:^(NSArray *Relations, NSError *error) {
    
    // NSLog(@"Relations %@",Relations);
    
//    _myarrayC=Relations;
//     for (PFObject *object in Relations) {
//     NSLog(@"%@", object.objectId);
//     }
//     NSLog(@"my new array = relation %@",_myarrayC);
//     NSString *aa=Relations.array[1].TypeRelation;
//     NSLog(@"my new array = relation %@",@"aaa");
    
}];



//Khedma sqlite

NSString* requeteSp = [NSString stringWithFormat:@"select * from user u,links l where u.id==l.id2 and l.id1==%ld and l.typeRelation='Spouse'",(long)[shared_User getIdUser]];
NSString* requeteP = [NSString stringWithFormat:@"select * from user u,links l where u.id==l.id2 and l.id1==%ld and l.typeRelation='Parent'",(long)[shared_User getIdUser]];
NSString* requeteSi = [NSString stringWithFormat:@"select * from user u,links l where u.id==l.id2 and l.id1==%ld and l.typeRelation='Sibling'",(long)[shared_User getIdUser]];
NSString* requeteC = [NSString stringWithFormat:@"select * from user u,links l where u.id==l.id2 and l.id1==%ld and l.typeRelation='Children'",(long)[shared_User getIdUser]];
NSLog(@"requete Parent %@",requeteP);
NSLog(@"requete children %@",requeteC);
NSLog(@"requete Spouse %@",requeteSp);
NSLog(@"requete sibling %@",requeteSi);
_myarraySp=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requeteSp]];
_myarrayP=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requeteP]];
_myarraySi=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requeteSi]];
_myarrayC=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requeteC]];
NSLog(@"count array Parent %lu",(unsigned long)_myarrayP.count);
NSLog(@"count array Children %lu",(unsigned long)_myarrayC.count);
NSLog(@"count array Spouse %lu",(unsigned long)_myarraySp.count);
NSLog(@"count array Sibling %lu",(unsigned long)_myarraySi.count);


}
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


//#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    tableFamilleController *svc = [segue destinationViewController];
//    [svc setStrNom:Myname.text];
//}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}




- (IBAction)backtomylist:(UIBarButtonItem *)sender {
    [shared_User setSelected:[shared_User getCurrent]];
    
    [self CreateList];
    [_table reloadData];
}
@end
