#include <transform.h>
#include"region_layer.h"
#define SHOW_RGB_BUF_SIZE (320*240*2)
#define AI_KPU_RGB_BUF_SIZE (320*240*3)
#define KMODEL_SIZE (388776)    //face model size
#define ANCHOR_NUM 5
#define KPUIMAGEWIDTH (320)
#define KPUIMAGEHEIGHT (240)


static float anchor[ANCHOR_NUM * 2] = {1.889,2.5245,  2.9465,3.94056, 3.99987,5.3658, 5.155437,6.92275, 6.718375,9.01025};


#define THREAD_PRIORITY_FACE_D  (11)
static pthread_t  facetid = 0;
static void* thread_face_detcet_entry(void *parameter);
static int g_fd = 0;
static int kmodel_fd = 0;
static int  if_exit = 0;
static unsigned char  * showbuffer = NULL ;
static unsigned char  * kpurgbbuffer = NULL ;

static _ioctl_shoot_para shoot_para_t = {0};
unsigned char  * model_data = NULL;     //kpu data  load memory
unsigned char *model_data_align  = NULL;

kpu_model_context_t face_detect_task;
static region_layer_t face_detect_rl;
static obj_info_t face_detect_info;
volatile uint32_t g_ai_done_flag;

static void ai_done(void *ctx)
{
    g_ai_done_flag = 1;
}



void face_detect()
{
    int ret = 0;
    int result = 0;
    int size = 0;
    g_fd = open("/dev/ov2640",O_RDONLY);
    if(g_fd < 0)
    {
        printf("open ov2640 fail !!");
        return;
    }
    showbuffer = (unsigned char*)malloc(SHOW_RGB_BUF_SIZE);
    if(NULL ==showbuffer)
    {
        close(g_fd);
        printf("showbuffer apply memory fail !!");
        return ;
    }
    kpurgbbuffer = (unsigned char*)malloc(AI_KPU_RGB_BUF_SIZE);
    if(NULL ==kpurgbbuffer)
    {
        close(g_fd);
        free(showbuffer);
        printf("kpurgbbuffer apply memory fail !!");
        return ;
    }
    model_data = (unsigned char *)malloc(KMODEL_SIZE + 255);
    if(NULL ==model_data)
    {
        free(showbuffer);
        free(kpurgbbuffer);
        close(g_fd);
        printf("model_data apply memory fail !!");
        return ;
    }
    memset(model_data,0,KMODEL_SIZE + 255);
    memset(showbuffer,0,SHOW_RGB_BUF_SIZE);
    memset(kpurgbbuffer,0,AI_KPU_RGB_BUF_SIZE);
    shoot_para_t.pdata = (unsigned int *)(showbuffer);
    shoot_para_t.length = SHOW_RGB_BUF_SIZE;
    /*
        load memory 
    */
    kmodel_fd = open("/kmodel/detect.kmodel",O_RDONLY);
    if(kmodel_fd <0)
    {
            printf("open kmodel fail");
            close(g_fd);
            free(showbuffer);
            free(kpurgbbuffer);
            free(model_data);
            return;
    }
    else
    {
         size = read(kmodel_fd, model_data, KMODEL_SIZE);
         if(size != KMODEL_SIZE)
         {
            printf("read kmodel error size %d\n",size);
            close(g_fd);
            close(kmodel_fd);
            free(showbuffer);
            free(kpurgbbuffer);
            free(model_data);
            return;
            
         }
         else
         {
             printf("read kmodel success \n");
         }

    }
    unsigned char *model_data_align = (unsigned char *)(((unsigned int)model_data+255)&(~255));
    dvp_set_ai_addr((uint32_t)kpurgbbuffer, (uint32_t)(kpurgbbuffer + 320 * 240), (uint32_t)(kpurgbbuffer + 320 * 240 * 2));
    if (kpu_load_kmodel(&face_detect_task, model_data_align) != 0)
    {
        printf("\nmodel init error\n");
        close(g_fd);
        close(kmodel_fd);
        free(showbuffer);
        free(kpurgbbuffer);
        free(model_data);
        return;
    }
    face_detect_rl.anchor_number = ANCHOR_NUM;
    face_detect_rl.anchor = anchor;
    face_detect_rl.threshold = 0.7;
    face_detect_rl.nms_value = 0.3;
    result = region_layer_init(&face_detect_rl, 20, 15, 30, KPUIMAGEWIDTH, KPUIMAGEHEIGHT);
    printf("region_layer_init result %d \n\r",result);    
    size_t stack_size = 32*1024;
    pthread_attr_t attr;      /* 线程属性 */
    struct sched_param prio;  /* 线程优先级 */
    prio.sched_priority = 8;  /* 优先级设置为 8 */
    pthread_attr_init(&attr);  /* 先使用默认值初始化属性 */
    pthread_attr_setschedparam(&attr,&prio);  /* 修改属性对应的优先级 */
    pthread_attr_setstacksize(&attr, stack_size);

    /* 创建线程 1, 属性为 attr，入口函数是 thread_entry，入口函数参数是 1 */
    result = pthread_create(&facetid,&attr,thread_face_detcet_entry,NULL);
    if (0 == result)
    {
        printf("thread_face_detcet_entry successfully!\n");
    }
    else
    {
        printf("thread_face_detcet_entry failed! error code is %d\n",result);
        close(g_fd);
    }     
}
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(face_detect,face detect task);
#endif
static void* thread_face_detcet_entry(void *parameter)
{   
    extern void lcd_draw_picture(uint16_t x1, uint16_t y1, uint16_t width, uint16_t height, uint32_t *ptr);
    printf("thread_face_detcet_entry start!\n");
    int ret = 0;
    //sysctl_enable_irq();
    while(1)
    {
        //memset(showbuffer,0,320*240*2);
        g_ai_done_flag = 0;
        ret = ioctl(g_fd,IOCTRL_CAMERA_START_SHOT,&shoot_para_t);
        if(RT_ERROR == ret)
        {
            printf("ov2640 can't wait event flag");
            rt_free(showbuffer);
            close(g_fd);
            pthread_exit(NULL);  
            return NULL;
        }
        kpu_run_kmodel(&face_detect_task, kpurgbbuffer, DMAC_CHANNEL5, ai_done, NULL);
        while(!g_ai_done_flag);
        float *output;
        size_t output_size;
        kpu_get_output(&face_detect_task, 0, (uint8_t **)&output, &output_size);
        face_detect_rl.input = output;        
        region_layer_run(&face_detect_rl, &face_detect_info);
        /* display result */
        #ifdef BSP_USING_LCD
        for (int face_cnt = 0; face_cnt < face_detect_info.obj_number; face_cnt++)
        {
            draw_edge((uint32_t *)showbuffer, &face_detect_info, face_cnt, 0xF800);
        }
        lcd_draw_picture(0, 0, 320, 240, (unsigned int*)showbuffer); 
        #endif
       usleep(1);
       if(1 == if_exit)
       {
          if_exit = 0;
          printf("thread_face_detcet_entry exit");
          pthread_exit(NULL);  
       }
    }

}

void face_detect_delete()
{
    if(showbuffer != NULL)
    {
        int ret = 0;
        close(g_fd);
        close(kmodel_fd);
        free(showbuffer);
        free(kpurgbbuffer);
        free(model_data);
        printf("face detect task cancel!!! ret %d ",ret);
        if_exit = 1;
    }
    
}
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(face_detect_delete,face detect task delete);
#endif
void kmodel_load(unsigned char  * model_data)
{
    int kmodel_fd = 0;
    int size = 0;
    kmodel_fd = open("/kmodel/detect.kmodel",O_RDONLY);
    
    model_data = (unsigned char *)malloc(KMODEL_SIZE + 255);
    if(NULL ==model_data)
    {
        printf("model_data apply memory fail !!");
        return ;
    }
    memset(model_data,0,KMODEL_SIZE + 255);
    
    if (kmodel_fd>= 0)
    {
         size = read(kmodel_fd, model_data, KMODEL_SIZE);
         if(size != KMODEL_SIZE)
         {
            printf("read kmodel error size %d\n",size);
            
         }
         else
         {
              printf("read kmodel success");
         }
    }
    else
    {
        free(model_data);
        printf("open kmodel fail");
    }
    
}
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(kmodel_load,kmodel load memory);
#endif

