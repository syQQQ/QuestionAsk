//
//  IndividualViewController.h
//  QuestionAsk
//
//  Created by Mac_lyf on 14-8-20.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"

@interface IndividualViewController : UIViewController
@property NSString* data;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet ButtonWithBorder *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *userNameButton;
@property (weak, nonatomic) IBOutlet UIButton *errorQuestionsButton;
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;

@end
