//
//  RegisterViewController2.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "RegisterViewController2.h"

@interface RegisterViewController2 ()

@end

@implementation RegisterViewController2

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
    _phoneNumLabel.text = _data;
    [self.pushButton setStyle:blue];
}
- (IBAction)pullCheckNumButton:(id)sender {
    if ([_checkNumTextField.text isEqualToString:@"" ] ) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入验证码" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else
    {
        [self performSegueWithIdentifier:@"pushCheckNum" sender:self];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_checkNumTextField resignFirstResponder];
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
