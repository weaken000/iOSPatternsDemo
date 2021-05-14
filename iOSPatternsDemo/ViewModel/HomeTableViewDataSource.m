//
//  HomeTableViewDataSource.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "HomeTableViewDataSource.h"
#import "HomeListCell.h"

@implementation HomeTableViewDataSource {
    NSArray<ListModel *> *_datas;
}

- (void)updateDatas:(NSArray<ListModel *> *)datas {
    _datas = datas;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HomeListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _datas[indexPath.row].ID;
    return cell;
}

@end
