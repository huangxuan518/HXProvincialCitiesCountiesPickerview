//
//  HXProvincialCitiesCountiesPickerview.h
//  HXProvincialCitiesCountiesPickerview
//  github:https://github.com/huangxuan518 博客：blog.libuqing.com
//  Created by 黄轩 on 16/7/8.
//  Copyright © 2016年 黄轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXProvincialCitiesCountiesPickerview : UIView

@property (nonatomic,copy) void (^completion)(NSString *provinceName,NSString *cityName,NSString *countyName);

- (void)showPickerWithProvinceName:(NSString *)provinceName cityName:(NSString *)cityName countyName:(NSString *)countyName;//显示 省 市 县名

@end
