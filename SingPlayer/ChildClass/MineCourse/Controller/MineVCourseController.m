//
//  MineVCourseController.m
//  SingPlayer
//
//  Created by 石燚 on 16/8/6.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "MineVCourseController.h"
#import "PlayViewController.h"

@interface MineVCourseController ()<UITableViewDelegate,UITableViewDataSource>

//点击下载更多按钮
@property (nonatomic, strong) UIButton *headerLabel;

//课程数组
@property (nonatomic, strong) NSMutableArray *courseArray;

//设置
@property (nonatomic, strong) UIBarButtonItem *settingBtn;

@property (nonatomic, strong) UITableView *tableview;

@end

@implementation MineVCourseController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataSource];
    
    [self initUserInterface];
    
}

- (void)initUserInterface {
    self.navigationItem.title = @"我的课程";
    
    self.navigationItem.rightBarButtonItem = self.settingBtn;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableview];
    
}

- (void)initDataSource {
    
}

#pragma mark - tableViewDataSourceAndDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
    cell.textLabel.text = self.courseArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayViewController *playView = [PlayViewController new];
    [self.navigationController pushViewController:playView animated:YES];
}

#pragma mark - getter
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"testCell"];
    }
    return _tableview;
}

- (NSMutableArray *)courseArray {
    if (!_courseArray) {
        _courseArray = [@[@"test"] mutableCopy];
    }
    return _courseArray;
}


@end
