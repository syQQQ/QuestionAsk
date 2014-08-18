//
//  ViewController.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-14.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initControls];
}

- (void)viewDidAppear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
@end
