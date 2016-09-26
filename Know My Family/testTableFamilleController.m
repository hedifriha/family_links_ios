//
//  interface2ViewController.m
//  tttt
//
//  Created by yosemite on 10/29/15.
//  Copyright © 2015 yosemite. All rights reserved.
//

#import "testTableFamilleController.h"


@interface interface2ViewController ()

@end

@implementation interface2ViewController
NSString* nomT;
NSString* lNameT;
NSString* dobT;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _table.dataSource=self;
    _table.delegate=self;

    _DB=[[DBManager alloc]initWithDatabaseFilename:@"familyLinks.sqlite"];
    // Do any additional setup after loading the view.
    
    
    [self loadpersons];
}
-(void)viewDidAppear:(BOOL)animated

{
    [self loadpersons];
    [_table reloadData];
}
-(void)loadpersons
{
    NSString* requete=@"select * from user where gender == 'Male'";
    _myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
    NSString* requete2=@"select * from user where gender == 'Female'";
    _myarray2=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return _myarray.count;
            break;
        case 1:
            return _myarray2.count;
            break;
        default:
            return 0;
            break;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];

    
    
    switch (indexPath.section) {
        case 0:
        {
            NSInteger indicenom=[_DB.arrColumnNames indexOfObject:@"name"];
            nomT=[[_myarray objectAtIndex:indexPath.row]objectAtIndex:indicenom];
            
            
            NSInteger indiceLName=[_DB.arrColumnNames indexOfObject:@"lastName"];
            lNameT=[[_myarray objectAtIndex:indexPath.row]objectAtIndex:indiceLName];
            
            NSInteger indiceDob=[_DB.arrColumnNames indexOfObject:@"dateOfBirth"];
            dobT=[[_myarray objectAtIndex:indexPath.row]objectAtIndex:indiceDob];
            
            break;
        }
        case 1:
        {
            NSInteger indicenom2=[_DB.arrColumnNames indexOfObject:@"name"];
            nomT=[[_myarray2 objectAtIndex:indexPath.row]objectAtIndex:indicenom2];
            
            
            NSInteger indiceLName2=[_DB.arrColumnNames indexOfObject:@"lastName"];
            lNameT=[[_myarray2 objectAtIndex:indexPath.row]objectAtIndex:indiceLName2];
            
            NSInteger indiceDob2=[_DB.arrColumnNames indexOfObject:@"dateOfBirth"];
            dobT=[[_myarray2 objectAtIndex:indexPath.row]objectAtIndex:indiceDob2];
            
            break;
        }
        default:
            cell.textLabel.text = @"No Person";
            break;
        
    }
    
    UILabel *Name = (UILabel *)[tableView viewWithTag:101];
    Name.text = [NSString stringWithFormat:@"%@ %@",nomT,lNameT];
    
    UILabel *dob = (UILabel *)[tableView viewWithTag:103];
    dob.text = [NSString stringWithFormat:@"%@", dobT];
    // Configure the cell...
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Male";
            break;
        case 1:
            return @"Female";
            break;
            
        default:
            return @"Nothing";
            break;
    }
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    /*NSInteger indiceselect=[_table indexPathForSelectedRow].row;
    
    DetalsViewController * v=[segue destinationViewController];
    
    NSInteger indicenom=[_DB.arrColumnNames indexOfObject:@"Name"];
    NSString* nom=[[_myarray objectAtIndex:indiceselect]objectAtIndex:indicenom];
    
    
    NSInteger indiceCateg=[_DB.arrColumnNames indexOfObject:@"Categ"];
    NSString* Categorie=[[_myarray objectAtIndex:indiceselect]objectAtIndex:indiceCateg];
    
    
    NSInteger indiceAnnee=[_DB.arrColumnNames indexOfObject:@"Annee"];
    NSString* An=[[_myarray objectAtIndex:indiceselect]objectAtIndex:indiceAnnee];
    
    NSInteger indiceimage=[_DB.arrColumnNames indexOfObject:@"Image"];
    NSString* image=[[_myarray objectAtIndex:indiceselect]objectAtIndex:indiceimage];
    
    film * p=[[film alloc]initwithnom:nom withcateg:Categorie withannee:An withImage:image];
    v.film=p;*/

    
}

@end
