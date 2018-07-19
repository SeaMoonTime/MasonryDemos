//
//  SMTExampleViewController.m
//  MasonryDemos
//
//  Created by Yang on 19/07/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTExampleViewController.h"

@interface SMTExampleViewController ()

@property(nonatomic, strong) Class viewClass;

@end

@implementation SMTExampleViewController

-(id)initWithTitle:(NSString *)title viewClass:(Class)viewClass{
    self = [super init];
    if(!self) return nil;
    
    self.title = title;
    self.viewClass = viewClass;
    
    return self;
}

-(void)loadView {
    self.view = self.viewClass.new;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
