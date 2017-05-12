//
//  OCClassForBridge.m
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/11.
//  Copyright © 2017年 markran. All rights reserved.
//

#import "OCClassForBridge.h"

#import "BeginProgect-Swift.h"

@implementation OCClassForBridge

- (void)desc22 {
    int (^p)(int, int);
    p = ^(int a, int b) {
        return a + b;
    };
    int result = p(10,40);
    NSLog(@"swift -> OC output result: %d\n",result);
    
    SwiftClass *sc = [[SwiftClass alloc] init];
    NSString *str = [sc sayHelloWithName:@"jeck"];
    
    NSLog(@"OC->swift output: %@",str);
}

int sum2(int a, int b) {
    return a + b;
}

- (void)desc2 {
    int(^p) (int, int);

    p = ^(int a, int b) {
        return a + b;
    };
    
    int result = p(10,40);
    printf("swift->oc output result: %d\n",result);
}

@end
