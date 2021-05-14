//
//  ListModel.m
//  iOSPatternsDemo
//
//  Created by weaken on 2021/5/14.
//

#import "ListModel.h"

@implementation ListModel

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.ID forKey:@"id"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.age forKey:@"age"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self == [super init]) {
        self.ID = [coder decodeObjectForKey:@"id"];
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeObjectForKey:@"age"];
    }
    return self;
}

@end
