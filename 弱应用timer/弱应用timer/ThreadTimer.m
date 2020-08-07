
//
//  WeakTimer.m
//  弱应用timer
//
//  Created by ly on 2017/4/28.
//  Copyright © 2017年 ZST. All rights reserved.
//

#import "ThreadTimer.h"
#import <objc/runtime.h>
#import "NSObject+AfterDoing.h"
@interface ThreadTimer ()

@property(nonatomic,assign) NSTimeInterval time ;
@property(nonatomic,weak) id target ;
@property(nonatomic,assign) SEL aSel ;
@property(nonatomic,weak) id userInfo ;
@property(nonatomic,assign) BOOL repeats ;
@end


@implementation ThreadTimer

- (instancetype)initWithTimerWithTimeInterval:(NSTimeInterval)time target:(id)target selector:( SEL)aSel userInfo:(id)userInfo repeats:(BOOL)repeats
{
    self = [super init];
    if (self) {
        _time = time ;
        _target = target ;
        _aSel = aSel ;
        _userInfo = userInfo ;
        _repeats = repeats ;
        
    }
    return self;
}


+ (instancetype) addTimerWithTimerWithTimeInterval:(NSTimeInterval)time target:(id)target selector:( SEL)aSel userInfo:(id)userInfo repeats:(BOOL)repeats {
    
    
    ThreadTimer * weakTimer = [[ThreadTimer alloc] initWithTimerWithTimeInterval:time target:target selector:aSel userInfo:userInfo repeats:repeats];
    
    if (repeats == NO) {
        [weakTimer.target performSelector:weakTimer.aSel withObject:userInfo afterDelay:time];
    } else {
        
        // 开辟新线程
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            while (1) {
                // 在新线程中sleep, 然后检查target是否还存在, 存在的话, 执行对应的事件
                [NSThread sleepForTimeInterval:time] ;
                if (weakTimer.target == nil || weakTimer.repeats == NO) {
                    break ;
                }
                [weakTimer.target performSelectorOnMainThread:weakTimer.aSel withObject:userInfo waitUntilDone:NO ];
                
            }
            
        });
    }
    
    
    return weakTimer ;
}

- (void)stopTimer {
    self.repeats = NO ;
}

- (void)dealloc {
    
    NSLog(@"WeakTimer dealloc") ;
    
}




@end
