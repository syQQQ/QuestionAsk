//
//  RegisterViewController2.h
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"

@interface RegisterViewController2 : UIViewController
@property NSDictionary* data;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UITextField *checkNumTextField;
@property (weak, nonatomic) IBOutlet ButtonWithBorder *pushButton;
@property (weak, nonatomic) IBOutlet UIButton *isGetButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;

@end
