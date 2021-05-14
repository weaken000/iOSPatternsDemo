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

@interface HomeViewController ()

@property (nonatomic, strong) HomeView *mainView;

@property (nonatomic, strong) HomeViewModel *homeVM;

@property (nonatomic, strong) HomeStore *store;

@end

@implementation HomeViewController

- (void)loadView {
    self.homeVM = [[HomeViewModel alloc] init];
    self.store = [[HomeStore alloc] init];
    self.mainView = [[HomeView alloc] initWithVM:self.homeVM store:self.store];
    self.view = self.mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


@end
