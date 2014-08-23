//
//  ButtonWithBorder.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-18.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "ButtonWithBorder.h"
#import "RGBHelper.h"
@implementation ButtonWithBorder

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
}
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (void)setStyle:(myStyle)style
{
    self.titleLabel.font = [UIFont fontWithName:@"System" size:22];
    switch (style) {
        case blue:
        {
            UIImage *backgroundImage = [UIImage imageNamed:@"btn_blue_bg.png"];
            backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]; //九宫格拉伸
            [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
            [self setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
            [self setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
        }
            break;
        case white:
        {
            UIImage *backgroundImage = [UIImage imageNamed:@"btn_white_bg.png"];
            backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]; //九宫格拉伸
            [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
            [self setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
        }
            break;
        case whiteAndRed:
        {
            UIImage *backgroundImage = [UIImage imageNamed:@"btn_white_bg.png"];
            backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]; //九宫格拉伸
            [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
            
            [self setTitleColor:[UIColor colorWithRed:[RGBHelper rgbChange:247] green:[RGBHelper rgbChange:76] blue:[RGBHelper rgbChange:49] alpha:1] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
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
