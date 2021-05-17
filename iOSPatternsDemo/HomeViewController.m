//
//  ViewController.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeViewController.h"

#import "HomeView.h"
#import "HomeViewModel.h"
#import "HomeStore.h"

@interface HomeViewController ()<HomeViewDelegate>

@property (nonatomic, strong) HomeView *mainView;

@property (nonatomic, strong) HomeViewModel *homeVM;

@property (nonatomic, strong) HomeStore *store;

@end

@implementation HomeViewController

- (void)loadView {
    
    self.mainView = [[HomeView alloc] init];
    self.view = self.mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.homeVM = [[HomeViewModel alloc] init];
    self.store = [[HomeStore alloc] init];
    self.mainView.delegate = self;
    [self.mainView bindVM:self.homeVM store:self.store];
}

#pragma mark - HomeViewDelegate
- (void)homeView:(HomeView *)homeView didClickItem:(ListModel *)item {
    [self presentViewController:[HomeViewController new] animated:YES completion:nil];
}

@end
