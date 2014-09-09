//
//  ViewController.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-14.
//  Copyright (c) 2014年 723. All rights reserved.
//
//To judge different size of iphone screen......

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initControls];
    self.data = @"立即登入";
    self.usenameLable.text =self.data;
    NSLog(@"data:   %@",self.data);
}

- (void)viewDidAppear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化控件
- (void)initControls
{
    UIImage *backgroundImage = [UIImage imageNamed:@"index_white_bg.png"];
    
    backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]; //九宫格拉伸
    
    for (UIImageView *backRect in self.backRects) {
        [backRect setImage:backgroundImage];
        [backRect setAlpha:0.9];
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_searchBar resignFirstResponder];
    
}

@end
