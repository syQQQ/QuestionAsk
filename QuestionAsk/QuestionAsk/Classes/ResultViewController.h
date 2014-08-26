//
//  ResultViewController.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-25.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTabelView;
@property (retain, nonatomic) NSMutableArray *dataSource;
@property(nonatomic,assign) BOOL automaticallyAdjustsScrollViewInsets NS_AVAILABLE_IOS(7_0); // Defaults to YES
@end
