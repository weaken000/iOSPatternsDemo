//
//  HomeStore.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import <Foundation/Foundation.h>
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeStore : NSObject

@property (nonatomic, strong) NSMutableArray<ListModel *> *datas;

@property (nonatomic, strong) NSDictionary *searchConfig;

- (void)loadFirstPageListComplete:(void (^)(BOOL success))complete;

- (void)loadMoreListComplete:(void (^)(BOOL success))complete;

- (void)loadSearchConfig:(void (^)(BOOL success))config;

@end

NS_ASSUME_NONNULL_END
