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

- (void)setStyle:(myStyle)style
{
    self.titleLabel.font = [UIFont fontWithName:@"System" size:22];
    if (style == blue) {
//        [self setBackgroundColor:[UIColor blueColor]];
        [self setBackgroundColor:[UIColor colorWithRed:[self rgbChange:23] green:[self rgbChange:183] blue:[self rgbChange:243] alpha:1.0f]];
    }else if (style == white) {
        [self setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0f]];
        self.titleLabel.textColor = [UIColor colorWithRed:[self rgbChange:247] green:[self rgbChange:76] blue:[self rgbChange:49] alpha:1];
    }
}

- (CGFloat)rgbChange:(NSInteger)num
{
    return num / 255.0f;
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
