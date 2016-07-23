//
//  KVCViewController.m
//  Leak
//
//  Created by quanzhen on 16/7/23.
//  Copyright © 2016年 baoyan. All rights reserved.
//

#import "KVCViewController.h"
#import "UIControl+BlocksKit.h"

@interface KVCViewController ()

@property (strong, nonatomic) UIButton *changeColor;

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.changeColor addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:self.changeColor];
}

- (UIButton *)changeColor
{
    if (!_changeColor) {
        _changeColor = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeColor setTitle:@"ChangeColor" forState:UIControlStateNormal];
        [_changeColor setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _changeColor.frame = CGRectMake(0, 0, 200, 40);
        _changeColor.center = self.view.center;
        __weak typeof(self) weakSelf = self;
        [_changeColor bk_addEventHandler:^(id  _Nonnull sender) {
            int r = arc4random() % 255;
            int g = arc4random() % 255;
            int b = arc4random() % 255;
            weakSelf.changeColor.backgroundColor = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeColor;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"backgroundColor"]) {
        NSLog(@"%@",change.allValues);
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.changeColor removeObserver:self forKeyPath:@"backgroundColor"];
}

@end
