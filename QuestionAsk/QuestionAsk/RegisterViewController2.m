//
//  RegisterViewController2.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "RegisterViewController2.h"
#import "Interface.h"

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
    _phoneNumLabel.text = [_data objectForKey:@"mobile"];
    NSLog(@"chenkNum :%@",[_data objectForKey:@"yzm"]);
    [self.pushButton setStyle:blue];
}
- (IBAction)pullCheckNumButton:(id)sender {
    if ([_checkNumTextField.text isEqualToString:@"" ] ) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入验证码" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else
    {
        if ([_activityInd isAnimating]) {
            [_activityInd stopAnimating];
        }else{
            [_activityInd startAnimating];
        }
        self.isGetButton.enabled = NO;
        self.pushButton.enabled = NO;
        self.checkNumTextField.enabled = NO;
        
        //if ([_checkNumTextField.text isEqualToString:[_data objectForKey:@"mobile"]]) {
        NSString* webNum = [_data objectForKey:@"yzm"];
        NSString* viewNum = self.checkNumTextField.text;
        //if ([[NSString stringWithFormat:@"%@",[_data objectForKey:@"mobile"]] isEqualToString: self.checkNumTextField.text]) {
        
        if ([webNum isEqualToString:viewNum]) {
            Interface* interface = [[Interface alloc]init];
            [interface interfaceEnter:self.data interfaceNname:confirmMobileValidCode responseBlock:^(NSDictionary *resDic, bool finsh, NSString *msg) {
                
                [_activityInd stopAnimating];
                self.isGetButton.enabled = YES;
                self.pushButton.enabled = YES;
                self.checkNumTextField.enabled = YES;
                
                if (finsh) {
                   [self performSegueWithIdentifier:@"pushCheckNum" sender:self];
                }else{
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                    [alert show];
                }
            } errorBlock:^(NSError *error) {
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"网络连接失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
            }];
            
        }else{
            
            [_activityInd stopAnimating];
            self.isGetButton.enabled = YES;
            self.pushButton.enabled = YES;
            self.checkNumTextField.enabled = YES;
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString *phoneNum = _phoneNumLabel.text;
    NSDictionary *msg = [NSDictionary dictionaryWithObjectsAndKeys:phoneNum,@"mobile", nil];
    UIViewController *send = segue.destinationViewController;
    if([send respondsToSelector:@selector(setData:)]) {
        [send setValue:msg forKey:@"data"];
    }

}


@end
