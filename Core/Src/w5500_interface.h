/*
 * w5500_interface.h
 *
 *  Created on: Dec 4, 2022
 *      Author: muham
 */

#ifndef SRC_W5500_INTERFACE_H_
#define SRC_W5500_INTERFACE_H_

#include <w5500.h>
#include <wizchip_conf.h>
#include <socket.h>
#include <string.h>
#include <stdio.h>
#include "stm32f4xx_hal.h"
#include <dhcp.h>


#define CHIP_INIT_FAIL               "Initialize chip fail...\r\n"
//
/*Socket number defines*/
#define TCP_SOCKET	0
#define UDP_SOCKET	1
/*Port number defines*/
#define TCP_PORT 	60000
#define UDP_PORT 	60001
/*Receive Buffer Size define*/
#define BUFFER_SIZE	2048
/* USER CODE END PD */


void w5500_interface_setSPIHandle(SPI_HandleTypeDef spiHandle);

void w5500_interface_Initialze(void);

void w5500_interface_HardwareReset(void);
void w5500_interface_Select(void);
void w5500_interface_DeSelect(void);

void w5500_interface_ReadBuff(uint8_t* buff, uint16_t len);
void w5500_interface_WriteBuff(uint8_t* buff, uint16_t len);
void w5500_interface_WriteByte(unsigned char byte);
unsigned char w5500_interface_ReadByte(void);

void w5500_interface_SetNetInfo();

wiz_NetInfo Get_Wiz_NetInfo();

#endif /* SRC_W5500_INTERFACE_H_ */

