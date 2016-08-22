# SYAlertController 仿系统弹窗控件

仿系统UIAlertViewController弹窗控件，支持自定制，相同的创建方式，可支持6.0以上系统

#弹窗的创建
与系统相同的方式创建控件，包括标题和内容，style支持两种风格SYAlertStyleDefault和SYAlertStyleActionSheet

//普通弹窗

SYAlertController *alert = [SYAlertController sharedWithTitle:@"默认风格标题 三按钮" message:@"默认风格" style:SYAlertStyleDefault];

//自定制弹窗

SYAlertController *alert = [SYAlertController sharedWithAttTitle:attTitle attMessage:attMessage style:SYAlertStyleActionSheet];

#按钮的创建和添加
按钮同样仿系统方式创建，支持三种类型SYActionStyleCancel、SYActionStyleDefault、SYActionStyleDestructive

创建

SYAlertAction *cancel = [SYAlertAction actionWithTitle:@"取消" style:SYActionStyleCancel handler:^(SYAlertAction *action) {
        NSLog(@"%@", action);
    }];

按钮同样支持自定制

SYAlertAction *action1 = [SYAlertAction actionWithAttTitle:attCancel style:SYActionStyleCancel handler:^(SYAlertAction *action) {
NSLog(@"%@", action);
}];


添加

按钮的添加有两种方法，单个添加和批量添加

[alert addAlertAction:cancel];

[alert addAlertActions:@[按钮, 按钮]];

#控件的显示

[alert show];

#注意
使用控件时，要在[alert show];之前添加按钮，否则按钮添加无效

如有任何问题可联系我  QQ 1102210843  TEL 18610863095  

gitHub: https://github.com/1102210843/SYAlertController
