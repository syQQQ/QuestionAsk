//
//  ViewController.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-14.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property NSString* data;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *backRects;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *usenameLable;

@end
