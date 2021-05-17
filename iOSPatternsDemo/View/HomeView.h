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

@class HomeView;

@protocol HomeViewDelegate <NSObject>

- (void)homeView:(HomeView *)homeView didClickItem:(ListModel *)item;

@end

@interface HomeView : UIView

@property (nonatomic, weak) id<HomeViewDelegate> delegate;

@property (nonatomic, strong, readonly) UITableView *tableView;

@property (nonatomic, strong, readonly) HomeSearchBar *searchBar;

- (void)bindVM:(HomeViewModel *)vm store:(HomeStore *)store;

@end

NS_ASSUME_NONNULL_END
