//
//  ModelController.h
//  Know My Family
//
//  Created by Family-Tree-4SIM4 on 17/10/2015.
//  Copyright (c) 2015 Family-Tree-4SIM4. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

