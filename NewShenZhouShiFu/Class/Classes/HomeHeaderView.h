//
//  HomeHeaderView.h
//  NewShenZhouShiFu
//
//  Created by Admin on 2017/6/14.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^ClicKImg)(NSInteger clickedIndex);
typedef void(^ClicKView)(NSInteger viewTag);
@interface HomeHeaderView : UIView
-(instancetype)initWithFrame:(CGRect)frame andImgArr:(NSMutableArray*)arr didSelectItemCallBack:(ClicKImg)block searchButtonClicked:(void(^)(id  x))btnBlock view8btnClicked:(ClicKView)viewBlock;
NS_ASSUME_NONNULL_END
@end
