#include <xizi.h>
#include <xsconfig.h>

#ifdef POWERLINK_MN
extern int OplkDemoMnConsole(int argc, char *argv[]);

PRIV_SHELL_CMD_FUNCTION(OplkDemoMnConsole, a openPOWERLINK MN sample, PRIV_SHELL_CMD_MAIN_ATTR);
#endif

#ifdef POWERLINK_CN
extern int OplkDemoCnConsole(int argc, char *argv[]);

PRIV_SHELL_CMD_FUNCTION(OplkDemoCnConsole, a openPOWERLINK CN sample, PRIV_SHELL_CMD_MAIN_ATTR);
#endif
