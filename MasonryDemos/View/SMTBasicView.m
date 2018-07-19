//
//  SMTBasicView.m
//  MasonryDemos
//
//  Created by Yang on 19/07/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTBasicView.h"

@implementation SMTBasicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    
    UIView *superView = self;
    int padding = 8;
    
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.top).offset(padding*2);//top&left use positive padding
        make.leading.equalTo(superView.leading).offset(padding);
        make.trailing.equalTo(redView.leading).offset(-padding);//bottom&right use negative padding
        make.width.equalTo(redView.width);
        make.height.equalTo(superView.height).multipliedBy(1.0/2.0);
        //        make.height.equalTo(@200);
        
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.top).offset(padding*2);
        make.trailing.equalTo(superView.trailing).offset(-padding);
        make.height.equalTo(greenView.height);
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.bottom).offset(padding);
        make.leading.equalTo(superView.leading).offset(padding);
        make.trailing.equalTo(superView.trailing).offset(-padding);
        make.bottom.equalTo(superView.bottom).offset(-padding);
    }];
    
    return self;
}

@end
