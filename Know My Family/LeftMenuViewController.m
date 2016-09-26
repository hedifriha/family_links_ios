//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "ProfileController.h"
#import "LoginController.h"

@implementation LeftMenuViewController{
    NSArray *menu;
    int a;
}

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ;
    //	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
    //	self.tableView.backgroundView = imageView;
    menu = @[@"cellCouverture", @"cellHome", @"cellTree", @"cellListed",@"cellSignOut"];
    _tableView.scrollEnabled = NO;

    //self.view.layer.borderWidth = .6;
    //self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //refresh code
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row)
    {
        case 0:
            return 140;
            break;
            
        default:
            return 60;
            
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menu.count;
}

/* (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
 {
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 120)];
	view.backgroundColor = [UIColor clearColor];
	return view;
 }
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 {
	return 120;
 }*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellCouverture"];
    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    person *p=[shared_User getCurrent];
    UILabel *email = (UILabel *)[tableView viewWithTag:1];
     switch (indexPath.row)
     {
     case 0:
         {
             email.text=p.dob;
             UIImageView *ImagePerson = (UIImageView *)[tableView viewWithTag:2];
             ImagePerson.image=[UIImage imageWithData:p.imageP];
             return cell;
         }
     break;
         default:
         {
             return cell2;
         }
     break;
             
     }

//    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    
//    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"	bundle: nil];
    
    UIViewController *vc ;
    
    switch (indexPath.row)
    {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"Profile"];
            break;
            
        case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"Home"];
            
            break;
            
        case 2:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"treeF"];
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case 4:
        {
            [PFUser logOut];
            LoginController *vcs =[mainStoryboard instantiateViewControllerWithIdentifier:@"Login"];
            [self.navigationController pushViewController: vcs animated:YES];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 3:
            [shared_User setSelected:[shared_User getCurrent]];
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"Listed"];
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
    }
    [[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
        [SlideNavigationController sharedInstance].menuRevealAnimator = [[SlideNavigationContorllerAnimatorSlide alloc] init];}];
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
}


@end
