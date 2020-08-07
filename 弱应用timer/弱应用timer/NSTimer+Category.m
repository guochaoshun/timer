//
//  NSTimer+Category.m
//  弱应用timer
//
//  Created by 珠珠 on 2020/8/7.
//  Copyright © 2020 ZST. All rights reserved.
//

#import "NSTimer+Category.h"


@implementation NSTimer (Category)


+ (NSTimer *)gcs_addTimerInRunLoopWithTimeInterval:(NSTimeInterval)interval targetObject:(id)target repeats:(BOOL)repeats block:(timerActionBlock)block {
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:2];
    
    NSHashTable * table = [NSHashTable weakObjectsHashTable];
    [table addObject:target];
    
    [dic setObject:table forKey:@"target"];
    [dic setObject:block forKey:@"block"];
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(repeatBlock:) userInfo:dic repeats:repeats] ;
    
    return timer ;
}

+ (void)repeatBlock:(NSTimer *)timer {
    
    NSDictionary *  dic = timer.userInfo ;

    NSAssert([dic isKindOfClass:[NSDictionary class]], @"数据类型不对");
    timerActionBlock block = [dic objectForKey:@"block"];
    NSHashTable * table = dic[@"target"];
    id target = table.anyObject;

    if (target && block) {
        block(timer) ;
    } else {
        [timer invalidate];
        timer = nil;
    }
    
}



@end
