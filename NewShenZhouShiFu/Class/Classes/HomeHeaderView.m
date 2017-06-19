//
//  HomeHeaderView.m
//  NewShenZhouShiFu
//
//  Created by Admin on 2017/6/14.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "BtnView.h"
#import "SDCycleScrollView.h"
#import "HomeHeaderView.h"

@interface HomeHeaderView()<SDCycleScrollViewDelegate,UISearchBarDelegate>
@property (nonatomic, strong) RACSubject *searchButtonClicked;
@property (nonatomic, copy) ClicKView viewClicked;
@property (nonatomic, copy) ClicKImg block;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) SDCycleScrollView *topScrollView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIImageView *searchBarLeftImg;
@end
@implementation HomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame andImgArr:(NSMutableArray*)arr didSelectItemCallBack:(ClicKImg)block searchButtonClicked:(void(^)(id  x))btnBlock view8btnClicked:(ClicKView)viewBlock{
    self = [super initWithFrame:frame];
    if (self) {
        self.arr = arr;
        self.block = [block copy] ;
        self.viewClicked = [viewBlock copy];
        self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(50, 10, frame.size.width-70, 40)];
        self.searchBar.delegate = self;
        self.searchBar.placeholder = @"搜索商家";
        [self addSubview: self.searchBar];
        [self.searchButtonClicked subscribeNext:^(id  _Nullable x) {
            btnBlock(x);
        }];
        _topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, frame.size.width, 200) imageNamesGroup:self.arr];
        _topScrollView.placeholderImage = [UIImage imageNamed:@"AppIcon"];
        _topScrollView.delegate = self;
        [self addSubview:_topScrollView];
        
        // 8 btn
        UINib *nib = [UINib nibWithNibName:@"BtnView" bundle:nil];
        for (int i=0;i<2; ++i) {
            for (int j = 0; j<4; ++j) {
                BtnView *view = [nib  instantiateWithOwner:self options:nil][0];
                view.tag = 200+(i+1)*(j+1);
                view.frame = CGRectMake(5+(kScreenWidth/4-10+10)*j, (_topScrollView.frame.size.height+_topScrollView.frame.origin.y+10)+(kScreenWidth/4-10+10)*i, kScreenWidth/4-10, kScreenWidth/4-10);
                [self addSubview:view];
                view.backgroundColor = XTRandomColor;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewOnClicked:)];
                [view addGestureRecognizer:tap];
            }
        }
        // Find Tec
        UIView *v = [UIView new];
        v.frame = CGRectMake(0, _topScrollView.frame.size.height+_topScrollView.frame.origin.y+10+kScreenWidth/4-50+10+kScreenWidth/4-50+10, kScreenWidth, 40);
        [self addSubview:v];
        v.backgroundColor = [UIColor redColor];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.bottom.mas_equalTo(self);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}

-(void)viewOnClicked:(UITapGestureRecognizer*)tap{
    if (self.viewClicked) {
        self.viewClicked(tap.view.tag);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.block) {
         self.block(index);
    }
}

#pragma mark - searchBarDelegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchButtonClicked sendNext:searchBar.text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@",searchText);
}

-(RACSubject*)searchButtonClicked{
    if(!_searchButtonClicked){
        _searchButtonClicked = [RACSubject subject];
    }
    return _searchButtonClicked;
}

@end
