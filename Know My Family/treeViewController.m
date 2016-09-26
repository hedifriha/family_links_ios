//
//  EFAnimationViewController.m
//  aaatest
//
//  Created by Jueying on 15/5/17.
//  Copyright (c) 2015年 Jueying. All rights reserved.
//

#import "treeViewController.h"
#import "shared_User.h"
#define RADIUS 100.0
#define RADIUS1 150.0
#define PHOTONUM 4
#define TAGSTART 1000
#define TAGSTART1 1000
#define TIME 1.5
#define SCALENUMBER 1.25
NSInteger array [PHOTONUM][PHOTONUM] = {
    /* {0,1,2,3,4,5},
     {5,0,1,2,3,4},
     {4,5,0,1,2,3},
     {3,4,5,0,1,2},
     {2,3,4,5,0,1},
     {1,2,3,4,5,0},*/
    {0,1,2,3},
    {3,0,1,2},
    {2,3,0,1},
    {1,2,3,0},
    
};

@interface treeViewController ()<EFItemViewDelegate>

@property (nonatomic, assign) NSInteger currentTag;

@end

@implementation treeViewController
PFFile *imageU;
PFFile *imageF;
PFFile *imageM;
PFFile *imageSP;
//NSString *U=[[NSString alloc]init];
NSString *myString =@"";
NSString *myStringF =@"";
NSString *myStringM=@"";
NSString *myStringSP=@"";
CATransform3D rotationTransform1[PHOTONUM];
NSArray *dataArray;
- (void)viewDidLoad {
    //NSString *myString=[[NSString alloc]init];
    [super viewDidLoad];
    
    [self configViews];
    
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

#pragma mark - configViews

- (void)configViews {
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    PFQuery *query1 = [PFQuery queryWithClassName:@"Person"];
    PFQuery *query2 = [PFQuery queryWithClassName:@"Person"];
    PFQuery *query3 = [PFQuery queryWithClassName:@"Person"];
    [query getObjectInBackgroundWithId:[shared_User getIdUser] block:^(PFObject *object, NSError *error) {
        if (!object) {
            return NSLog(@"%@", error);
        }
        
        PFFile *imagefile = object[@"image"];
        imageU = imagefile;
        
        
    }];
    
    [imageU getFilePathInBackgroundWithBlock:^(NSString *filePath, NSError *error) {
        if (!filePath) {
            return NSLog(@"salem %@", error);
            
        }
        NSLog(@"path :::: %@",filePath);
        NSLog(@"hhhhhhh :::: %@",myString);
        
        myString=filePath;
    
        
    }];
    [query1 getObjectInBackgroundWithId:[shared_User getFatherId] block:^(PFObject *object, NSError *error) {
        if (!object) {
            return NSLog(@"%@", error);
        }
        
        PFFile *imagefile = object[@"image"];
        imageF = imagefile;
        
        
    }];
    
    [imageF getFilePathInBackgroundWithBlock:^(NSString *filePath, NSError *error) {
        if (!filePath) {
            return NSLog(@"salem %@", error);
            
        }
        NSLog(@"path :::: %@",filePath);
        
        myStringF=filePath;
        
    }];
    
    [query2 getObjectInBackgroundWithId:[shared_User getMotherId] block:^(PFObject *object, NSError *error) {
        if (!object) {
            return NSLog(@"%@", error);
        }
        
        PFFile *imagefile = object[@"image"];
        imageM = imagefile;
        
        
    }];
    
    [imageM getFilePathInBackgroundWithBlock:^(NSString *filePath, NSError *error) {
        if (!filePath) {
            return NSLog(@"salem %@", error);
            
        }
        NSLog(@"path :::: %@",filePath);
        
        myStringM=filePath;
        
    }];
    [query3 getObjectInBackgroundWithId:[shared_User getSpouseId] block:^(PFObject *object, NSError *error) {
        if (!object) {
            return NSLog(@"%@", error);
        }
        
        PFFile *imagefile = object[@"image"];
        imageSP = imagefile;
        
        
    }];
    
    [imageSP getFilePathInBackgroundWithBlock:^(NSString *filePath, NSError *error) {
        if (!filePath) {
            return NSLog(@"salem %@", error);
            
        }
        NSLog(@"path :::: %@",filePath);
        NSLog(@"hhhhhhh :::: %@",myString);
        
        myStringSP=filePath;
        
    }];
    
    
    NSLog(@"hhhhhhh :::: %@",myString);
    
    dataArray =  @[myString, myStringF,myStringSP,myStringM];
    NSArray *dataArray1 =  @[@"a.jpg", @"fath.png",@"sp.png",@"moth.png"];
    CGFloat centery = self.view.center.y + 50;
    CGFloat centerx = self.view.center.x ;
    
    for (NSInteger i = 0;i < PHOTONUM;i++) {
        CGFloat tmpy =  centery + RADIUS*cos(2.0*M_PI *i/PHOTONUM);
        CGFloat tmpx =	centerx - RADIUS*sin(2.0*M_PI *i/PHOTONUM);
        EFItemView *view = [[EFItemView alloc] initWithNormalImage:dataArray[i] highlightedImage:[dataArray[i]  stringByAppendingFormat:@"%@", @"_hover"] tag:TAGSTART+i title:nil];
        view.frame = CGRectMake(0.0, 0.0,115,115);
        view.center = CGPointMake(tmpx,tmpy);
        view.delegate = self;
        rotationTransform1[i] = CATransform3DIdentity;
        
        CGFloat Scalenumber = fabs(i - PHOTONUM/2.0)/(PHOTONUM/2.0);
        if (Scalenumber < 0.3) {
            Scalenumber = 0.4;
        }
        CATransform3D rotationTransform = CATransform3DIdentity;
        rotationTransform = CATransform3DScale (rotationTransform, Scalenumber*SCALENUMBER,Scalenumber*SCALENUMBER, 1);
        view.layer.transform=rotationTransform;
        
        [self.view addSubview:view];
        
        
        
    }
    for (NSInteger i = 0;i < PHOTONUM;i++) {
        CGFloat tmpy =  centery + RADIUS1*cos(2.0*M_PI *i/PHOTONUM);
        CGFloat tmpx =	centerx - RADIUS1*sin(2.0*M_PI *i/PHOTONUM);
        EFItemView *view = [[EFItemView alloc] initWithNormalImage:dataArray1[i] highlightedImage:[dataArray1[i]  stringByAppendingFormat:@"%@", @"_hover"] tag:TAGSTART1+i title:nil];
        view.frame = CGRectMake(0.0, 0.0,50,50);
        view.center = CGPointMake(tmpx,tmpy);
        view.delegate = self;
        rotationTransform1[i] = CATransform3DIdentity;
        
        CGFloat Scalenumber = fabs(i - PHOTONUM/2.0)/(PHOTONUM/2.0);
        if (Scalenumber < 0.3) {
            Scalenumber = 0.4;
        }
        CATransform3D rotationTransform = CATransform3DIdentity;
        rotationTransform = CATransform3DScale (rotationTransform, Scalenumber*SCALENUMBER,Scalenumber*SCALENUMBER, 1);
        view.layer.transform=rotationTransform;
        [self.view addSubview:view];
        
        
    }
    
    self.currentTag = TAGSTART;
    self.currentTag = TAGSTART1;
    
    
    
    
    //self.currentTag = TAGSTART;
}

#pragma mark - EFItemViewDelegate

- (void)didTapped:(NSInteger)index {
    
    if (self.currentTag  == index) {
        
        return;
    }
    
    NSInteger t = [self getIemViewTag:index];
    
    for (NSInteger i = 0;i<PHOTONUM;i++ ) {
        
        UIView *view = [self.view viewWithTag:TAGSTART+i];
        [view.layer addAnimation:[self moveanimation:TAGSTART+i number:t] forKey:@"position"];
        [view.layer addAnimation:[self setscale:TAGSTART+i clicktag:index] forKey:@"transform"];
        
        NSInteger j = array[index - TAGSTART][i];
        CGFloat Scalenumber = fabs(j - PHOTONUM/2.0)/(PHOTONUM/2.0);
        if (Scalenumber < 0.3) {
            Scalenumber = 0.4;
        }
    }
    for (NSInteger i = 0;i<PHOTONUM;i++ ) {
        
        UIView *view = [self.view viewWithTag:TAGSTART1+i];
        [view.layer addAnimation:[self moveanimation:TAGSTART1+i number:t] forKey:@"position"];
        [view.layer addAnimation:[self setscale1:TAGSTART1+i clicktag:index] forKey:@"transform"];
        
        NSInteger j = array[index - TAGSTART1][i];
        CGFloat Scalenumber = fabs(j - PHOTONUM/2.0)/(PHOTONUM/2.0);
        if (Scalenumber < 0.3) {
            Scalenumber = 0.4;
        }
    }
    self.currentTag  = index;
}

- (CAAnimation*)setscale:(NSInteger)tag clicktag:(NSInteger)clicktag {
    
    NSInteger i = array[clicktag - TAGSTART][tag - TAGSTART];
    NSInteger i1 = array[self.currentTag  - TAGSTART][tag - TAGSTART];
    CGFloat Scalenumber = fabs(i - PHOTONUM/2.0)/(PHOTONUM/2.0);
    CGFloat Scalenumber1 = fabs(i1 - PHOTONUM/2.0)/(PHOTONUM/2.0);
    if (Scalenumber < 0.3) {
        Scalenumber = 0.4;
    }
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = TIME;
    animation.repeatCount =1;
    
    CATransform3D dtmp = CATransform3DScale(rotationTransform1[tag - TAGSTART],Scalenumber*SCALENUMBER, Scalenumber*SCALENUMBER, 1.0);
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(rotationTransform1[tag - TAGSTART],Scalenumber1*SCALENUMBER,Scalenumber1*SCALENUMBER, 1.0)];
    animation.toValue = [NSValue valueWithCATransform3D:dtmp ];
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}
- (CAAnimation*)setscale1:(NSInteger)tag clicktag:(NSInteger)clicktag {
    
    NSInteger i = array[clicktag - TAGSTART1][tag - TAGSTART1];
    NSInteger i1 = array[self.currentTag  - TAGSTART1][tag - TAGSTART1];
    CGFloat Scalenumber = fabs(i - PHOTONUM/2.0)/(PHOTONUM/2.0);
    CGFloat Scalenumber1 = fabs(i1 - PHOTONUM/2.0)/(PHOTONUM/2.0);
    if (Scalenumber < 0.3) {
        Scalenumber = 0.4;
    }
    CABasicAnimation* animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation1.duration = TIME;
    animation1.repeatCount =1;
    
    CATransform3D dtmp = CATransform3DScale(rotationTransform1[tag - TAGSTART1],Scalenumber*SCALENUMBER, Scalenumber*SCALENUMBER, 1.0);
    animation1.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(rotationTransform1[tag - TAGSTART1],Scalenumber1*SCALENUMBER,Scalenumber1*SCALENUMBER, 1.0)];
    animation1.toValue = [NSValue valueWithCATransform3D:dtmp ];
    animation1.autoreverses = NO;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    
    return animation1;
}


- (CAAnimation*)moveanimation:(NSInteger)tag number:(NSInteger)num {
    // CALayer
    UIView *view = [self.view viewWithTag:tag];
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animation];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,view.layer.position.x,view.layer.position.y);
    
    NSInteger p =  [self getIemViewTag:tag];
    CGFloat f = 2.0*M_PI  - 2.0*M_PI *p/PHOTONUM;
    CGFloat h = f + 2.0*M_PI *num/PHOTONUM;
    CGFloat centery = self.view.center.y + 50;
    CGFloat centerx = self.view.center.x;
    CGFloat tmpy =  centery + RADIUS*cos(h);
    CGFloat tmpx =	centerx - RADIUS*sin(h);
    view.center = CGPointMake(tmpx,tmpy);
    
    CGPathAddArc(path,nil,self.view.center.x, self.view.center.y + 50,RADIUS,f+ M_PI/2,f+ M_PI/2 + 2.0*M_PI *num/PHOTONUM,0);
    animation.path = path;
    CGPathRelease(path);
    animation.duration = TIME;
    animation.repeatCount = 1;
    animation.calculationMode = @"paced";
    return animation;
}


- (NSInteger)getIemViewTag:(NSInteger)tag {
    
    if (self.currentTag >tag){
        return self.currentTag  - tag;
    } else {
        return PHOTONUM  - tag + self.currentTag ;
    }
}

@end




@interface EFItemView ()

@property (nonatomic, strong) NSString *normal;
@property (nonatomic, strong) NSString *highlighted_;
@property (nonatomic, assign) NSInteger tag_;
@property (nonatomic, strong) NSString *title;

@end

@implementation EFItemView

- (instancetype)initWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted tag:(NSInteger)tag title:(NSString *)title {
    
    self = [super init];
    if (self) {
        _normal = normal;
        _highlighted_ = highlighted;
        _tag_ = tag;
        _title =title;
        [self configViews];
    }
    return self;
}

#pragma mark - configViews

- (void)configViews {
    
    self.tag = _tag_;
    [self setBackgroundImage:[UIImage imageNamed:_normal] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:_highlighted_] forState:UIControlStateHighlighted];
    [self addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self setTitle:_title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:30.0]];
}

- (void)btnTapped:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapped:)]) {
        [self.delegate didTapped:sender.tag];
        
        
    }
}

@end

// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net