#include <openamp/open_amp.h>
#include "rpmsg_task.h"
#include "platform_info.h"
#include <xizi.h>

extern int init_system (void);
extern void cleanup_system (void);
extern int app (struct rpmsg_device * rdev, void * platform, unsigned long svcno);

void* RPMsgTask_Entry(void* param)
{
    unsigned long         proc_id = 0UL;
    unsigned long         rsc_id  = 0UL;
    struct rpmsg_device * rpdev;
    void                * platform;
    int ret;

    ret = init_system();
    if (ret)
    {
        LPERROR("Failed to init remoteproc device.\n");
        goto err;
    }

    ret = platform_init(proc_id, rsc_id, &platform);
    if (ret)
    {
        LPERROR("Failed to create remoteproc device.\n");
        goto err;
    }
    else
    {
        do
        {
            /* RTOS is Master, but this setting must remote in this release. */
            rpdev = platform_create_rpmsg_vdev(platform, 0x0U, VIRTIO_DEV_SLAVE, NULL, NULL);
            if (!rpdev)
            {
                LPERROR("Fail, platform_create_rpmsg_vdev.\n");
                goto err;
            }
            // KPrintf("RPMsgTask_Entry: Success platform_create_rpmsg_vdev.\n");
            /* Kick the application */
            (void) app(rpdev, platform, proc_id);
            
            platform_release_rpmsg_vdev(platform, rpdev);
            KPrintf("RPMsgTask_Entry: Success platform_release_rpmsg_vdev.\n");

            DelayKTask(RECONNECT_DLY);
        } while (RECONNECT_FLG);
    }

err:
    KPrintf("RPMsgTask_Entry: err \n");
}

void CreateRPMsgTask(void)
{
    // 创建的任务优先级与SHELL终端一致，防止该任务无法执行
    int32 rpmsg_task_id = KTaskCreate("rpmsg_task",RPMsgTask_Entry,NULL,2048,SHELL_TASK_PRIORITY);

    if (rpmsg_task_id < 0)
    {
        KPrintf("CreateRPMsgTask: create rpmsg task fail!\n");
        return ;
    }
    
    // 将该任务放入调用
    StartupKTask(rpmsg_task_id);
}

