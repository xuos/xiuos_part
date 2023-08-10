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

/**
* @file:    test_ethernet.c
* @brief:   a application of ethernet function
* @version: 1.1
* @author:  AIIT XUOS Lab
* @date:    2022/12/17
*/
#include <stdio.h>
#include <string.h>
#include <transform.h>
#include <xs_hash.h>

int Testhash(void)
{
    Element a[]={{12,1},{2,2},{31,3},{45,4},{8,5},{45,5}};
	
	int n = sizeof(a)/sizeof(Element);
	Hash_table *h = Creat_Table(n);
	int i = 0;
	for(i = 0 ; i<n ; i++)
	{
		Insert(h,a[i]);
	}
	print_Table(h);		// 打印哈希表 
	printf("%d\n\n", lookup(h,12)->data->value);	//查找key值为12的Element  
	printf("%d\n",h->length);	//打印哈希表的元素个数 
	Destroy_Table(h);	// 摧毁哈希表

    return 0;
}

PRIV_SHELL_CMD_FUNCTION(Testhash, a hash test sample, PRIV_SHELL_CMD_MAIN_ATTR);