//
//  RegisterViewController3.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "RegisterViewController3.h"
#import "Interface.h"   
#import "MainViewController.h"

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

    
    if ([password compare: checkPassword]!= NSOrderedSame)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"密码验证错误" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        if ([_activityInd isAnimating]) {
            [_activityInd stopAnimating];
        }else{
            [_activityInd startAnimating];
        }
        
        self.passwordTextFild.enabled =NO;
        self.loadingButton.enabled =NO;
        self.checkPasswordTextFild.enabled =NO;
        
        
        NSString *username = [self.data objectForKey:@"mobile"];
        NSString *password = self.passwordTextFild.text;
        NSString *xm = @"";
        NSString *zjhm = @"";
        NSString *email = @"";
        NSString *qq = @"";
        NSString *xxdz = @"";
        NSString *sbch = @"";
        NSString *mobile = [self.data objectForKey:@"mobile"];
        
        NSDictionary *registerDic = [NSDictionary dictionaryWithObjectsAndKeys:mobile,@"mobile",mobile,@"mobile",username,@"username",password,@"password",xm,@"xm",zjhm,@"zjhm",email,@"email",qq,@"qq",xxdz,@"xxdz",sbch,@"sbch",mobile,@"mobile",nil];

        Interface* interface = [[Interface alloc]init];
        
        [interface interfaceEnter:registerDic interfaceNname:webUserRegister responseBlock:^(NSDictionary *resDic, bool finsh, NSString *msg) {
            [_activityInd stopAnimating];
            self.passwordTextFild.enabled =YES;
            self.loadingButton.enabled =YES;
            self.checkPasswordTextFild.enabled =YES;
            
            
            if (finsh) {
                MainViewController *setPrizeVC = [self.navigationController.viewControllers objectAtIndex:0];
                setPrizeVC.usenameLable.text = [self.data objectForKey:@"mobile"];;
                [self.navigationController popToViewController:setPrizeVC animated:true];
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
            }

        } errorBlock:^(NSError *error) {
            
            [_activityInd stopAnimating];
            self.passwordTextFild.enabled =YES;
            self.loadingButton.enabled =YES;
            self.checkPasswordTextFild.enabled =YES;
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"网络连接失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];

        }];
        
        
//        MainViewController *setPrizeVC = [self.navigationController.viewControllers objectAtIndex:0];
//        setPrizeVC.usenameLable.text = @"admin";
//        [self.navigationController popToViewController:setPrizeVC animated:true];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_passwordTextFild resignFirstResponder];
    [_checkPasswordTextFild resignFirstResponder];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    NSString* msg = @"ddddffff";
//    UIViewController *send = segue.destinationViewController;
//    if([send respondsToSelector:@selector(setData:)]) {
//        [send setValue:msg forKey:@"data"];
//    }

}

@end
