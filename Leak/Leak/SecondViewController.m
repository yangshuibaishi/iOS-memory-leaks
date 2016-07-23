//
//  SecondViewController.m
//  Leak
//
//  Created by quanzhen on 16/7/23.
//  Copyright © 2016年 baoyan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (strong, nonatomic) UIViewController *suViewController;

//@property (strong, nonatomic) NSMutableArray *array;
//
//@property (strong, nonatomic) NSHashTable *hashTable;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SecondViewController";
    self.viewController.view.backgroundColor = [UIColor grayColor];
    
//    self.array = [NSMutableArray array];
//    [self.array addObject:self.viewController];
    
//    self.hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
//    [self.hashTable addObject:self.viewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
