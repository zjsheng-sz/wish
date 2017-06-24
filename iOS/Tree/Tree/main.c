//
//  main.c
//  Tree
//
//  Created by autel on 17/6/24.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    int febo(int n);
    
//    for (int i = 0; i < 10; i ++) {
    
        printf("%d\n",febo(10));
//    }
    
    return 0;
}


int febo(int n){

    
//    if (n == 0 || n == 1) {
//        return 1;
//    }
    if (n == 1) {
        return 1;
    }
    
    if (n == 2) {
        return 2;
    }
//    1,2,4,7,12,
    
    return febo(n - 1) + febo( n - 2) + 1;
    
    return 0;
    
}


