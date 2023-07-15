//
//  Person.h
//  Fundamental
//
//  Created by Leo on 2023/4/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *name;

- (void)test;

@end

NS_ASSUME_NONNULL_END
