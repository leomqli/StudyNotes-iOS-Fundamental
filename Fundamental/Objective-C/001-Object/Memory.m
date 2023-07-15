//
//  Memory.m
//  Fundamental
//
//  Created by Leo on 2023/7/15.
//

#import "Memory.h"
#import "Person.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct Struct1 {
	double a; // 8字节 [0 7]
	char b;   // 1字节 [8]
	int c;    // 4字节 (9 10 11 [12 15]
	short d;  // 2字节 [16 17]
}struct1;     // 24字节

struct Struct2 {
	double a; // 8字节 [0 7]
	int b;    // 4字节 [8 9 10 11]
	char c;   // 1字节 [12]
	short d;  // 2字节 (13 [14 15]
}struct2;     // 16字节

struct Struct3 {
	double a; // 8字节 [0 7]
	int b;    // 4字节 [8 9 10 11]
	char c;   // 1字节 [12]
	short d;  // 2字节 (13 [14 15]
	int e;    // 4字节 [16 19]
	struct Struct1 str; // 常规方式：将Struct1的元素代入
						// double a; 8字节 (20 21 22 23 [24 31]
						// char b;   1字节 [32]
						// int c;    4字节 (33 34 35 [36 39]
						// short d;  2字节 [40 41]
						//
						// 快捷方式：直接将Struct1看作一个元素
						// 24字节 (20 21 22 23 [24 47]
}struct3;     // 48字节

void floatToHEX(float f) {
	union uuf {
		float f;
		char s[4];
	} uf;
	
	uf.f = f;
	
	printf("0x");
	
	for (int i = 3; i >= 0; i--) printf("%02x", 0xff & uf.s[i]);
	
	printf("\n");
}

void doubleToHEX(double d) {
	union uud {
		double d;
		char s[8];
	} ud;
	
	ud.d = d;
	
	printf("0x");
	
	for (int i = 7; i >= 0; i--) printf("%02x", 0xff & ud.s[i]);
	
	printf("\n");
}

@implementation Memory

+ (void)getStruct {
	NSLog(@"%lu-%lu-%lu", sizeof(struct1), sizeof(struct2), sizeof(struct3));
}

+ (void)getHEX {
	floatToHEX(190.5);
	doubleToHEX(190.5);
}

+ (void)getPerson {
	Person *person = [Person alloc];
	person.name    = @"Leo";
	person.age     = 18;
	NSLog(
		  @"%@ - %lu - %lu - %lu",
		  person,
		  sizeof(person),
		  class_getInstanceSize([Person class]),
		  malloc_size((__bridge const void *)(person))
		  );
}

@end
