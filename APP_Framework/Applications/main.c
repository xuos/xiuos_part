/*
* Copyright (c) 2020 AIIT XUOS Lab
* XiUOS is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*        http://license.coscl.org.cn/MulanPSL2
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
* See the Mulan PSL v2 for more details.
*/

#include <stdio.h>
#include <string.h>
// #include <user_api.h>
#include <transform.h>

pthread_mutex_t* get_memtest_mtx() {
	static pthread_mutex_t mem_test_mtx;
	return &mem_test_mtx;
}


extern void ShowMemory();
void malloc_thread(void* size)
{
    int tid = GetKTaskDescriptor()->id.id;
    int* tmp = (int*)size;
	int malloc_size = *tmp;

	PrivMutexObtain(get_memtest_mtx());
    printf("TID: %d Working. size: %d\n", tid, malloc_size);
	PrivMutexAbandon(get_memtest_mtx());

    void* ptr_allocated = NULL;
    while ((ptr_allocated = malloc(malloc_size)) != NULL) {
		PrivMutexObtain(get_memtest_mtx());
        printf("\n[TID: %d]==================================================\n", tid);
        ShowMemory();
		PrivMutexAbandon(get_memtest_mtx());
    }

	PrivMutexObtain(get_memtest_mtx());
    printf("TID: %d Exiting.\n", tid);
	PrivMutexAbandon(get_memtest_mtx());
}

#include <xs_ktask.h>
int testMemMain()
{
	PrivMutexCreate(get_memtest_mtx(), NULL);

    int malloc_size = 10 * 1024;
    int tid = KTaskCreate("mem1", malloc_thread, (void*)&malloc_size, 2048, 20);
    StartupKTask(tid);
	// malloc_thread(&malloc_size);


	// void* ptr_allocated[5] = { NULL };
	// ptr_allocated[0] = malloc(malloc_size);
    // printf("0x%x ==================================================\n", ptr_allocated[0]);
	// ShowMemory();
	// ptr_allocated[1] = malloc(malloc_size);
    // printf("0x%x ==================================================\n", ptr_allocated[1]);
	// ShowMemory();

    // malloc_size = 996;
	// ptr_allocated[2] = malloc(malloc_size);
    // printf("0x%x ==================================================\n", ptr_allocated[2]);
	// ShowMemory();

	// free(ptr_allocated[0]);
    // printf("==================================================\n");
	// ShowMemory();
	// ptr_allocated[0] = malloc(malloc_size);
    // printf("0x%x ==================================================\n", ptr_allocated[0]);
	// ShowMemory();

	// ptr_allocated[3] = malloc(malloc_size);
	// free(ptr_allocated[2]);
    // printf("0x%x ==================================================\n", ptr_allocated[3]);
	// ShowMemory();

	// malloc_size = 333;
	// ptr_allocated[2] = malloc(malloc_size);
	// ptr_allocated[4] = malloc(malloc_size);
    // printf("0x%x ==================================================\n", ptr_allocated[2]);
    // printf("0x%x ==================================================\n", ptr_allocated[4]);
	// ShowMemory();

	// free(ptr_allocated[0]);
	// free(ptr_allocated[1]);
	// free(ptr_allocated[2]);
	// free(ptr_allocated[3]);
	// free(ptr_allocated[4]);


    int malloc_size2 = 1024;
    int tid2 = KTaskCreate("mem2", malloc_thread, &malloc_size2, 2048, 20);
    StartupKTask(tid2);
	// malloc_thread(&malloc_size);
    int malloc_size3 = 127;
    int tid3 = KTaskCreate("mem3", malloc_thread, &malloc_size3, 2048, 20);
    StartupKTask(tid3);
	// malloc_thread(&malloc_size);
	int malloc_size4 = 45;
    int tid4 = KTaskCreate("mem4", malloc_thread, &malloc_size4, 2048, 20);
    StartupKTask(tid4);
	// malloc_thread(&malloc_size);
    int malloc_size5 = 16;
    int tid5 = KTaskCreate("mem5", malloc_thread, &malloc_size5, 2048, 20);
    StartupKTask(tid5);
	// malloc_thread(&malloc_size);
	MdelayKTask(5000);
    return 0;
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC) | SHELL_CMD_PARAM_NUM(0),
    testMemMain, testMemMain, list memory usage information);

extern int FrameworkInit();
extern void ApplicationOtaTaskInit(void);
int main(void)
{
	printf("Hello, world! \n");
	FrameworkInit();
#ifdef APPLICATION_OTA
	ApplicationOtaTaskInit();
#endif
    return 0;
}
// int cppmain(void);


