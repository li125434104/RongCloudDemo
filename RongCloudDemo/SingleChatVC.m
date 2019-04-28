//
//  SingleChatVC.m
//  RongCloudDemo
//
//  Created by taishu on 2019/4/28.
//  Copyright © 2019 taishu. All rights reserved.
//

#import "SingleChatVC.h"

@implementation SingleChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
}

@end
