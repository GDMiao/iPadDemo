//
//  ProjectsListViewController.m
//  i-Report
//
//  Created by Alex on 2018/11/25.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "ProjectsListViewController.h"
#import "ProjectsListCell.h"
@interface ProjectsListViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ProjectsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addProjectsListView];
    [self setNavigationBarRightItemWithTitle:@"退出登录" actionBlock:^(UIButton * _Nonnull button) {
        NSLog(@"退出登录");
    }];
}

- (void)addProjectsListView {
    UIView *superView = self.view;
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
    searchBar.placeholder  = @"请输入工程项目名称/合同号/客户所属集团";
    [superView addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@70);
        make.left.right.equalTo(@0);
        make.height.equalTo(@50);
    }];
    
    UIView *groupTitleView = [[UIView alloc] init];
    groupTitleView.backgroundColor = RGB(16, 136, 254);
    [superView addSubview:groupTitleView];
    UILabel *contractName = [UILabel new];
    UILabel *projectName = [UILabel new];
    contractName.textColor = [UIColor whiteColor];
    projectName.textColor = [UIColor whiteColor];
    contractName.text = @"合同号";
    projectName.text = @"项目名称";
    [groupTitleView addSubview:contractName];
    [groupTitleView addSubview:projectName];
    [groupTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(searchBar.mas_bottom);
        make.left.right.equalTo(searchBar);
        make.height.equalTo(@50);
    }];
    [contractName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(groupTitleView.mas_left).offset(80);
        make.centerY.equalTo(groupTitleView);
    }];
    [projectName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(groupTitleView.mas_centerX).offset(50);
        make.centerY.equalTo(groupTitleView);
    }];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 80.0;
    tableView.rowHeight = 80.0f;
    tableView.tableFooterView = [UIView new];
    [tableView registerNib:[UINib nibWithNibName:@"ProjectsListCell" bundle:nil] forCellReuseIdentifier:@"listCell"];
    [superView addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(groupTitleView.mas_bottom);
        make.left.right.bottom.equalTo(superView);
    }];
    self.tableView = tableView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select Row at %ld",(long)indexPath.row);
}

#pragma mark - UISearchBarDelegate
// 搜索按钮点击的回调
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"搜索 更新数据源");
}
@end
