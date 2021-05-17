//
//  HomeView.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeView.h"
#import "HomeListCell.h"
#import "HomeTableViewDataSource.h"
#import "HomeSearchViewModel.h"

@interface HomeView()<UITableViewDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) HomeSearchBar *searchBar;

@property (nonatomic, strong) HomeTableViewDataSource *dataSource;

@property (nonatomic, strong) HomeViewModel *homeVM;
@property (nonatomic, strong) HomeStore *store;

@property (nonatomic, assign) BOOL draging;
@property (nonatomic, assign) BOOL refreshing;

@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (void)bindVM:(HomeViewModel *)vm store:(HomeStore *)store {
    self.homeVM = vm;
    self.store = store;
    
    __weak typeof(self) weakSelf = self;
    [self.store loadFirstPageListComplete:^(BOOL success) {
        [weakSelf loadEnd:success];
    }];
    [self.store loadSearchConfig:^(BOOL success) {
        HomeSearchViewModel *vm = [[HomeSearchViewModel alloc] initWithConfig:weakSelf.store.searchConfig];
        [weakSelf.searchBar bindVM:vm];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.searchBar.frame = CGRectMake(0, statusBarH, self.frame.size.width, 44);
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.frame.size.width, self.frame.size.height - CGRectGetMaxY(self.searchBar.frame));
}

- (void)setupSubviews {
    
    self.searchBar = [[HomeSearchBar alloc] init];
    [self addSubview:self.searchBar];
    
    self.dataSource = [[HomeTableViewDataSource alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [UIView new];
    [self addSubview:self.tableView];
}

- (void)loadEnd:(BOOL)success {
    self.refreshing = NO;
    if (success) {
        [self.dataSource updateDatas:self.store.datas];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.homeVM log:[NSString stringWithFormat:@"%@", self.store.datas[indexPath.row].name]];
    [self.delegate homeView:self didClickItem:self.store.datas[indexPath.row]];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.draging = YES;
    [self.searchBar resignFirstResponder];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.draging = NO;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.draging || self.refreshing) return;
    
    //网络请求加载
    if (scrollView.contentOffset.y <= -50) {
        self.refreshing = YES;
        __weak typeof(self) weakSelf = self;
        [self.store loadFirstPageListComplete:^(BOOL success) {
            [weakSelf loadEnd:success];
        }];
    } else if (scrollView.contentOffset.y > 0) {
        if (scrollView.contentSize.height <= scrollView.frame.size.height && scrollView.contentOffset.y > 30) {
            self.refreshing = YES;
            __weak typeof(self) weakSelf = self;
            [self.store loadMoreListComplete:^(BOOL success) {
                [weakSelf loadEnd:success];
            }];
        } else if (scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height - 50) {
            self.refreshing = YES;
            __weak typeof(self) weakSelf = self;
            [self.store loadMoreListComplete:^(BOOL success) {
                [weakSelf loadEnd:success];
            }];
        }
    }
}

@end
