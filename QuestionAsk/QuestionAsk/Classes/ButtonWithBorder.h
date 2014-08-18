//
//  ButtonWithBorder.h
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-18.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, myStyle)
{
    blue,
    white
};

@interface ButtonWithBorder : UIButton
- (void)setStyle:(myStyle)style;
@end
