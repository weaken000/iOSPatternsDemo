//
//  HomeCellViewModel.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ListModel;

@interface HomeCellViewModel : NSObject

@property (nonatomic, strong, readonly) ListModel *item;
@property (nonatomic, strong, readonly) UIColor *titleColor;

- (instancetype)initWithItem:(ListModel *)item;

@end

NS_ASSUME_NONNULL_END
