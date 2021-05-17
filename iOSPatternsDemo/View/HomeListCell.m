//
//  HomeListCell.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeListCell.h"
#import "HomeCellViewModel.h"
#import "ListModel.h"

@implementation HomeListCell

- (void)bindVM:(HomeCellViewModel *)vm {
    self.textLabel.text = vm.item.ID;
    self.textLabel.textColor = vm.titleColor;
}

@end
