//
//  HomeStore.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeStore.h"

@implementation HomeStore

- (void)loadFirstPageListComplete:(void (^)(BOOL))complete {
    NSArray *list = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
    if (!list) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.datas removeAllObjects];
            for (int i = 0; i < 10; i++) {
                ListModel *m = [ListModel new];
                m.ID = [NSString stringWithFormat:@"%d", i];
                m.name = [NSString stringWithFormat:@"%@ pp", m.ID];
                m.age = @"16";
                [self.datas addObject:m];
            }
            complete(YES);
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [NSKeyedArchiver archiveRootObject:self.datas toFile:[self path]];
            });
        });
    } else {
        [self.datas removeAllObjects];
        [self.datas addObjectsFromArray:list];
        complete(YES);
    }
}

- (void)loadMoreListComplete:(void (^)(BOOL))complete {
    if (!self.datas.count) {
        [self loadMoreListComplete:complete];
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ListModel *last = self.datas.lastObject;
            for (int i = 0; i < 10; i++) {
                ListModel *m = [ListModel new];
                m.ID = [NSString stringWithFormat:@"%d", [last.ID intValue] + 1 + i];
                m.name = [NSString stringWithFormat:@"%@ pp", m.ID];
                m.age = @"16";
                [self.datas addObject:m];
            }
            complete(YES);
        });
    }
}

- (void)loadSearchConfig:(void (^)(BOOL))config {
    
}

- (NSString *)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    NSString *dstPath = [documentDir stringByAppendingPathComponent:@"user.data"];
    return dstPath;
}

- (NSMutableArray<ListModel *> *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

@end
