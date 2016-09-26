//
//  TreeController.h
//  Know My Family
//
//  Created by hedi friha on 26/11/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ImageExempleCell.h"
@interface TreeController : UIViewController {
    NSArray *imageFileArray;
    NSMutableArray *imagesArray;

}
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollection;
@property (weak, nonatomic) IBOutlet UIImageView *image1;


@end
