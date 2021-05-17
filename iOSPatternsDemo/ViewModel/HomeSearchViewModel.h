//
//  HomeSearchViewModel.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSearchViewModel : NSObject

@property (nonatomic, strong, readonly) NSDictionary *config;

- (instancetype)initWithConfig:(NSDictionary *)config;

@end

NS_ASSUME_NONNULL_END
