//
//  HomeHeaderView.m
//  NewShenZhouShiFu
//
//  Created by Admin on 2017/6/14.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "SDCycleScrollView.h"
#import "HomeHeaderView.h"

@interface HomeHeaderView()<SDCycleScrollViewDelegate>
@property (nonatomic, copy) ClicKImg block;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) SDCycleScrollView *topScrollView;
@end
@implementation HomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame andImgArr:(NSMutableArray*)arr didSelectItemCallBack:(ClicKImg)block{
    self = [super initWithFrame:frame];
    if (self) {
        self.arr = arr;
        self.block = [block copy];
        _topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) imageNamesGroup:self.arr];
        /** 设置占位图*/
        _topScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
        /** 获取网络图片的index*/
        _topScrollView.delegate = self;
        /** 添加到当前View上*/
        [self addSubview:_topScrollView];
    }
    return self;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    self.block(index);
}
@end
