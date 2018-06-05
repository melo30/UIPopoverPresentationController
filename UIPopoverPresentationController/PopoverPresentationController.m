//
//  PopoverPresentationController.m
//  UIPopoverPresentationController
//
//  Created by 陈诚 on 2018/6/5.
//  Copyright © 2018年 陈诚. All rights reserved.
//

#import "PopoverPresentationController.h"

@interface PopoverPresentationController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *addArray;

@end

@implementation PopoverPresentationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor yellowColor];
    self.addArray = [[NSMutableArray alloc] initWithObjects:@"扫一扫",@"加好友", @"创建讨论组",@"发送到电脑", @"面对面快传",@"收钱", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.addArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.addArray[indexPath.row]];
    return cell;
}

//重写preferredContentSize（iOS7之后）来返回最合适的大小，如果不重写，会返回一整个tableview尽管下面一部分cell是没有内容的，重写后只会返回有内容的部分，我这里还修改了宽，让它窄一点。可以尝试注释这一部分的代码来看效果，通过修改返回的size得到你期望的popover的大小。
- (CGSize)preferredContentSize {
    if (self.presentingViewController && self.tableView != nil) {
        CGSize tempSize = self.presentingViewController.view.bounds.size;
        tempSize.width = 150;
        CGSize size = [self.tableView sizeThatFits:tempSize];
        return size;
    }else {
        return [super preferredContentSize];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
