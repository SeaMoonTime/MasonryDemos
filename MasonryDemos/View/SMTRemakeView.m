//
//  SMTRemakeView.m
//  MasonryDemos
//
//  Created by Yang on 20/07/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SMTRemakeView.h"

@interface SMTRemakeView()

@property(nonatomic, strong)UIButton *movingButton;
@property(nonatomic, assign)BOOL topLeft;

@end

@implementation SMTRemakeView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.movingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.movingButton setTitle:@"Move Me!" forState:UIControlStateNormal];
    self.movingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.movingButton.layer.borderWidth = 3;
    
    [self.movingButton addTarget:self action:@selector(toggleButtonPositon) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.movingButton];
    
    self.topLeft = YES;
    
    return self;
}

+(BOOL)requiresConstraintBasedLayout{
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
-(void)updateConstraints{
    [self.movingButton remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@200);
        make.height.equalTo(@200);
        
        if (self.topLeft) {
            make.leading.equalTo(self.leading).offset(10);
            make.top.equalTo(self.top).offset(10);
        } else {
            make.bottom.equalTo(self.bottom).offset(-10);
            make.trailing.equalTo(self.trailing).offset(-10);
        }
    }];
    
    //according to apple super should be called at the end of method
    [super updateConstraints];
}

-(void)toggleButtonPositon {
    self.topLeft = !self.topLeft;
    
    //tell contraints they need updating
    [self setNeedsUpdateConstraints];
    
    //update contraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
    
}




@end
