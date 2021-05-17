//
//  HomeSearchViewModel.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/17.
//

#import "HomeSearchViewModel.h"

@implementation HomeSearchViewModel

- (instancetype)initWithConfig:(NSDictionary *)config {
    if (self == [super init]) {
        _config = config;
    }
    return self;
}

@end
