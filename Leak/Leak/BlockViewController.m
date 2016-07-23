//
//  BlockViewController.m
//  Leak
//
//  Created by quanzhen on 16/7/23.
//  Copyright © 2016年 baoyan. All rights reserved.
//

#import "BlockViewController.h"
#import "UIControl+BlocksKit.h"

@interface BlockViewController ()
{
    NSString *_petName;
}

@property (strong, nonatomic) UIButton *changeColor;
@property (copy,   nonatomic) NSString *name;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.changeColor];
    self.name = @"BlockViewController";
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
            weakSelf.view.backgroundColor = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1];
            
//            _name = @"changeColor"; // 会被编译成 self.name      这里可以使用weakSelf.name
//            _petName = @"dog";      // 会被编译成 self->_petName 这里可以使用weakSelf->_petName
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
