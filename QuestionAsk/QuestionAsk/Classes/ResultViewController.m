//
//  ResultViewController.m
//  QuestionAsk
//
//  Created by 苏依泉 on 14-8-25.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "ResultViewController.h"
#import "MyTableViewCell.h"
@interface ResultViewController ()

@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self setEdgesForExtendedLayout:UIRectEdgeNone];
//    self.edgesForExtendedLayout = UIExtendedEdgeNone;
    self.myTabelView.delegate = self;
    self.myTabelView.dataSource = self;
//    self.myTabelView setScrollIndicatorInsets
//    [self.myTabelView headerViewForSection:1];
//    self.myTabelView.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 1; i < 26; i++) {
        if (i % 5 == 0) {
            NSMutableArray *arr1 = [NSMutableArray array];
            for (int j = i - 4; j <= i; j++) {
                [arr1 addObject:[NSNumber numberWithInt:j]];
            }
            [arr addObject:arr1];
//            [arr1 removeAllObjects];
        }
    }
    NSString *string = [[NSString alloc]init];
    if (section < 1) {
        string = [NSString stringWithFormat:@"    %@             %@             %@             %@             %@", [[arr objectAtIndex:section]objectAtIndex:0], [[arr objectAtIndex:section]objectAtIndex:1], [[arr objectAtIndex:section]objectAtIndex:2], [[arr objectAtIndex:section]objectAtIndex:3], [[arr objectAtIndex:section]objectAtIndex:4]];
    }else if (section == 1) {
        string = [NSString stringWithFormat:@"    %@             %@             %@             %@            %@", [[arr objectAtIndex:section]objectAtIndex:0], [[arr objectAtIndex:section]objectAtIndex:1], [[arr objectAtIndex:section]objectAtIndex:2], [[arr objectAtIndex:section]objectAtIndex:3], [[arr objectAtIndex:section]objectAtIndex:4]];
    }else{
        string = [NSString stringWithFormat:@"   %@           %@           %@           %@           %@", [[arr objectAtIndex:section]objectAtIndex:0], [[arr objectAtIndex:section]objectAtIndex:1], [[arr objectAtIndex:section]objectAtIndex:2], [[arr objectAtIndex:section]objectAtIndex:3], [[arr objectAtIndex:section]objectAtIndex:4]];
    }
    
    return string;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
//    [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
//    UIImageView *right = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"题先生UI规范_07.png"]];
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:[UIImage imageNamed:@"题先生UI规范_05.png"]];
    [arr addObject:[UIImage imageNamed:@"题先生UI规范_05.png"]];
    [arr addObject:[UIImage imageNamed:@"题先生UI规范_07.png"]];
    [arr addObject:[UIImage imageNamed:@"题先生UI规范_07.png"]];
    [arr addObject:[UIImage imageNamed:@"题先生UI规范_07.png"]];
    [cell setMyImages:arr];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
