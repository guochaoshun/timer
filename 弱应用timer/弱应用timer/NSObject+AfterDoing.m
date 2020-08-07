//
//  NSObject+AfterDoing.m
//  直播
//
//  Created by ly on 2017/3/1.
//  Copyright © 2017年 ZST. All rights reserved.
//

#import "NSObject+AfterDoing.h"


@implementation NSObject (AfterDoing)


- (void) performBlockAfterDelay:(NSTimeInterval)delay  withDoBlock:(doBlock)block{
    
    [self performSelector:@selector(runBlock:) withObject:block afterDelay:delay];

}

- (void) runBlock:(doBlock)block {
    if (block) {
        block(self);
    }
}
+ (void) test {
    
}


@end


