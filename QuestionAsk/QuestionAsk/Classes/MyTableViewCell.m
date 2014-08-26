//
//  MyTableViewCell.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-26.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    
}

- (void)setMyImages:(NSMutableArray *)images
{
    for (UIImage *image in images) {
        [self.myImages addObject:image];
    }

    for (int i = 0; i < self.images.count; i++) {
        UIImageView *iv = [self.images objectAtIndex:i];
        [iv setImage:[images objectAtIndex:i]];
    }
}
@end
