//
//  MainTableViewController.m
//  MasonryDemos
//
//  Created by Yang on 19/07/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTMainTableViewController.h"
#import "SMTExampleViewController.h"
#import "SMTBasicView.h"
#import "SMTRemakeView.h"
#import "SMTConstantsView.h"
#import "SMTSidesView.h"
#import "SMTAspectFitView.h"
#import "SMTScrollView.h"
#import "SMTDistributeView.h"
#import "SMTVerticalDistributeView.h"


static NSString * const kMainCellIdentifier = @"kMainCellIdentifier";

@interface SMTMainTableViewController ()

@property(strong, nonatomic)NSArray *exampleControllers;

@end

@implementation SMTMainTableViewController

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = @"Examples";
    
    self.exampleControllers = @[[[SMTExampleViewController alloc]initWithTitle:@"Basic" viewClass:[SMTBasicView class]],
                                 [[SMTExampleViewController alloc]initWithTitle:@"Remake" viewClass:[SMTRemakeView class]],
                                [[SMTExampleViewController alloc]initWithTitle:@"Using Constants" viewClass:[SMTConstantsView class]],
                                 [[SMTExampleViewController alloc]initWithTitle:@"Composite Edges" viewClass:[SMTSidesView class]],
                                [[SMTExampleViewController alloc]initWithTitle:@"Aspect Fit" viewClass:[SMTAspectFitView class]],
                                [[SMTExampleViewController alloc]initWithTitle:@"ScrollView" viewClass:[SMTScrollView class]],
                                [[SMTExampleViewController alloc]initWithTitle:@"Horizontal Distribute View" viewClass:[SMTDistributeView class]],
                                [[SMTExampleViewController alloc]initWithTitle:@"Horizontal Distribute View" viewClass:[SMTVerticalDistributeView class]]
    ];

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMainCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    return cell;
}

#pragma mark - UITableViewController Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end
