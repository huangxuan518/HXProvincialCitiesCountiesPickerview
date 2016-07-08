//
//  HXViewController.m
//  HXProvincialCitiesCountiesPickerview
//  github:https://github.com/huangxuan518 博客：blog.libuqing.com
//  Created by 黄轩 on 16/7/8.
//  Copyright © 2016年 黄轩. All rights reserved.
//

#import "HXViewController.h"
#import "HXProvincialCitiesCountiesPickerview.h"

#import "HXAddressManager.h"

@interface HXViewController ()

@property (nonatomic,strong) HXProvincialCitiesCountiesPickerview *regionPickerView;
@property (nonatomic,strong) UILabel *addressLabel;

@end

@implementation HXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"地址选择器";
    
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 84, 44)];
    _addressLabel.text = @"广东 深圳 南山区";
    [self.view addSubview:_addressLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width - 74, 100, 64, 44);
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitle:@"地址选择" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)show:(UIButton *)sender {
    NSString *address = _addressLabel.text;
    NSArray *array = [address componentsSeparatedByString:@" "];
    
    NSString *province = @"";//省
    NSString *city = @"";//市
    NSString *county = @"";//县
    if (array.count > 2) {
        province = array[0];
        city = array[1];
        county = array[2];
    } else if (array.count > 1) {
        province = array[0];
        city = array[1];
    } else if (array.count > 0) {
        province = array[0];
    }

    [self.regionPickerView showPickerWithProvinceName:province cityName:city countyName:county];
}

- (HXProvincialCitiesCountiesPickerview *)regionPickerView {
    if (!_regionPickerView) {
        _regionPickerView = [[HXProvincialCitiesCountiesPickerview alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

        __weak typeof(self) wself = self;
        _regionPickerView.completion = ^(NSString *provinceName,NSString *cityName,NSString *countyName) {
            __strong typeof(wself) self = wself;
            self.addressLabel.text = [NSString stringWithFormat:@"%@ %@ %@",provinceName,cityName,countyName];
        };
        [self.navigationController.view addSubview:_regionPickerView];
    }
    return _regionPickerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
