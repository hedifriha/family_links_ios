//
//  TreeController.m
//  Know My Family
//
//  Created by hedi friha on 26/11/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "TreeController.h"

@interface TreeController ()

@end

@implementation TreeController
@synthesize imageCollection;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self queryParseMethod];
    // Do any additional setup after loading the view.
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    PFUser* currentUser = [PFUser currentUser];
    [query whereKey:@"username" equalTo:currentUser.username ];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            return NSLog(@"%@", error);
        }
        
        PFFile *imageFile = object[@"image"];
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!data) {
                return NSLog(@"%@", error);
            }
            
            // Do something with the image
            self.image1.image = [UIImage imageWithData:data];
        }];
    }];

}
#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)queryParseMethod{
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            imageFileArray = [[NSArray alloc] initWithArray:objects];
            [imageCollection reloadData];
        }
    }];
}
#pragma mark - UICollectionView data source
-(NSInteger)numberofSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:
(NSInteger)section
{
    return [imageFileArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"imageCell";
    ImageExempleCell *cell = (ImageExempleCell *)[collectionView
                                                  dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    PFObject *imageObject = [imageFileArray objectAtIndex:indexPath.row];
    PFFile *imageFile = [imageObject objectForKey:@"image"];
    [imageFile getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (!error) {
            
            cell.parseImage.image = [UIImage imageWithData:data];
            
            
        }
    }];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:
(NSIndexPath *)indexPath{}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
