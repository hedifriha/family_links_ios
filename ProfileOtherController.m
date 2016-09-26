//
//  ProfileOtherController.m
//  Know My Family
//
//  Created by familyLinks on 17/12/2015.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "ProfileOtherController.h"

@interface ProfileOtherController ()

@end

@implementation ProfileOtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    SingletonClass *sPerson= [SingletonClass sharedPerson];
    _image.layer.cornerRadius = _image.layer.frame.size.height /2;
    _image.layer.masksToBounds = YES;
    _image.layer.borderWidth = 0;

    person *p= [sPerson pers];
    _nameAndLastName.text=[NSString stringWithFormat:@"%@ %@",p.name,p.lastName];
    _dob.text=p.dob;
    _job.text=p.job;
    _coutry.text=p.coutry;
    _image.image=[UIImage imageWithData:p.imageP];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
