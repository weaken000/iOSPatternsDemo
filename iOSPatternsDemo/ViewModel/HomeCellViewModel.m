//
//  HomeCellViewModel.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/17.
//

#import "HomeCellViewModel.h"
#import "ListModel.h"

@implementation HomeCellViewModel

- (instancetype)initWithItem:(ListModel *)item {
    if (self == [super init]) {
        _item = item;
        _titleColor = [_item.ID intValue] % 2 == 0 ? [UIColor blackColor] : [UIColor grayColor];
    }
    return self;
}

@end
