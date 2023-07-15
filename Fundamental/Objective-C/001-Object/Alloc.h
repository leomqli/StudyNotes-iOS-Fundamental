//
//  Alloc.h
//  Fundamental
//
//  Created by Leo on 2023/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Alloc : NSObject

#pragma mark - 测试Alloc创建过程

- (void)testAlloc;

- (void)testNew;

#pragma mark - 测试编译优化

- (void)testOptimizationLevel;

@end

NS_ASSUME_NONNULL_END
