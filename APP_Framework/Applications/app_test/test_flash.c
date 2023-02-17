#include <stdio.h>
#include <string.h>
#include <transform.h>

void TestFlash(void)
{
    int fd = open(FLASH_DEV_DRIVER,O_RDWR);
    if(fd<0){
        printf("fs fd open error:%d\n",fd);
        return;
    }
    struct BusBlockWriteParam flash_writer;
    uint8_t read_buff[8] = {1,2,3,4,5,6,7,8};
    flash_writer.pos = 0x000000L;
    flash_writer.size = 8;
    flash_writer.buffer = read_buff;
    struct BusBlockReadParam flash_reader;
    flash_reader.pos = 0x000000L;
    flash_reader.size = 8;
    flash_reader.buffer = read_buff;    

    PrivRead(fd,&flash_reader,NONE);
    printf("Read data is:");
    for(int i=0;i<flash_writer.size;i++){
        printf("%02x ",read_buff[i]);
        read_buff[i]++;
    }
    printf("\n");

    PrivWrite(fd,&flash_writer,NONE);

    return;
}

PRIV_SHELL_CMD_FUNCTION(TestFlash, a flash test sample, PRIV_SHELL_CMD_MAIN_ATTR);