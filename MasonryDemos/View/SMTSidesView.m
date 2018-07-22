//
//  SMTSidesView.m
//  MasonryDemos
//
//  Created by SeaMoonTime on 2018/7/22.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTSidesView.h"

@implementation SMTSidesView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    UIView *lastView = self;
    for (int i = 0; i < 7; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(5, 10, 15, 20));
        }];
        
        lastView = view;
    }
    
    
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = arc4random()%256/256.0; // 0.0 to 1
    CGFloat saturation = arc4random()%128/256.0 + 0.5; //0.5 to 1.0,away from white
    CGFloat brightness = arc4random()%128/256.0 + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
