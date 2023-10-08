#include<stdio.h>

int main(){
    char* t = "123456789\r\n";
    printf("%ld:%s",sizeof(t),t);
}