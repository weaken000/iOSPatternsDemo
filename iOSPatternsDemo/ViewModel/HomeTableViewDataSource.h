//
//  HomeTableViewDataSource.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewDataSource : NSObject<UITableViewDataSource>

- (void)updateDatas:(NSArray<ListModel *> *)datas;

@end

NS_ASSUME_NONNULL_END
