#include <nuttx/compiler.h>

#include <stdint.h>
#include <endian.h>

/****************************************************************************
 * Public Functions
 ****************************************************************************/

#ifdef CONFIG_HAVE_LONG_LONG
uint64_t __swap_uint64(uint64_t n)
{
	return (__swap_uint32(n)+ (0ULL<<32)) | __swap_uint32(n>>32);
}
#endif
