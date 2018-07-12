//
//  SCBaseModel.h
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,SCSex) {
    SCSexMan,
    SCSexWoman,
    SCSexSecurity
};

/**
 使用YYkit中转化model的方式
 */
@interface SCHomeModel : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) SCSex sex;

@property (nonatomic, assign) NSUInteger pages;

@end
