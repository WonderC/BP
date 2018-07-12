//
//  ObjcRuntime.h
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCObjcRuntime : NSObject

/**
 获取对象属性列表

 @param object 对象
 @return 返回对象属性列表
 */
NSDictionary *GetPropertyListOfObject(NSObject *object);

/**
 获取类的属性列表

 @param c 类名
 @return 返回类的属性列表
 */
NSDictionary *GetPropertyListOfClass(Class c);

/**
 runtime方法交换

 @param c 类
 @param orginSel 原来方法
 @param newSel 替换方法
 */
void Swizzle(Class c,SEL orginSel,SEL newSel);

@end
