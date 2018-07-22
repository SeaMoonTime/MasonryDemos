//
//  SMTAspectFitView.m
//  MasonryDemos
//
//  Created by SeaMoonTime on 2018/7/22.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTAspectFitView.h"

@interface SMTAspectFitView()

@property(strong, nonatomic)UIView *topView;
@property(strong, nonatomic)UIView *topInnerView;
@property(strong, nonatomic)UIView *bottomView;
@property(strong, nonatomic)UIView *bottomInnerView;

@end

@implementation SMTAspectFitView

//designated initializer

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        
        // create views
        self.topView = [[UIView alloc]initWithFrame:CGRectZero];
        self.topInnerView = [[UIView alloc]initWithFrame:CGRectZero];
        self.bottomView = [[UIView alloc]initWithFrame:CGRectZero];
        self.bottomInnerView = [[UIView alloc]initWithFrame:CGRectZero];
        
        //set background colors
        UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
        [self.topView setBackgroundColor:blueColor];
        
        UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
        [self.topInnerView setBackgroundColor:lightGreenColor];
        
        UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
        [self.bottomView setBackgroundColor:pinkColor];
        
        UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
        [self.bottomInnerView setBackgroundColor:darkGreenColor];
        
        //layout top and bottom views to each take up half of the window
        [self addSubview:self.topView];
        [self.topView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.and.top.equalTo(self);
        }];
        
        [self addSubview:self.bottomView];
        [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.and.bottom.equalTo(self);
            make.top.equalTo(self.topView.bottom);
            make.height.equalTo(self.topView);
        }];
        
        //inner views are configured for aspect fit with ratio of 3:1
        [self.topView addSubview:self.topInnerView];
        [self.topInnerView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.topInnerView.height).multipliedBy(3);
            make.width.and.height.lessThanOrEqualTo(self.topView);
           make.width.and.height.equalTo(self.topView).width.priorityLow();
            make.center.equalTo(self.topView);
        }];
        
        [self.bottomView addSubview:self.bottomInnerView];
        [self.bottomInnerView makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.bottomInnerView.width).multipliedBy(3);
            make.width.and.height.lessThanOrEqualTo(self.bottomView);
            make.width.and.height.equalTo(self.bottomView).with.priorityLow();
            make.center.equalTo(self.bottomView);
        }];
        
        
        
    }
    
    
    return self;
}


@end
