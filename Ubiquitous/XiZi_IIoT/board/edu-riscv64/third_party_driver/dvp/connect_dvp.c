#include <connect_dvp.h>
#include <dvp.h>
#include <board.h>
#include "sysctl.h"
#include "bsp.h"
#include "plic.h"
#include <ov2640.h>

#define REG_SCCB_READ 0x12U
#define REG_SCCB_WRITE 0x13U
#define SCCB_REG_LENGTH 0x08U

// irq interrupt function
static int on_irq_dvp(int irq, void *arg)
{
    if (dvp_get_interrupt(DVP_STS_FRAME_FINISH))
    {
        dvp_clear_interrupt(DVP_STS_FRAME_FINISH);
    }
    else
    {
        dvp_start_convert();
        dvp_clear_interrupt(DVP_STS_FRAME_START);
    }
    return 0;
}

struct DvpRegConfigureInfo
{
    uint8_t device_addr;
    uint16_t reg_addr;
    uint8_t reg_value;
};

static struct CameraCfg sensor_config = {
    .output_h = IMAGE_HEIGHT,//will be resize from window below in ov2640
    .output_w = IMAGE_WIDTH,
    .window_h = 600,        //register configure in ov2640.h
    .window_w = 800,        //to make window as large as cmos selected size
    .window_xoffset = 0,
    .window_yoffset = 0,
    .gain_manu_enable = 0,
    .gain = 0x00
    };

static uint32 dvpDrvInit(void)
{
    x_err_t ret = EOK;
    dvp_init(SCCB_REG_LENGTH);
    dvp_set_xclk_rate(DVP_XCLK_RATE);
    dvp_set_image_format(DVP_CFG_RGB_FORMAT);
    dvp_set_image_size(IMAGE_WIDTH, IMAGE_HEIGHT);
    dvp_set_output_enable(DVP_OUTPUT_DISPLAY, 0);
    dvp_set_output_enable(DVP_OUTPUT_AI, 0);
    ov2640_init();
    sensorConfigure(&sensor_config);

    sysctl_set_spi0_dvp_data(1);
#ifdef DVP_BURST_ENABLE
    dvp_enable_burst();
#endif
#ifdef DVP_AUTO_ENABLE
    dvp_disable_auto();
#endif
#ifdef DVP_AI_OUTPUT
    dvp_set_output_enable(DVP_OUTPUT_AI, 1);
    dvp_set_ai_addr((uint32_t)DVP_AI_RED_ADRESS, (uint32_t)DVP_AI_GREEN_ADRESS, (uint32_t)DVP_AI_BLUE_ADRESS);
#endif
#ifdef DVP_INTERRUPT_ENABLE
    dvp_config_interrupt(DVP_CFG_START_INT_ENABLE | DVP_CFG_FINISH_INT_ENABLE, 0);
    isrManager.done->registerIrq(IRQN_DVP_INTERRUPT, (IsrHandlerType)on_irq_dvp, NULL);
    isrManager.done->enableIrq(IRQN_DVP_INTERRUPT);
    dvp_clear_interrupt(DVP_STS_FRAME_START | DVP_STS_FRAME_FINISH);
    dvp_config_interrupt(DVP_CFG_START_INT_ENABLE | DVP_CFG_FINISH_INT_ENABLE, 1);
    KPrintf("camera interrupt has open!\n");
#endif
    return ret;
}

static uint32 readDvpReg(void *drv, struct DvpRegConfigureInfo *reg_info)
{
    x_err_t ret = EOK;
    reg_info->reg_value = dvp_sccb_receive_data(reg_info->device_addr, reg_info->reg_addr);
    return ret;
}

static uint32 writeDvpReg(void *drv, struct DvpRegConfigureInfo *reg_info)
{
    x_err_t ret = EOK;
    dvp_sccb_send_data(reg_info->device_addr, reg_info->reg_addr, reg_info->reg_value);
    return ret;
}

static uint32 dvpOpen(void *dev)
{
    x_err_t ret = EOK;
    dvpDrvInit();
    return ret;
}

static uint32 dvpClose(void *dev)
{
    x_err_t ret = EOK;
    dvp_config_interrupt(DVP_CFG_START_INT_ENABLE | DVP_CFG_FINISH_INT_ENABLE, 0);
    dvp_set_output_enable(DVP_OUTPUT_AI, 0);
    dvp_set_output_enable(DVP_OUTPUT_DISPLAY, 0);
    return ret;
}

static uint32 dvpRead(void *dev, struct BusBlockReadParam *read_param)
{
    x_err_t ret = EOK;

    // change the output buff address by read
    dvp_set_output_enable(DVP_OUTPUT_DISPLAY, 0);
    dvp_set_display_addr((uintptr_t)read_param->buffer);
    dvp_set_output_enable(DVP_OUTPUT_DISPLAY, 1);

    return ret;
}

static uint32 dvpDrvConfigure(void *drv, struct BusConfigureInfo *args)
{

    x_err_t ret = EOK;
    int cmd_type = args->configure_cmd;
    struct CameraCfg* tmp_cfg;
    switch (cmd_type)
    {
    case OPE_INT:
        break;
    case OPE_CFG:
        tmp_cfg = (struct CameraCfg *)args->private_data;
        sensorConfigure(tmp_cfg);
        dvp_set_image_size(tmp_cfg->output_w, tmp_cfg->output_h);
        break;
    case REG_SCCB_READ:
        readDvpReg(drv, (struct DvpRegConfigureInfo *)args->private_data);
        break;
    case REG_SCCB_WRITE:
        writeDvpReg(drv, (struct DvpRegConfigureInfo *)args->private_data);
        break;
    default:
        break;
    }
    return ret;
}

/*manage the camera device operations*/
static const struct CameraDevDone camera_dev_done =
    {
        .dev_open = dvpOpen,
        .dev_close = dvpClose,
        .dev_write = NONE,
        .dev_read = dvpRead,
};

/*Init camera bus*/
static int BoardCameraBusInit(struct CameraBus *camera_bus, struct CameraDriver *camera_driver)
{
    x_err_t ret = EOK;

    /*Init the camera bus */
    camera_bus->private_data = (void *)&camera_dev_done;
    ret = CameraBusInit(camera_bus, CAMERA_BUS_NAME);
    if (EOK != ret)
    {
        KPrintf("board_camera_init CameraBusInit error %d\n", ret);
        return ERROR;
    }

    /*Init the camera driver*/
    camera_driver->private_data = (void *)&camera_dev_done;
    ret = CameraDriverInit(camera_driver, CAMERA_DRV_NAME);
    if (EOK != ret)
    {
        KPrintf("board_camera_init CameraDriverInit error %d\n", ret);
        return ERROR;
    }

    /*Attach the camera driver to the camera bus*/
    ret = CameraDriverAttachToBus(CAMERA_DRV_NAME, CAMERA_BUS_NAME);
    if (EOK != ret)
    {
        KPrintf("board_camera_init CameraDriverAttachToBus error %d\n", ret);
        return ERROR;
    }

    return ret;
}

/*Attach the camera device to the camera bus*/
static int BoardCameraDevBend(void)
{
    x_err_t ret = EOK;
    static struct CameraHardwareDevice camera_device;
    memset(&camera_device, 0, sizeof(struct CameraHardwareDevice));

    camera_device.camera_dev_done = &camera_dev_done;

    ret = CameraDeviceRegister(&camera_device, NONE, CAMERA_DEVICE_NAME);
    if (EOK != ret)
    {
        KPrintf("board_camera_init CameraDeviceInit device %s error %d\n", CAMERA_DEVICE_NAME, ret);
        return ERROR;
    }

    ret = CameraDeviceAttachToBus(CAMERA_DEVICE_NAME, CAMERA_BUS_NAME);
    if (EOK != ret)
    {
        KPrintf("board_camera_init CameraDeviceAttachToBus device %s error %d\n", CAMERA_DEVICE_NAME, ret);
        return ERROR;
    }

    return ret;
}

int HwDvpInit(void)
{
    x_err_t ret = EOK;
    static struct CameraBus camera_bus;
    memset(&camera_bus, 0, sizeof(struct CameraBus));

    static struct CameraDriver camera_driver;
    memset(&camera_driver, 0, sizeof(struct CameraDriver));

    camera_driver.configure = dvpDrvConfigure;
    ret = BoardCameraBusInit(&camera_bus, &camera_driver);
    if (EOK != ret)
    {
        KPrintf("board_camera_Init error ret %u\n", ret);
        return ERROR;
    }

    ret = BoardCameraDevBend();
    if (EOK != ret)
    {
        KPrintf("board_camera_Init error ret %u\n", ret);
        return ERROR;
    }
    return ret;
}