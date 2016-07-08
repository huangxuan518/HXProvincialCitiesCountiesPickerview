//
//  HXAddressManager.m
//  HXProvincialCitiesCountiesPickerview
//  github:https://github.com/huangxuan518 博客：blog.libuqing.com
//  Created by 黄轩 on 16/7/8.
//  Copyright © 2016年 黄轩. All rights reserved.
//

#import "HXAddressManager.h"

@interface HXAddressManager ()

@end

@implementation HXAddressManager

+ (instancetype)shareInstance {
    static HXAddressManager *_addressManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _addressManager = [[self alloc] init];
    });
    return _addressManager;
}

- (NSArray *)provinceDicAry {
    if (!_provinceDicAry) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
        _provinceDicAry = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _provinceDicAry;
}

@end
