//
//  HomeView.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeView.h"
#import "HomeListCell.h"
#import "HomeTableViewDataSource.h"

@interface HomeView()<UITableViewDelegate>

@property (nonatomic, strong) HomeTableViewDataSource *dataSource;

@property (nonatomic, strong) HomeViewModel *homeVM;
@property (nonatomic, strong) HomeStore *store;


@property (nonatomic, assign) BOOL draging;
@property (nonatomic, assign) BOOL refreshing;

@end

@implementation HomeView

- (instancetype)initWithVM:(HomeViewModel *)viewModel store:(nonnull HomeStore *)store {
    if (self == [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.homeVM = viewModel;
        self.store = store;
        [self setupSubviews];
    }
    return self;
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
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.draging = YES;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.draging = NO;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.draging || self.refreshing) return;
    
    //网络请求加载
    if (scrollView.contentOffset.y <= -50) {
        NSLog(@"下啦");
        self.refreshing = YES;
        __weak typeof(self) weakSelf = self;
        [self.store loadFirstPageListComplete:^(BOOL success) {
            [weakSelf loadEnd:success];
        }];
    } else if (scrollView.contentOffset.y > 0) {
        if (scrollView.contentSize.height <= scrollView.frame.size.height && scrollView.contentOffset.y > 30) {
            NSLog(@"上啦");
            self.refreshing = YES;
            __weak typeof(self) weakSelf = self;
            [self.store loadMoreListComplete:^(BOOL success) {
                [weakSelf loadEnd:success];
            }];
        } else if (scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height - 50) {
            NSLog(@"上啦");
            self.refreshing = YES;
            __weak typeof(self) weakSelf = self;
            [self.store loadMoreListComplete:^(BOOL success) {
                [weakSelf loadEnd:success];
            }];
        }
    }
}


@end
