//
//  SMTDistributeView.m
//  MasonryDemos
//
//  Created by Yang on 30/07/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTDistributeView.h"

@implementation SMTDistributeView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i<4; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self addSubview:view];
        [arr addObject:view];
    }
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:5 tailSpacing:5];
    [arr makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
    NSMutableArray *arr2 = @[].mutableCopy;
    for (int i = 0; i<4; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self addSubview:view];
        [arr2 addObject:view];
    }
    
    [arr2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:30 leadSpacing:200 tailSpacing:30];
    [arr2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@150);
        make.height.equalTo(@60);
    }];
    
    return self;
}


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
