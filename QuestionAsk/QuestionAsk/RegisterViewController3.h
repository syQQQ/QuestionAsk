//
//  RegisterViewController3.h
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"

@interface RegisterViewController3 : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFild;
@property (weak, nonatomic) IBOutlet ButtonWithBorder *loadingButton;

@property (weak, nonatomic) IBOutlet UITextField *checkPasswordTextFild;
@end
