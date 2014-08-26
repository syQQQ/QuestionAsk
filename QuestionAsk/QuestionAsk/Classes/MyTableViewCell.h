//
//  MyTableViewCell.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-26.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (retain, nonatomic) NSMutableArray *myImages;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *images;
- (void)setMyImages:(NSMutableArray*)images;
@end
