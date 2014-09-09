//
//  RegisterViewController.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "RegisterViewController.h"
#import "Interface.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    [self.registerButton setStyle:blue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getChenkNum:(id)sender {
    if ([_phoneNumTextField.text isEqualToString:@"" ] ) {
    
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入手机号码" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else
    {
        if ([_acitivtyInd isAnimating]) {
            [_acitivtyInd stopAnimating];
        }else{
            [_acitivtyInd startAnimating];
        }
        self.phoneNumTextField.enabled = NO;
        self.registerButton.enabled = NO;
        Interface *interface = [[Interface alloc]init];
        NSString *phoneNum = self.phoneNumTextField.text;
        NSDictionary *registerDic = [NSDictionary dictionaryWithObjectsAndKeys:phoneNum,@"mobile", nil];
        [interface interfaceEnter:registerDic interfaceNname:sendMobileValidCode responseBlock:^(NSDictionary* resDic ,bool finsh, NSString* msg){
            [_acitivtyInd stopAnimating];
            self.phoneNumTextField.enabled = YES;
            self.registerButton.enabled = YES;
            if (finsh) {
                self.chenkNum = [resDic objectForKey:@"yzm"];
                [self performSegueWithIdentifier:@"getChenkNum" sender:self];
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
            }
        }errorBlock:^(NSError *error) {
            [_acitivtyInd stopAnimating];
            self.phoneNumTextField.enabled = YES;
            self.registerButton.enabled = YES;
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"网络连接失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];

        }];
        
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *phoneNum = _phoneNumTextField.text;
    NSDictionary *msg = [NSDictionary dictionaryWithObjectsAndKeys:phoneNum,@"mobile",self.chenkNum,@"yzm", nil];
    UIViewController *send = segue.destinationViewController;
    if([send respondsToSelector:@selector(setData:)]) {
        [send setValue:msg forKey:@"data"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_phoneNumTextField resignFirstResponder];
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
