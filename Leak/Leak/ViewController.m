//
//  ViewController.m
//  Leak
//
//  Created by quanzhen on 16/7/23.
//  Copyright © 2016年 baoyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *leakTableView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"leak";
    self.dataArray = @[@"FirstViewController",@"BlockViewController"];
    [self.view addSubview:self.leakTableView];
}

- (UITableView *)leakTableView
{
    if (!_leakTableView) {
        _leakTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _leakTableView.delegate = self;
        _leakTableView.dataSource = self;
        _leakTableView.tableFooterView = [UIView new];
        [_leakTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _leakTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class viewController = NSClassFromString([self.dataArray objectAtIndex:indexPath.row]);
    [self.navigationController pushViewController:(UIViewController *)[viewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
