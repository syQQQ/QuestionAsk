//
//  SetUserNameViewController.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-20.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "SetUserNameViewController.h"
#import "IndividualViewController.h"

@interface SetUserNameViewController ()

@end

@implementation SetUserNameViewController

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
    [self.doneButton setStyle:blue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneButton:(id)sender {
    //[self.navigationController popToViewControll  animated:YES];
    IndividualViewController *setPrizeVC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    setPrizeVC.nameLabel.text = self.useNameTextField.text;
    [self.navigationController popToViewController:setPrizeVC animated:true];
    //[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSString *msg = _useNameTextField.text;
//    UIViewController *send = segue.destinationViewController;
//    if([send respondsToSelector:@selector(setData:)]) {
//        [send setValue:msg forKey:@"data"];
//    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_useNameTextField resignFirstResponder];
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
