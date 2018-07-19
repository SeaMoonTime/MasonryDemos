//
//  ViewController.m
//  MasonryDemos
//
//  Created by Yang on 16/07/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    
    UIView *superView = self.view;
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif


@end
