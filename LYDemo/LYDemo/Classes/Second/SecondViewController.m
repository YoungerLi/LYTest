//
//  SecondViewController.m
//  LYDemo
//
//  Created by liyang on 2018/1/3.
//  Copyright © 2018年 kosien. All rights reserved.
//

#import "SecondViewController.h"
#import "LYHealthManager.h"

@interface SecondViewController ()
{
    UIButton *_button;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Iron Man";
    
    _button = [Tools createButtonWithFrame:CGRectMake(100, 100, 200, 100) backgroundColor:[UIColor redColor] title:@"点击获取步数" addTarget:self action:@selector(click)];
    [self.view addSubview:_button];
}

- (void)click
{
    [[LYHealthManager defaultManager] getStepCount:^(NSInteger steps, NSError *error) {
        if (error) {
            NSLog(@"error = %@", error);
        } else {
            [_button setTitle:[NSString stringWithFormat:@"今日走了%zd步", steps] forState:UIControlStateNormal];
        }
    }];
}



@end
