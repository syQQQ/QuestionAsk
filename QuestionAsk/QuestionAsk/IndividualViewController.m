//
//  IndividualViewController.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-20.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "IndividualViewController.h"

@interface IndividualViewController ()

@end

@implementation IndividualViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameLabel.text = _data;
    [self.cancelButton setStyle:blue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoSetNameView:(id)sender {
     [self performSegueWithIdentifier:@"gotoSetNameView" sender:self];
}

- (void) popSetNameLabel:(NSString*)name{
    _nameLabel.text = _data;
}
- (IBAction)gotoErrorQuestionView:(id)sender {
    [self performSegueWithIdentifier:@"gotoErrorQuestionView" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
