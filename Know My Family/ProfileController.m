//
//  ProfileController.m
//  Know My Family
//
//  Created by yosemite on 11/10/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "ProfileController.h"
#import "shared_User.h"
@interface ProfileController ()

@end

@implementation ProfileController
UIView *contentView2;
UPStackMenu *stack2;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    //PFUser* currentUser = [PFUser currentUser];
    //[query whereKey:@"username" equalTo:currentUser.username ];
    
    [query getObjectInBackgroundWithId:[shared_User getIdUser] block:^(PFObject *object, NSError *error) {
        if (!object) {
            return NSLog(@"%@", error);
        }
        
        PFFile *imageFile = object[@"image"];
        self.name.text = object[@"FirstName"];
        self.lastname.text = object[@"LastName"];
        //self.username.text =object[@"Username"];
        self.dob.text =object[@"DOB"];
        self.job.text=object[@"Job"];
        self.country.text=object[@"Country"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!data) {
                return NSLog(@"%@", error);
            }
            
            // Do something with the image
            self.image1.image = [UIImage imageWithData:data];
        }];
    }];
    
    contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];//taille du menu
    [contentView2 setBackgroundColor:[UIColor colorWithRed:255./255. green:0./255. blue:0./255. alpha:1.]];
    [contentView2.layer setCornerRadius:27.];                                                                //border radius
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cross"]];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setFrame:CGRectInset(contentView2.frame, 10, 10)];
    [contentView2 addSubview:icon];
    [self changeDemo:nil];

}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeDemo:(id)sender
{
    if(stack2)
        [stack2 removeFromSuperview];
    
    stack2 = [[UPStackMenu alloc] initWithContentView:contentView2];
    [stack2 setCenter:CGPointMake(self.view.frame.size.width-35, self.view.frame.size.height-35)];//position
    [stack2 setDelegate:self];
    
    UPStackMenuItem *squareItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"p50"] highlightedImage:nil title:@"Parent"];
    UPStackMenuItem *circleItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"c50"] highlightedImage:nil title:@"Children"];
    UPStackMenuItem *triangleItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"b50"] highlightedImage:nil title:@"Sibling"];
    UPStackMenuItem *crossItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"s50"] highlightedImage:nil title:@"Spouse"];
    NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:squareItem, circleItem, triangleItem, crossItem, nil];
    [items enumerateObjectsUsingBlock:^(UPStackMenuItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitleColor:[UIColor whiteColor]];
    }];
    
    [stack2 setAnimationType:UPStackMenuAnimationType_progressive];
    [stack2 setStackPosition:UPStackMenuStackPosition_up];
    [stack2 setOpenAnimationDuration:.4];
    [stack2 setCloseAnimationDuration:.4];
    
    [items enumerateObjectsUsingBlock:^(UPStackMenuItem *item, NSUInteger idx, BOOL *stop) {
        [item setLabelPosition:UPStackMenuItemLabelPosition_right];
        [item setLabelPosition:UPStackMenuItemLabelPosition_left];
        [item setTitleColor:[UIColor colorWithRed:64./255. green:196./255. blue:255./255. alpha:1.]];//couleur des titres
    }];
    
    
    [stack2 addItems:items];
    [self.view addSubview:stack2];
    
    [self setStackIconClosed:YES];
}

- (void)setStackIconClosed:(BOOL)closed
{
    UIImageView *icon = [[contentView2 subviews] objectAtIndex:0];
    float angle = closed ? 0 : (M_PI * (135) / 180.0);
    [UIView animateWithDuration:0.3 animations:^{
        [icon.layer setAffineTransform:CGAffineTransformRotate(CGAffineTransformIdentity, angle)];
    }];
}

#pragma mark - UPStackMenuDelegate

- (void)stackMenuWillOpen:(UPStackMenu *)menu
{
    if([[contentView2 subviews] count] == 0)
        return;
    
    [self setStackIconClosed:NO];
}

- (void)stackMenuWillClose:(UPStackMenu *)menu
{
    if([[contentView2 subviews] count] == 0)
        return;
    
    [self setStackIconClosed:YES];
}


- (void)stackMenu:(UPStackMenu *)menu didTouchItem:(UPStackMenuItem *)item atIndex:(NSUInteger)index
{
    [shared_User setLink:item.title];
    [shared_User setSelected:[shared_User getCurrent]];
    
    UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    ProfileController *vc =[mainS instantiateViewControllerWithIdentifier:@"AddNew"];//AddNew
    [self.navigationController pushViewController: vc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
