//
//  File.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-17.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "EnterViewContoller.h"
#import "Interface.h"
@interface EnterViewController ()

@end

@implementation EnterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initControls];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldReturnEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender
{
    [self.nameTF resignFirstResponder];
    [self.pwdTF resignFirstResponder];
}
- (IBAction)gotoRegisterViewButton:(id)sender {
    
    [self performSegueWithIdentifier:@"registerView" sender:self];
}

- (void)initControls
{
    [self.enterBtn setStyle:blue];
    [self.registerBtn setStyle:whiteAndRed];
    [self.enterBtn addTarget:self action:@selector(logIn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)logIn
{
    if ((self.nameTF.text.length > 0 || ![self.nameTF.text  isEqual: @""]) && (self.pwdTF.text.length > 0 || ![self.pwdTF.text  isEqual: @""])) {
        Interface *interface = [[Interface alloc]init];
        NSString* username = self.nameTF.text;
        NSString* password = self.pwdTF.text;
        NSDictionary *registerDic = [NSDictionary dictionaryWithObjectsAndKeys:username,@"username",password,@"password", nil];
        [interface interfaceEnter:registerDic interfaceNname:webUserLogin responseBlock:^(NSDictionary* resDic ,bool finsh, NSString* msg){
            if (finsh) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
            }
        } errorBlock:^(NSError* error){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"网络连接失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }];

    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入完整" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
@end