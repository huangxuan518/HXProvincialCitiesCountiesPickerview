//
//  HXAddressManager.h
//  HXProvincialCitiesCountiesPickerview
//  github:https://github.com/huangxuan518 博客：blog.libuqing.com
//  Created by 黄轩 on 16/7/8.
//  Copyright © 2016年 黄轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXAddressManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic,strong) NSArray *provinceDicAry;//省字典数组

#define kAddressManager [HXAddressManager shareInstance]

@end
