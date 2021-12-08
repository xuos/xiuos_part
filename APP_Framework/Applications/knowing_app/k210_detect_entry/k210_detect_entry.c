#ifdef USING_K210_DETECT
#include "k210_detect.h"
#endif
#include <transform.h>

static void detect_app() { k210_detect(K210_DETECT_CONFIGJSON); }
#ifdef __RT_THREAD_H__
MSH_CMD_EXPORT(detect_app, detect app);
#endif