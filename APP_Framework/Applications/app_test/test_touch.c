#include <stdio.h>
#include <string.h>
#include <transform.h>

#define NULL_PARAMETER 0

void TestTouch(void)
{
    int touch_fd = PrivOpen(TOUCH_DEV_DRIVER, O_RDWR);
    if (touch_fd < 0)
    {
        printf("open touch fd error:%d\n", touch_fd);
        return;
    }

    // draw text
    struct TouchDataStandard touch_pixel;
    memset(&touch_pixel,0,sizeof(touch_pixel));

    while(1){
        if(0 > PrivRead(touch_fd, &touch_pixel, NULL_PARAMETER)){
            printf("read touch error\n");
            return;            
        }
        printf("touch pixel position x:%d,y:%d\n",touch_pixel.x,touch_pixel.y);
    }
    PrivClose(touch_fd);
}

PRIV_SHELL_CMD_FUNCTION(TestTouch, a touch test sample, PRIV_SHELL_CMD_MAIN_ATTR);