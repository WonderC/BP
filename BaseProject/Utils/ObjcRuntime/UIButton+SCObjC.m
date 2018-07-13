//
//  UIButton+SCObjC.m
//  BaseProject
//
//  Created by wonderC on 2017/3/13.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "UIButton+SCObjC.h"
#import "SCObjcRuntime.h"

@interface UIButton()

@property (nonatomic,assign) BOOL isIgnoreEvent;//是否忽略响应时间间隔
@end

@implementation UIButton (SCObjC)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Swizzle(self, @selector(sendAction:to:forEvent:), @selector(SCSendAction:to:forEvent:));
    });
}

- (NSTimeInterval)timeInterval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval{
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval),OBJC_ASSOCIATION_ASSIGN);
}

- (void)SCSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    if (self.isIgnoreButton) {
        [self SCSendAction:action to:self forEvent:event];
        return;
    }
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        //默认时间间隔1.5s
        self.timeInterval = self.timeInterval==0 ? 1.5 : self.timeInterval;
        
        if (self.isIgnoreEvent) {
            return;
        }else if(self.timeInterval > 0){
            [self performSelector:@selector(resetStatus) withObject:nil afterDelay:self.timeInterval];
        }
    }
    
    self.isIgnoreEvent = YES;
    [self SCSendAction:action to:target forEvent:event];
}

- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isIgnoreEvent{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsIgnoreButton:(BOOL)isIgnoreButton{
    objc_setAssociatedObject(self, @selector(isIgnoreButton), @(isIgnoreButton), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isIgnoreButton{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)resetStatus{
    [self setIsIgnoreEvent:NO];
}

@end
