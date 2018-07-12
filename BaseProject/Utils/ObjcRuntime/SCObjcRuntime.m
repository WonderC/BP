//
//  ObjcRuntime.m
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCObjcRuntime.h"

@implementation SCObjcRuntime

NSDictionary *GetPropertyListOfObject(NSObject *object){
    
    return GetPropertyListOfClass([object class]);
}

NSDictionary *GetPropertyListOfClass(Class c){
    
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    
    unsigned int outCount,i;
    objc_property_t *properties = class_copyPropertyList(c, &outCount);
    for (i = 0; i<outCount; i++) {
        objc_property_t property =  properties[i];
        const char *propName = property_getName(property);
        const char *propType = property_getAttributes(property);
        if (propName && propType) {
            NSArray *anAttribute = [[NSString stringWithUTF8String:propType] componentsSeparatedByString:@","];
            NSString *aType = anAttribute[0];
            
            [mutableDic setObject:aType forKey:[NSString stringWithUTF8String:propName]];
        }
    }
    free(properties);
    return mutableDic;
}

void Swizzle(Class c,SEL orginSel,SEL newSel){
    
    Method originMethod = class_getInstanceMethod(c, orginSel);
    Method newMethod = class_getInstanceMethod(c, newSel);
    
    if (!originMethod) {
        originMethod = class_getClassMethod(c, orginSel);
        if (!originMethod) {
            return;
        }
        newMethod = class_getClassMethod(c, newSel);
        if (!newMethod) {
            return;
        }
    }else{
        newMethod = class_getInstanceMethod(c, newSel);
        if (!newMethod) {
            return;
        }
    }
    
    if (class_addMethod(c, orginSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(c, newSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, newMethod);
    }
    
}

@end
