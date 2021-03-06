//
//  MYIconFontViewController.m
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/8.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "MYIconFontViewController.h"
#import "TBCityIconFont.h"
#import "MYActionSheet.h"
#import "UIImage+TBCityIconFont.h"
#import "MYPassWordView.h"

@interface MYIconFontViewController ()

@end

@implementation MYIconFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iconfont实战";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 150, 30, 30)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e603", 30, [UIColor redColor])];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, CGRectGetMaxY(imageView.frame) + 20, 40, 40);
    [self.view addSubview:button];
    [button setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e60c", 40, [UIColor redColor])] forState:UIControlStateNormal];
    [button setTintColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(button.frame) + 20, 280, 40)];
    [self.view addSubview:label];
    label.font = [UIFont fontWithName:@"iconfont" size:15];
    label.text = @"这是用label显示的iconfont  \U0000e60c";
    
    MYPassWordView *passWordView = [[MYPassWordView alloc] init];
    passWordView.frame = CGRectMake(50, CGRectGetMaxY(label.frame) + 10, 300, 50);
    passWordView.passWordNum = 6;
    passWordView.squareWidth = 45;
    passWordView.pointRadius = 6;
    [self.view addSubview:passWordView];
}

- (void)buttonClick:(UIButton *)sender {
    MYActionSheet *actionSheet = [MYActionSheet sheetWithTitle:@"测试" cancelButtonTitle:@"取消" clicked:^(MYActionSheet * _Nonnull actionSheet, NSInteger buttonIndex) {
        
    } otherButtonTitles:@"确定", nil];
    
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
    [indexSet addIndex:1];
    actionSheet.destructiveButtonIndexSet = indexSet;
    actionSheet.destructiveButtonColor = [UIColor redColor];
    
    [actionSheet show];
}

@end
