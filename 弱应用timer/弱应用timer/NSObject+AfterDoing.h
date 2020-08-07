//
//  NSObject+AfterDoing.h
//  直播
//
//  Created by ly on 2017/3/1.
//  Copyright © 2017年 ZST. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^doBlock)(id object);

@interface NSObject (AfterDoing)


/**
    用block做延迟的处理.不用再写一个函数了
    如果想要取消,用这种    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(runBlock:) object:blockl];
 */
- (void) performBlockAfterDelay:(NSTimeInterval)delay  withDoBlock:(doBlock)block ;

+ (void) test ;


@end

