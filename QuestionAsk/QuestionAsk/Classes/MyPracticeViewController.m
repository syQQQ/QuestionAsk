//
//  MyPracticeViewController.m
//  QuestionAsk
//
//  Created by SYQ on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "MyPracticeViewController.h"
#import "RGBHelper.h"
@implementation MyPracticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myData = [NSArray arrayWithObjects:
                   [NSArray arrayWithObjects:@"请选择制式", @"GSM", @"TD-SCDMA", @"LTE", nil],
                   [NSArray arrayWithObjects:@"请选择地域", @"广州移动", @"江苏移动", @"浙江移动", nil],
                   [NSArray arrayWithObjects:@"请选择厂商", @"通用类", @"爱立信", @"华为", @"中兴", nil],
                   [NSArray arrayWithObjects:@"请选择答题模式", @"正常模式", @"答案模式", nil],
                   [NSArray arrayWithObjects:@"请选择题量", @"20", @"30", @"40", @"50", nil],
                   nil];
    [self initControls];
}

- (void)initControls
{
    [self.startBtn setStyle:blue];
    for (UIView *myView in self.cells) {
        UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onClickCell:)];
        [tap setMinimumPressDuration:0];
        [myView addGestureRecognizer:tap];
        if (myView.tag == 3) {
            [[myView.subviews objectAtIndex:2] setText:@"正常模式"];
        }else if (myView.tag == 4){
            [[myView.subviews objectAtIndex:2] setText:@"20"];
        }else{
            [[myView.subviews objectAtIndex:2] setText:@""];
        }
    }
}

- (void)onClickCell:(UITapGestureRecognizer*)sender
{
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            [sender.view setBackgroundColor:[UIColor colorWithRed:[RGBHelper rgbChange:23] green:[RGBHelper rgbChange:183] blue:[RGBHelper rgbChange:243] alpha:1]];
            [[sender.view.subviews objectAtIndex:0] setHidden:YES];
            break;
        case UIGestureRecognizerStateCancelled:
            [sender.view setBackgroundColor:[UIColor colorWithRed:[RGBHelper rgbChange:248] green:[RGBHelper rgbChange:248] blue:[RGBHelper rgbChange:248] alpha:1]];
            [[sender.view.subviews objectAtIndex:0] setHidden:NO];
            break;
        case UIGestureRecognizerStateEnded:
            self.curViewTag = sender.view.tag;
            [sender.view setBackgroundColor:[UIColor colorWithRed:[RGBHelper rgbChange:248] green:[RGBHelper rgbChange:248] blue:[RGBHelper rgbChange:248] alpha:1]];
            [[sender.view.subviews objectAtIndex:0] setHidden:NO];
            [self showActionSheet:[self.myData objectAtIndex:sender.view.tag]];
            break;
        default:
            break;
    }
    
}

- (void)showActionSheet:(NSArray*)options
{
    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:options[0] delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    for (int i = 0; i < options.count; i++) {
        if (i == 0) {
            continue;
        }
        NSString *option = [options objectAtIndex:i];
        [as addButtonWithTitle:option];
    }
//    [as addButtonWithTitle:@"重置"];
    [as addButtonWithTitle:@"取消"];
    [as setDestructiveButtonIndex:as.numberOfButtons - 2];
    [as setCancelButtonIndex:as.numberOfButtons - 1];
    [as showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIView *myView = [self.cells objectAtIndex:self.curViewTag];
    UILabel *myLabel = [myView.subviews objectAtIndex:2];
    
    if (buttonIndex == actionSheet.numberOfButtons - 2) {
        [myLabel setText:@""];
    }else if (buttonIndex != actionSheet.numberOfButtons - 1){
        [myLabel setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
        [myLabel setHidden:NO];
        if (self.curViewTag < 3) {
            for (int i = 0; i < 3; i++) {
                if (i == self.curViewTag) {
                    continue;
                }
                UIView *myView = [self.cells objectAtIndex:i];
                UILabel *myLabel = [myView.subviews objectAtIndex:2];
                [myLabel setText:@""];

            }
        }
    }
}
- (IBAction)onClickStart:(id)sender {
}
@end
