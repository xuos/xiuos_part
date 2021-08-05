#include <transform.h>
#ifdef LIB_USING_CJSON
#include <cJSON.h>
#endif
#include "region_layer.h"
#define ANCHOR_NUM 5
#define STACK_SIZE (128 * 1024)
#define JSON_FILE_PATH "/kmodel/detect.json"
#define JSON_BUFFER_SIZE (4 * 1024)

// params from json
static float anchor[ANCHOR_NUM * 2] = {};
static int net_output_shape[3] = {};
static int net_input_size[2] = {};
static int sensor_output_size[2] = {};
static char kmodel_path[127] = "";
static int kmodel_size = 0;
static float obj_thresh[20] = {};
static float nms_thresh = 0.0;
static char labels[20][32] = {};
static int class_num = 0;

#define THREAD_PRIORITY_FACE_D (11)
static pthread_t facetid = 0;
static void *thread_face_detcet_entry(void *parameter);
static int g_fd = 0;
static int kmodel_fd = 0;
static int if_exit = 0;
static unsigned char *showbuffer = NULL;
static unsigned char *kpurgbbuffer = NULL;

static _ioctl_shoot_para shoot_para_t = {0};
unsigned char *model_data = NULL;  // kpu data  load memory
unsigned char *model_data_align = NULL;

kpu_model_context_t face_detect_task;
static region_layer_t face_detect_rl;
static obj_info_t face_detect_info;
volatile uint32_t g_ai_done_flag;

static void ai_done(void *ctx) { g_ai_done_flag = 1; }

static void param_parse()
{
    int fin;
    char buffer[JSON_BUFFER_SIZE] = "";
    // char *buffer;
    // if (NULL != (buffer = (char*)malloc(JSON_BUFFER_SIZE * sizeof(char)))) {
    //     memset(buffer, 0, JSON_BUFFER_SIZE * sizeof(char));
    // } else {
    //     printf("Json buffer malloc failed!");
    //     exit(-1);
    // }
    int array_size;
    cJSON *json_obj;
    cJSON *json_item;
    cJSON *json_array_item;

    fin = open(JSON_FILE_PATH, O_RDONLY);
    if (!fin) {
        printf("Error open file %s", JSON_FILE_PATH);
        exit(-1);
    }
    read(fin, buffer, sizeof(buffer));
    close(fin);

    // read json string
    json_obj = cJSON_Parse(buffer);
    // free(buffer);
    char *json_print_str = cJSON_Print(json_obj);
    printf("Json file content: \n%s\n", json_print_str);
    cJSON_free(json_print_str);
    // get anchors
    json_item = cJSON_GetObjectItem(json_obj, "anchors");
    array_size = cJSON_GetArraySize(json_item);
    if (ANCHOR_NUM * 2 != array_size) {
        printf("Expect anchor size: %d, got %d in json file", ANCHOR_NUM * 2, array_size);
        exit(-1);
    } else {
        printf("Got %d anchors from json file\n", ANCHOR_NUM);
    }
    for (int i = 0; i < ANCHOR_NUM * 2; i++) {
        json_array_item = cJSON_GetArrayItem(json_item, i);
        anchor[i] = json_array_item->valuedouble;
        printf("%d: %f\n", i, anchor[i]);
    }
    // net_input_size
    json_item = cJSON_GetObjectItem(json_obj, "net_input_size");
    array_size = cJSON_GetArraySize(json_item);
    if (2 != array_size) {
        printf("Expect net_input_size: %d, got %d in json file", 2, array_size);
        exit(-1);
    } else {
        printf("Got %d net_input_size from json file\n", 2);
    }
    for (int i = 0; i < 2; i++) {
        json_array_item = cJSON_GetArrayItem(json_item, i);
        net_input_size[i] = json_array_item->valueint;
        printf("%d: %d\n", i, net_input_size[i]);
    }
    // net_output_shape
    json_item = cJSON_GetObjectItem(json_obj, "net_output_shape");
    array_size = cJSON_GetArraySize(json_item);
    if (3 != array_size) {
        printf("Expect net_output_shape: %d, got %d in json file", 3, array_size);
        exit(-1);
    } else {
        printf("Got %d net_output_shape from json file\n", 3);
    }
    for (int i = 0; i < 3; i++) {
        json_array_item = cJSON_GetArrayItem(json_item, i);
        net_output_shape[i] = json_array_item->valueint;
        printf("%d: %d\n", i, net_output_shape[i]);
    }
    // sensor_output_size
    json_item = cJSON_GetObjectItem(json_obj, "sensor_output_size");
    array_size = cJSON_GetArraySize(json_item);
    if (2 != array_size) {
        printf("Expect sensor_output_size: %d, got %d in json file", 2, array_size);
        exit(-1);
    } else {
        printf("Got %d sensor_output_size from json file\n", 2);
    }
    for (int i = 0; i < 2; i++) {
        json_array_item = cJSON_GetArrayItem(json_item, i);
        sensor_output_size[i] = json_array_item->valueint;
        printf("%d: %d\n", i, sensor_output_size[i]);
    }
    // kmodel_path
    json_item = cJSON_GetObjectItem(json_obj, "kmodel_path");
    memcpy(kmodel_path, json_item->valuestring, strlen(json_item->valuestring));
    printf("Got kmodel_path: %s\n", kmodel_path);
    // kmodel_size
    json_item = cJSON_GetObjectItem(json_obj, "kmodel_size");
    kmodel_size = json_item->valueint;
    printf("Got kmodel_size: %d\n", kmodel_size);
    // labels
    json_item = cJSON_GetObjectItem(json_obj, "labels");
    class_num = cJSON_GetArraySize(json_item);
    if (0 >= class_num) {
        printf("No labels!");
        exit(-1);
    } else {
        printf("Got %d labels\n", class_num);
    }
    for (int i = 0; i < class_num; i++) {
        json_array_item = cJSON_GetArrayItem(json_item, i);
        memcpy(labels[i], json_array_item->valuestring, strlen(json_array_item->valuestring));
        printf("%d: %s\n", i, labels[i]);
    }
    // obj_thresh
    json_item = cJSON_GetObjectItem(json_obj, "obj_thresh");
    array_size = cJSON_GetArraySize(json_item);
    if (class_num != array_size) {
        printf("label number and thresh number mismatch! label number : %d, obj thresh number %d", class_num, array_size);
        exit(-1);
    } else {
        printf("Got %d obj_thresh\n", array_size);
    }
    for (int i = 0; i < array_size; i++) {
        json_array_item = cJSON_GetArrayItem(json_item, i);
        obj_thresh[i] = json_array_item->valuedouble;
        printf("%d: %f\n", i, obj_thresh[i]);
    }
    // nms_thresh
    json_item = cJSON_GetObjectItem(json_obj, "nms_thresh");
    nms_thresh = json_item->valuedouble;
    printf("Got nms_thresh: %f\n", nms_thresh);

    cJSON_Delete(json_obj);
    return;
}

void face_detect()
{
    int ret = 0;
    int result = 0;
    int size = 0;
    param_parse();
    g_fd = open("/dev/ov2640", O_RDONLY);
    if (g_fd < 0) {
        printf("open ov2640 fail !!");
        return;
    }
    showbuffer = (unsigned char *)malloc(sensor_output_size[0] * sensor_output_size[1] * 2);
    if (NULL == showbuffer) {
        close(g_fd);
        printf("showbuffer apply memory fail !!");
        return;
    }
    kpurgbbuffer = (unsigned char *)malloc(net_input_size[0] * net_input_size[1] * 3);
    if (NULL == kpurgbbuffer) {
        close(g_fd);
        free(showbuffer);
        printf("kpurgbbuffer apply memory fail !!");
        return;
    }
    model_data = (unsigned char *)malloc(kmodel_size + 255);
    if (NULL == model_data) {
        free(showbuffer);
        free(kpurgbbuffer);
        close(g_fd);
        printf("model_data apply memory fail !!");
        return;
    }
    memset(model_data, 0, kmodel_size + 255);
    memset(showbuffer, 0, sensor_output_size[0] * sensor_output_size[1] * 2);
    memset(kpurgbbuffer, 0, net_input_size[0] * net_input_size[1] * 3);
    shoot_para_t.pdata = (unsigned int *)(showbuffer);
    shoot_para_t.length = (size_t)(sensor_output_size[0] * sensor_output_size[1] * 2);
    /*
        load memory
    */
    kmodel_fd = open(kmodel_path, O_RDONLY);
    if (kmodel_fd < 0) {
        printf("open kmodel fail");
        close(g_fd);
        free(showbuffer);
        free(kpurgbbuffer);
        free(model_data);
        return;
    } else {
        size = read(kmodel_fd, model_data, kmodel_size);
        if (size != kmodel_size) {
            printf("read kmodel error size %d\n", size);
            close(g_fd);
            close(kmodel_fd);
            free(showbuffer);
            free(kpurgbbuffer);
            free(model_data);
            return;

        } else {
            printf("read kmodel success \n");
        }
    }
    unsigned char *model_data_align = (unsigned char *)(((unsigned int)model_data + 255) & (~255));
    dvp_set_ai_addr((uint32_t)kpurgbbuffer, (uint32_t)(kpurgbbuffer + net_input_size[0] * net_input_size[1]),
                    (uint32_t)(kpurgbbuffer + net_input_size[0] * net_input_size[1] * 2));
    if (kpu_load_kmodel(&face_detect_task, model_data_align) != 0) {
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
    face_detect_rl.threshold = malloc(class_num * sizeof(float));
    for (int idx = 0; idx < class_num; idx++) {
        face_detect_rl.threshold[idx] = obj_thresh[idx];
    }
    face_detect_rl.nms_value = nms_thresh;
    result = region_layer_init(&face_detect_rl, net_output_shape[0], net_output_shape[1], net_output_shape[2],
                               net_input_size[1], net_input_size[0]);
    printf("region_layer_init result %d \n\r", result);
    size_t stack_size = STACK_SIZE;
    pthread_attr_t attr;                      /* 线程属性 */
    struct sched_param prio;                  /* 线程优先级 */
    prio.sched_priority = 8;                  /* 优先级设置为 8 */
    pthread_attr_init(&attr);                 /* 先使用默认值初始化属性 */
    pthread_attr_setschedparam(&attr, &prio); /* 修改属性对应的优先级 */
    pthread_attr_setstacksize(&attr, stack_size);

    /* 创建线程 1, 属性为 attr，入口函数是 thread_entry，入口函数参数是 1 */
    result = pthread_create(&facetid, &attr, thread_face_detcet_entry, NULL);
    if (0 == result) {
        printf("thread_face_detcet_entry successfully!\n");
    } else {
        printf("thread_face_detcet_entry failed! error code is %d\n", result);
        close(g_fd);
    }
}
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(face_detect, face detect task);
#endif

static void *thread_face_detcet_entry(void *parameter)
{
    extern void lcd_draw_picture(uint16_t x1, uint16_t y1, uint16_t width, uint16_t height, uint32_t * ptr);
    printf("thread_face_detcet_entry start!\n");
    int ret = 0;
    // sysctl_enable_irq();
    while (1) {
        // memset(showbuffer,0,320*240*2);
        g_ai_done_flag = 0;
        ret = ioctl(g_fd, IOCTRL_CAMERA_START_SHOT, &shoot_para_t);
        if (RT_ERROR == ret) {
            printf("ov2640 can't wait event flag");
            rt_free(showbuffer);
            close(g_fd);
            pthread_exit(NULL);
            return NULL;
        }
        kpu_run_kmodel(&face_detect_task, kpurgbbuffer, DMAC_CHANNEL5, ai_done, NULL);
        while (!g_ai_done_flag)
            ;
        float *output;
        size_t output_size;
        kpu_get_output(&face_detect_task, 0, (uint8_t **)&output, &output_size);
        face_detect_rl.input = output;
        region_layer_run(&face_detect_rl, &face_detect_info);
/* display result */
#ifdef BSP_USING_LCD
        for (int face_cnt = 0; face_cnt < face_detect_info.obj_number; face_cnt++) {
            draw_edge((uint32_t *)showbuffer, &face_detect_info, face_cnt, 0xF800, (uint16_t)sensor_output_size[1],
                      (uint16_t)sensor_output_size[0]);
            printf("%d: (%d, %d, %d, %d) cls: %s conf: %f\t", face_cnt, face_detect_info.obj[face_cnt].x1,
                   face_detect_info.obj[face_cnt].y1, face_detect_info.obj[face_cnt].x2, face_detect_info.obj[face_cnt].y2,
                   labels[face_detect_info.obj[face_cnt].class_id], face_detect_info.obj[face_cnt].prob);
        }
        if (0 != face_detect_info.obj_number) printf("\n");
        lcd_draw_picture(0, 0, (uint16_t)sensor_output_size[1], (uint16_t)sensor_output_size[0], (unsigned int *)showbuffer);
#endif
        usleep(1);
        if (1 == if_exit) {
            if_exit = 0;
            printf("thread_face_detcet_entry exit");
            pthread_exit(NULL);
        }
    }
}

void face_detect_delete()
{
    if (showbuffer != NULL) {
        int ret = 0;
        close(g_fd);
        close(kmodel_fd);
        free(showbuffer);
        free(kpurgbbuffer);
        free(model_data);
        printf("face detect task cancel!!! ret %d ", ret);
        if_exit = 1;
    }
}
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(face_detect_delete, face detect task delete);
#endif

void kmodel_load(unsigned char *model_data)
{
    int kmodel_fd = 0;
    int size = 0;
    kmodel_fd = open(kmodel_path, O_RDONLY);

    model_data = (unsigned char *)malloc(kmodel_size + 255);
    if (NULL == model_data) {
        printf("model_data apply memory fail !!");
        return;
    }
    memset(model_data, 0, kmodel_size + 255);

    if (kmodel_fd >= 0) {
        size = read(kmodel_fd, model_data, kmodel_size);
        if (size != kmodel_size) {
            printf("read kmodel error size %d\n", size);

        } else {
            printf("read kmodel success");
        }
    } else {
        free(model_data);
        printf("open kmodel fail");
    }
}
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(kmodel_load, kmodel load memory);
#endif
