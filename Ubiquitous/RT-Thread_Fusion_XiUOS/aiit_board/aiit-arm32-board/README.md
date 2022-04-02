# STM32F407最小系统板说明


## 以下为引脚硬件的连接表

## **W25q16(SPI1 )**

| 引脚 | 作用           | 引脚序号   |W25q16板子 |
| ---- | ---------     | --------  | --------|
| PA5  | SPI1_SCK      | 41        | CLK     |
| PA6  | SPI1_MISO     | 42        | DO      |
| PA7  | SPI1_MOSI     | 43        | DI      |
| PB0  | SpiFlash_nCS  | 46        | nCS     |

## **CRF1278-L3(SPI2 )**

| 引脚 | 作用           | 引脚序号   |CRF1278板子|
| ---- | ---------     | --------  | --------|
| PB13 | SPI2_SCK      | 74        | SCK     |
| PC2  | SPI2_MISO     | 28        | MISO    |
| PC3  | SPI2_MOSI     | 29        | MOSI    |
| PC6  | LORA_nCS      | 96        | NSS     |

## **XPT2046(SPI3)**

| 引脚 | 作用           | 引脚序号   |XPT2046板子|
| ---- | ---------     | --------  | --------|
| PB3  | SPI3_SCK      | 133        | DCLK    |
| PB4  | SPI3_MISO     | 134        | DOUT    |
| PB5  | SPI3_MOSI     | 135        | DIN     |
| PG13  | T_nCS        | 128        | CS      |

## **(I2C1)**

| PB6  | I2C_SCL     | 
| ---- | ----------  |
| PB7  | I2C_SDA     |


## uart1 串口1   

| PA9  | USART1_TX |
| ---- | --------- |
| PA10 | USART1_RX |

## uart2 串口2  

| PA2  | USART2_TX |
| ---- | --------- |
| PA3  | USART2_RX |

## uart3 串口3 

| PB10  | USART3_TX |
| ----  | ----------|
| PB11  | USART3_RX |

## uart4 串口4 

| PA0-WKUP | UART4_TX |
| ---- | ------------ |
| PA1  | UART4_RX |



