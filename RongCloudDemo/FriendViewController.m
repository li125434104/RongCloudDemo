//
//  FriendViewController.m
//  RongCloudDemo
//
//  Created by taishu on 2019/4/28.
//  Copyright © 2019 taishu. All rights reserved.
//

#import "FriendViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "SingleChatVC.h"

@interface FriendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *friendListArray;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self.view addSubview:self.tableView];
}

- (void)initData {
    self.friendListArray = [NSMutableArray arrayWithObjects:@{@"name":@"wb",
                                                              @"userId":@"002",
                                                              @"token":@"j0FHKYLJUm1glrldWlodHpZlA6KpGYVe4LH/cHsMew2edHXQD1KcksziJ3BG+/5BHqksXgaS5KUOJQrbgWO8mA=="}, nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indentationLevel =  2;
    cell.textLabel.text = self.friendListArray[indexPath.row][@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *userDic = self.friendListArray[indexPath.row];
    //新建一个聊天会话View Controller对象,建议这样初始化  设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    SingleChatVC *chat = [[SingleChatVC alloc] initWithConversationType:ConversationType_PRIVATE targetId:userDic[@"userId"]];
    //设置聊天会话界面要显示的标题
    chat.title = userDic[@"name"];
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
}

#pragma mark -- Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)friendListArray {
    if (!_friendListArray) {
        _friendListArray = [NSMutableArray array];
    }
    return _friendListArray;
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
