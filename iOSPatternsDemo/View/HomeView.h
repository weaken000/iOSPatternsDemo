//
//  HomeView.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import <UIKit/UIKit.h>
#import "HomeSearchBar.h"
#import "HomeViewModel.h"
#import "HomeStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HomeSearchBar *searchBar;

- (instancetype)initWithVM:(HomeViewModel *)viewModel store:(HomeStore *)store;

@end

NS_ASSUME_NONNULL_END
