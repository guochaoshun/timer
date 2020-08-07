//
//  NSTimer+Category.h
//  弱应用timer
//
//  Created by 珠珠 on 2020/8/7.
//  Copyright © 2020 ZST. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^timerActionBlock)(NSTimer * _Nonnull blockTimer);

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Category)

//+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block API_AVAILABLE(macosx(10.12), ios(10.0), watchos(3.0), tvos(10.0));
// 这个方法是10.0以上系统才有的,按照这样的思路自己写一个,10.0以下的系统就能用了.
+ (NSTimer *)gcs_addTimerInRunLoopWithTimeInterval:(NSTimeInterval)interval targetObject:(id)target repeats:(BOOL)repeats block:(timerActionBlock)block  ;


@end

NS_ASSUME_NONNULL_END
