//
//  interface2ViewController.h
//  tttt
//
//  Created by yosemite on 10/29/15.
//  Copyright © 2015 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface interface2ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) NSString *strNom;
@property (weak, nonatomic) NSString *strPrenom;

@property (weak, nonatomic) IBOutlet UITableView *table;


@property(strong,nonatomic) NSArray* myarray;
@property(strong,nonatomic) NSArray* myarray2;
@property(nonatomic) DBManager* DB;



@end
