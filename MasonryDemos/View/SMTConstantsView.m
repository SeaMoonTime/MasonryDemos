//
//  SMTConstantsView.m
//  MasonryDemos
//
//  Created by SeaMoonTime on 2018/7/22.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTConstantsView.h"

@implementation SMTConstantsView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    UIView *purpleView = [UIView new];
    purpleView.backgroundColor = [UIColor purpleColor];
    purpleView.layer.borderColor = UIColor.blackColor.CGColor;
    purpleView.layer.borderWidth = 2;
    [self addSubview:purpleView];
    
    UIView *orangeView = [UIView new];
    orangeView.backgroundColor = UIColor.orangeColor;
    orangeView.layer.borderColor = UIColor.blackColor.CGColor;
    orangeView.layer.borderWidth = 2;
    [self addSubview:orangeView];
    
    //example of using constants
    [purpleView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.leading.equalTo(@20);
        make.bottom.equalTo(@-20);
        make.trailing.equalTo(@-20);
    }];
    
    // auto-boxing macros allow you to simply use scalars and structs, they will be wrapped automatically
    
    [orangeView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(CGPointMake(0, 50));
        make.size.equalTo(CGSizeMake(200, 100));
    }];
    
    return self;
}

@end
