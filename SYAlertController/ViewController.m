//
//  ViewController.m
//  SYAlertController
//
//  Created by 孙宇 on 16/8/19.
//  Copyright © 2016年 孙宇. All rights reserved.
//

#import "ViewController.h"
#import <SYAlertController/SYAlertController.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _titles = @[@"默认风格", @"默认风格，三个按钮", @"ActionSheet", @"ActionSheet 没有取消按钮"];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self defaultStyle];
            break;
        case 1:
            [self defaultStyleThreeButton];
            break;
        case 2:
            [self actionSheet];
            break;
        case 3:
            [self actionSheetNoCancel];
            break;
    }
}

#pragma mark - 弹窗
- (void)defaultStyle
{
    SYAlertController *alert = [SYAlertController sharedWithTitle:@"默认风格标题" message:@"默认风格message" style:SYAlertStyleDefault];
    SYAlertAction *cancel = [SYAlertAction actionWithTitle:@"取消" style:SYActionStyleCancel handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action = [SYAlertAction actionWithTitle:@"确定" style:SYActionStyleDefault handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    [alert addAlertAction:cancel];
    [alert addAlertAction:action];
    [alert show];
}

- (void)defaultStyleThreeButton
{
    SYAlertController *alert = [SYAlertController sharedWithTitle:@"默认风格标题 三按钮" message:@"默认风格" style:SYAlertStyleDefault];
    SYAlertAction *cancel = [SYAlertAction actionWithTitle:@"取消" style:SYActionStyleCancel handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action = [SYAlertAction actionWithTitle:@"确定" style:SYActionStyleDefault handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action1 = [SYAlertAction actionWithTitle:@"完成" style:SYActionStyleDestructive handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    [alert addAlertAction:cancel];
    [alert addAlertAction:action];
    [alert addAlertAction:action1];
    [alert show];
}


- (void)actionSheet
{
    SYAlertController *alert = [SYAlertController sharedWithTitle:@"actionSheet风格标题 三按钮" message:@"actionSheet风格" style:SYAlertStyleActionSheet];
    SYAlertAction *cancel = [SYAlertAction actionWithTitle:@"取消" style:SYActionStyleCancel handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action = [SYAlertAction actionWithTitle:@"确定" style:SYActionStyleDefault handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action1 = [SYAlertAction actionWithTitle:@"完成" style:SYActionStyleDestructive handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    [alert addAlertAction:cancel];
    [alert addAlertAction:action];
    [alert addAlertAction:action1];
    [alert show];
}


#pragma mark - ActionSheet 没有取消按钮
- (void)actionSheetNoCancel
{
    SYAlertController *alert = [SYAlertController sharedWithTitle:@"actionSheet风格标题 三按钮" message:@"actionSheet风格" style:SYAlertStyleActionSheet];
    
    SYAlertAction *action = [SYAlertAction actionWithTitle:@"确定" style:SYActionStyleDefault handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action1 = [SYAlertAction actionWithTitle:@"完成" style:SYActionStyleDestructive handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    [alert addAlertAction:action];
    [alert addAlertAction:action1];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
