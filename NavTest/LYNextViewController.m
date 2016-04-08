//
//  LYNextViewController.m
//  NavTest
//
//  Created by Leo on 16/3/31.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "LYNextViewController.h"
#import "LYDetailViewController.h"

@interface LYNextViewController ()

@end

@implementation LYNextViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    UIButton *navLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navLeftBtn.frame = CGRectMake(0, 0, 35, 35);
    [navLeftBtn addTarget:self action:@selector(handleNavLeftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [navLeftBtn setTitle:@"3左" forState:UIControlStateNormal];
    navLeftBtn.backgroundColor = [UIColor redColor];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navLeftBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"第三个界面中";
    self.navigationItem.titleView = label;
    
    UIButton *navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navRightBtn.frame = CGRectMake(0, 0, 35, 35);
    [navRightBtn setTitle:@"3右" forState:UIControlStateNormal];
    navRightBtn.backgroundColor = [UIColor redColor];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navRightBtn];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = self.view.center;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(handleButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)handleNavLeftBtnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)handleButtonAction {
    LYDetailViewController *detailVC = [[LYDetailViewController alloc] init];
    detailVC.status = @"nextVC";
    [self.navigationController pushViewController:detailVC animated:YES];
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
