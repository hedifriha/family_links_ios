/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A table view controller that displays filtered strings (used by other view controllers for simple displaying and filtering of data).
*/
#import "DBManager.h"
@import UIKit;

@interface AAPLSearchControllerBaseViewController : UITableViewController

/// A nil / empty filter string means show all results. Otherwise, show
/// only results containing the filter.
@property (nonatomic, copy) NSString *filterString;

@property (readonly, copy) NSArray *visibleResults;
@property(strong,nonatomic) NSArray* myarray;
@property(nonatomic) DBManager* DB;

@end