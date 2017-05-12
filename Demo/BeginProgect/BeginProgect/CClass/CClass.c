//
//  CClass.c
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/12.
//  Copyright © 2017年 markran. All rights reserved.
//

#include "CClass.h"

int sum3(int a, int b)
{
    return a + b;
}

void desc3() {
    int (*p)(int, int);
    p = sum3;
    int result = p(10,10);
    printf("swift->C output: %d\n",result);
}

