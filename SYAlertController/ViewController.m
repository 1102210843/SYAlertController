//
//  ViewController.m
//  SYAlertController
//
//  Created by 孙宇 on 16/8/18.
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
    
    _titles = @[@"默认风格", @"默认风格，三个按钮", @"ActionSheet", @"ActionSheet 没有取消按钮", @"自定制文字和按钮"];
    
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
        case 4:
            [self customAlert];
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

- (void)customAlert
{
    NSMutableAttributedString *attTitle = [[NSMutableAttributedString alloc]initWithString:@"自定制弹窗标题"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[UIFont systemFontOfSize:18] forKey:NSFontAttributeName];
    [dict setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    [attTitle addAttributes:dict range:NSMakeRange(0, 7)];
    [attTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:22] range:NSMakeRange(0, 5)];
    [attTitle addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 5)];
    
//    NSMutableAttributedString *attMessage = [[NSMutableAttributedString alloc]initWithString:@"自定制弹窗风格"];
//    NSMutableDictionary *messageDict = [NSMutableDictionary dictionary];
//    [messageDict setObject:[UIFont systemFontOfSize:16] forKey:NSFontAttributeName];
//    [messageDict setObject:[UIColor cyanColor] forKey:NSForegroundColorAttributeName];
//    [attMessage addAttributes:messageDict range:NSMakeRange(0, 7)];
//    [attMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
//    [attMessage addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 5)];
    
    NSMutableAttributedString *attSure = [[NSMutableAttributedString alloc]initWithString:@"确定"];
    NSMutableDictionary *sureDict = [NSMutableDictionary dictionary];
    [sureDict setObject:[UIFont systemFontOfSize:18] forKey:NSFontAttributeName];
    [sureDict setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    [attSure addAttributes:sureDict range:NSMakeRange(0, 2)];
    [attSure addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:22] range:NSMakeRange(0, 1)];
    [attSure addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 1)];
    
    NSMutableAttributedString *attCancel = [[NSMutableAttributedString alloc]initWithString:@"取消"];
    NSMutableDictionary *cancelDict = [NSMutableDictionary dictionary];
    [cancelDict setObject:[UIFont systemFontOfSize:18] forKey:NSFontAttributeName];
    [cancelDict setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    [attCancel addAttributes:cancelDict range:NSMakeRange(0, 2)];
    [attCancel addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:22] range:NSMakeRange(0, 1)];
    [attCancel addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 1)];
    
    
    SYAlertController *alert = [SYAlertController sharedWithTitle:attTitle message:@"自定制弹窗风格" style:SYAlertStyleActionSheet];
    SYAlertAction *action = [SYAlertAction actionWithAttTitle:attSure style:SYActionStyleDefault handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];
    SYAlertAction *action1 = [SYAlertAction actionWithAttTitle:attCancel style:SYActionStyleCancel handler:^(SYAlertAction *action) {
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
