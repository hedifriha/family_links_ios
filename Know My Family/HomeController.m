//
//  HomeController.m
//  Know My Family
//
//  Created by yosemite on 11/10/15.
//  Copyright © 2015 Family-Tree-4SIM4. All rights reserved.
//

#import "HomeController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface HomeController ()

@property (weak, nonatomic) IBOutlet UIImageView *imglogo;
- (IBAction)postfacebook:(id)sender;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)postfacebook:(id)sender {
    SLComposer = [[SLComposeViewController alloc]init];
    SLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [SLComposer setInitialText:[NSString stringWithFormat:@"I'm using FamilyLinks app in my iphone"]];
    [SLComposer addImage:self.imglogo.image] ;
    [self presentViewController:SLComposer animated:YES completion:NULL];
}
- (IBAction)postTwitter:(UIButton *)sender {
    SLComposer = [[SLComposeViewController alloc]init];
    SLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [SLComposer setInitialText:[NSString stringWithFormat:@"I'm using FamilyLinks app in my iphone"]];
    [SLComposer addImage:self.imglogo.image] ;
    [self presentViewController:SLComposer animated:YES completion:NULL];
}
@end











