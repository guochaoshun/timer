//
//  WeakTimer.h
//  弱应用timer
//
//  Created by ly on 2017/4/28.
//  Copyright © 2017年 ZST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadTimer : NSObject


+ (instancetype) addTimerWithTimerWithTimeInterval:(NSTimeInterval)time target:(id)target selector:( SEL)aSel userInfo:(id)userInfo repeats:(BOOL)repeats ;
- (void)stopTimer;

@end
