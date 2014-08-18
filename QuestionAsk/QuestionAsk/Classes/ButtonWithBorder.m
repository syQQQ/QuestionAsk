//
//  ButtonWithBorder.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-18.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "ButtonWithBorder.h"

@implementation ButtonWithBorder

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addBorder];
}
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addBorder];
    }
    return self;
}

- (void)addBorder
{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:6.0];
    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:CGColorCreate(CGColorSpaceCreateDeviceRGB() ,(CGFloat[]){204, 204, 204, 1})];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
