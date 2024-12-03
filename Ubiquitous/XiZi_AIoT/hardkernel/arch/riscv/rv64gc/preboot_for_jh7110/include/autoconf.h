#ifndef _AUTOCONF_H
#define _AUTOCONF_H

#define CONFIG_64BIT 1
#define CONFIG_MMU 1
#define CONFIG_PHYS_ADDR_T_64BIT 1
#define CONFIG_PAGE_OFFSET 0xffffffe000000000
#define CONFIG_VA_BITS 39


#define THREAD_SIZE             (512 << 2)
#define KERNEL_MAP_VIRT_ADDR 0 /* offsetof(struct kernel_mapping, virt_addr) */
#define TASK_TI_CPU 32 /* offsetof(struct task_struct, thread_info.cpu) */

#endif /* _AUTOCONF_H */
