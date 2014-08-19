//
//  RegisterViewController3.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "RegisterViewController3.h"

@interface RegisterViewController3 ()

@end

@implementation RegisterViewController3

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
     [self.loadingButton setStyle:blue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   

}
- (IBAction)loadingButton:(id)sender {
    NSString * password = self.passwordTextFild.text;
    NSString * checkPassword = self.checkPasswordTextFild.text;
    if ([password isEqualToString:@"" ]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入密码" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    if ([checkPassword isEqualToString:@"" ]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请再次输入密码验证" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }

    
    if ([password compare: checkPassword]!=NSOrderedSame)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"密码验证错误" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        //[self performSegueWithIdentifier:@"MainView" sender:self];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_passwordTextFild resignFirstResponder];
    [_checkPasswordTextFild resignFirstResponder];
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
