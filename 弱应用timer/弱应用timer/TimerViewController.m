//
//  TimerViewController.m
//  弱应用timer
//
//  Created by ly on 2017/4/28.
//  Copyright © 2017年 ZST. All rights reserved.
//

#import "TimerViewController.h"
#import "ThreadTimer.h"
#import "NSObject+AfterDoing.h"
#import "NSTimer+Category.h"

@interface TimerViewController ()

@property(nonatomic,strong) ThreadTimer * weak1 ;


@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self ;
    
    // 开启新线程来做timer的事情, 付出的代价有点大
//    _weak1 = [ThreadTimer addTimerWithTimerWithTimeInterval:1 target:self selector:@selector(hhh:) userInfo:@"新线程timer" repeats:YES] ;
    
    // 完美方案
    [NSTimer gcs_addTimerInRunLoopWithTimeInterval:1 targetObject:self repeats:YES block:^(NSTimer *blockTimer) {

        NSLog(@"自处理timer干活 %@ %@",blockTimer,weakSelf);
    }];
    
    // 系统方案
//    NSTimer * timer2 = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        // 还是需要在一个合适的时机把timer停掉, 如果注释掉的话,第二个timer就不会停止了
//        if (weakSelf == nil) {
//            [timer invalidate];
//            return ;
//        }
//
//        NSLog(@"第二个timer干活 %@ %@",timer,weakSelf);
//
//    }];
    
    
}



- (void)hhh:(NSString *)str {
    NSLog(@"hhh , %@",str);
}

- (void)dealloc {
    
    NSLog(@"TimerViewController dealloc") ;
    
}



@end
