//
//  RegisterViewController.h
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet ButtonWithBorder *registerButton;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;

@end
