//
//  Header.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-17.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"

@interface EnterViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet ButtonWithBorder *enterBtn;
@property (strong, nonatomic) IBOutlet ButtonWithBorder *registerBtn;
@property (nonatomic, retain)IBOutlet UITextField *nameTF;
@property (nonatomic, retain)IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activitInd;
- (IBAction)textFieldReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (void)logIn;
@end