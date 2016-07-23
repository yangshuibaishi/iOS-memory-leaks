//
//  FirstViewController.m
//  Leak
//
//  Created by quanzhen on 16/7/23.
//  Copyright © 2016年 baoyan. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) UIButton *pushButton;
@property (strong, nonatomic) SecondViewController *secondViewController;

@end

@implementation FirstViewController

- (void)dealloc
{
    NSLog(@"%@ dealloc",[self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"FirstViewController";
    [self.view addSubview:self.pushButton];
}

- (void)pushButtonClicked
{
    self.secondViewController = [[SecondViewController alloc]init];
    self.secondViewController.viewController = self;
    [self.navigationController pushViewController:self.secondViewController animated:YES];
}

- (UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pushButton.frame = CGRectMake(0, 0, 200, 30);
        _pushButton.center = self.view.center;
        [_pushButton setTitle:@"toSecondViewController" forState:UIControlStateNormal];
        _pushButton.backgroundColor = [UIColor cyanColor];
        [_pushButton addTarget:self action:@selector(pushButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
