//
//  AnsweCardViewController.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"
@interface AnswerCardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet ButtonWithBorder *submitBtn;

@end
