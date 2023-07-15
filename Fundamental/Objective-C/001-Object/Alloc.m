//
//  Alloc.m
//  Fundamental
//
//  Created by Leo on 2023/7/15.
//

#import "Alloc.h"
#import "Person.h"

@implementation Alloc

#pragma mark - 测试Alloc创建过程
- (void)testAlloc {
	Person *p1 = [Person alloc];
	Person *p2 = [p1 init];
	Person *p3 = p1;

	NSLog(@"p1: %@ - %p - %p", p1, p1, &p1);
	NSLog(@"p2: %@ - %p - %p", p2, p2, &p2);
	NSLog(@"p3: %@ - %p - %p", p3, p3, &p3);
}

- (void)testNew {
	Person *p1 = [Person new];
	NSLog(@"p1: %@ - %p - %p", p1, p1, &p1);
}

#pragma mark - 测试编译优化
- (void)testOptimizationLevel {
	int a = 10;
	int b = 20;
	int c = [self sum:a with:b];
	NSLog(@"查看编译器优化情况:%d",c);
}

// 加法
- (int)sum:(int)a with:(int)b {
	return a + b;
}

@end
