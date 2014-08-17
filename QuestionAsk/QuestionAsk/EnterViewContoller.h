//
//  Header.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-17.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain)IBOutlet UITextField *nameTF;
@property (nonatomic, retain)IBOutlet UITextField *pwdTF;
- (IBAction)textFieldReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
@end