#include <stdio.h>
#include <string.h>
#include <transform.h>

#define MAX_READ_LENGTH 1000

// sd card here is loaded as "/"
void TestSD(void)
{
    //open the file in sdcard
    int fd = open(SD_FPATH,O_RDWR|O_CREAT);
    char filewords[MAX_READ_LENGTH];
    memset(filewords,0,MAX_READ_LENGTH);

    //read and write then close file
    read(fd,filewords,MAX_READ_LENGTH);
    printf("read data is \n%s\n",filewords);
    const char *input_words = "these words are going to write in fs\n";
    write(fd,input_words,strlen(input_words));
    close(fd);

    //re-open the file and re-read the file
    fd = open(SD_FPATH,O_RDWR);
    read(fd,filewords,MAX_READ_LENGTH);
    printf("read data is \n%s\n",filewords);
    close(fd);

    return;
}

PRIV_SHELL_CMD_FUNCTION(TestSD, a sdcard test sample, PRIV_SHELL_CMD_MAIN_ATTR);