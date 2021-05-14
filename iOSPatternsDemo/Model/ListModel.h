//
//  ListModel.h
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;

@end

NS_ASSUME_NONNULL_END
