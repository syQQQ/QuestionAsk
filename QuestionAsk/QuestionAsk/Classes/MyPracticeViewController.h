//
//  MyPracticeViewController.h
//  QuestionAsk
//
//  Created by SYQ on 14-8-19.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithBorder.h"
@interface MyPracticeViewController : UIViewController <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cells;
@property (retain, nonatomic) NSArray* myData;
@property (strong, nonatomic) IBOutlet ButtonWithBorder *startBtn;
- (IBAction)onClickStart:(id)sender;
@property (nonatomic) NSInteger curViewTag;
@end
