//
//  CClassNO.c
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/12.
//  Copyright © 2017年 markran. All rights reserved.
//

#include <stdio.h>

int sum1(int a, int b)
{
    return a+b;
}

void desc1() {
    int (*p) (int, int);
    p = sum1;
    int result = p(10,20);
    printf("swift->C output result:%d\n",result);
}
