#include "fsl_common.h"


/* Macros for the touch touch controller. */
#define I2C_BASE  LPI2C1

/* Select USB1 PLL (480 MHz) as master lpi2c clock source */
#define LPI2C_CLOCK_SOURCE_SELECT (0U)
/* Clock divider for master lpi2c clock source */
#define LPI2C_CLOCK_SOURCE_DIVIDER (5U)


#define I2C_CLOCK_FREQ ((CLOCK_GetFreq(kCLOCK_Usb1PllClk) / 8) / (LPI2C_CLOCK_SOURCE_DIVIDER + 1U))
#define I2C_BAUDRATE 100000U



void      I2C_Init(void);
status_t I2C_Write(LPI2C_Type *base,uint32_t subAdd,uint8_t *dataBuff,uint16_t dataLen);
uint32_t I2C_Read(LPI2C_Type *base,uint32_t subAdd,uint8_t* dataBuff, uint16_t dataLen);



