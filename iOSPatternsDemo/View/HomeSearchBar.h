//
//  HomeSearchBar.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HomeSearchViewModel;

@interface HomeSearchBar : UIView

- (void)bindVM:(HomeSearchViewModel *)vm;

@end

NS_ASSUME_NONNULL_END
