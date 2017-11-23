//
//  MYNotificationViewController.m
//  MYSampleCode
//
//  Created by sunjinshuai on 2017/11/23.
//  Copyright © 2017年 MYSampleCode. All rights reserved.
//

#import "MYNotificationViewController.h"

@interface MYNotificationViewController ()

@end

@implementation MYNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 往通知中心添加观察者
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:@"MyNAME"
                                               object:nil];
    
    NSLog(@"register notifcation thread = %@", [NSThread currentThread]);
    
    // 创建子线程，在子线程中发送通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"post notification thread = %@", [NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNAME" object:nil userInfo:nil];
    });
    
    
}

/**
 处理通知的方法
 
 @param notification notification
 */
- (void)handleNotification:(NSNotification *)notification {
    //打印处理通知方法的线程
    NSLog(@"handle notification thread = %@", [NSThread currentThread]);
}

@end
