//
//  HomeSearchBar.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeSearchBar.h"
#import "HomeSearchViewModel.h"

@implementation HomeSearchBar {
    UITextField *_searchTF;
    UIButton    *_settingBtn;
    CALayer     *_sep;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _settingBtn.frame = CGRectMake(self.frame.size.width - 16 - CGRectGetWidth(_settingBtn.frame), 0, CGRectGetWidth(_settingBtn.frame), 44);
    _searchTF.frame = CGRectMake(16, 2, CGRectGetMinX(_settingBtn.frame) - 16 - 10, 40);
    _sep.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5);
}

- (void)setupSubviews {
    _searchTF = [[UITextField alloc] init];
    [self addSubview:_searchTF];
    
    _settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    [_settingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_settingBtn sizeToFit];
    [self addSubview:_settingBtn];
    
    _sep = [CALayer layer];
    _sep.backgroundColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:_sep];
}

- (void)bindVM:(HomeSearchViewModel *)vm {
    _searchTF.placeholder = vm.config[@"placeHolder"];
}

- (BOOL)resignFirstResponder {
    return [_searchTF resignFirstResponder];
}

@end
