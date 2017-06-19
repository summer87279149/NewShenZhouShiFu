//
//  HomeViewController.m
//  NewShenZhouShiFu
//
//  Created by Admin on 2017/6/14.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "HomeHeaderView.h"
#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *cellArr;
@property (nonatomic, strong) HomeHeaderView *headerView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
}



-(UITableView*)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableHeaderView = self.headerView;
        _tableview.tableFooterView = [UIView new];
//        [_tableview registerNib:[UINib nibWithNibName:@"HomeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
        _tableview.estimatedRowHeight = 130;
        _tableview.rowHeight = UITableViewAutomaticDimension;
//        [_tableview addHeaderWithTarget:self action:@selector(headRequest)];
//        [_tableview addFooterWithTarget:self action:@selector(footRequest)];
//        _tableview.emptyDataSetSource = self;
//        _tableview.emptyDataSetDelegate = self;
    }
    return _tableview;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"CellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:tableCell];
    }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.cellArr) {
    }
    
    return cell;
}

-(HomeHeaderView*)headerView{
    if(!_headerView){
        _headerView = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 500) andImgArr:[NSMutableArray arrayWithCapacity:0] didSelectItemCallBack:^(NSInteger clickedIndex) {
            
        } searchButtonClicked:^(id x) {
            
        } view8btnClicked:^(NSInteger viewTag) {
            
        }];
    }
    return _headerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
