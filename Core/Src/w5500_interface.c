/*
 * w5500_interface.c
 *
 *  Created on: Dec 4, 2022
 *      Author: muham
 */

#include "w5500_interface.h"

SPI_HandleTypeDef handle_spi;

uint8_t mac_address[6] = {0x2C, 0xF7, 0xF1, 0x08, 0x00, 0x9A};
wiz_NetInfo gWIZNETINFO = { .mac = {},
.ip = {192, 168, 178, 11},
.sn = {255, 255, 255, 0},
.gw = {192, 168, 178, 1},
.dns = {192, 168, 178, 1},
.dhcp = NETINFO_STATIC};


////##########################################
////##########################################
wiz_NetInfo Get_Wiz_NetInfo()
{
	return gWIZNETINFO;
}
////##########################################
////##########################################
void w5500_interface_setSPIHandle(SPI_HandleTypeDef spiHandle)
{
	handle_spi = spiHandle;
}
////##########################################
////##########################################
void w5500_interface_HardwareReset(void)
{
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_SET);
}
////##########################################
////##########################################
void w5500_interface_WriteBuff(uint8_t* pBuf, uint16_t len)
{
	HAL_SPI_Transmit(&handle_spi, pBuf, len, 0xffff);
}
////##########################################
////##########################################
void w5500_interface_ReadBuff(uint8_t* pBuf, uint16_t len)
{
	HAL_SPI_Receive(&handle_spi, pBuf, len, 0xffff);
}
////##########################################
////##########################################
void w5500_interface_WriteByte(unsigned char byte)
{
	HAL_SPI_Transmit(&handle_spi, &byte, 1, 0xffff);
}
////##########################################
////##########################################
unsigned char w5500_interface_ReadByte(void)
{
	uint8_t rd_byte = 0;
	HAL_SPI_Receive(&handle_spi, &rd_byte, 1, 0xffff);
	return rd_byte;
}
////##########################################
////##########################################
void w5500_interface_Select(void)
{
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);
}
////##########################################
////##########################################
void w5500_interface_DeSelect(void)
{
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);
}

////##########################################
////##########################################
void w5500_interface_SetNetInfo()
{
	/*Set network informations*/
	wizchip_setnetinfo(&gWIZNETINFO);

	setSHAR(mac_address);
}
////##########################################
////##########################################
void w5500_interface_Initialze(void)
{
	unsigned char temp;
	unsigned char W5500FifoSize[2][8] = {{2,2,2,2,2,2,2,2,},{2,2,2,2,2,2,2,2}};

	w5500_interface_DeSelect();

	/* spi function register */
	reg_wizchip_spi_cbfunc(w5500_interface_ReadByte, w5500_interface_WriteByte);
	reg_wizchip_spiburst_cbfunc(w5500_interface_ReadBuff, w5500_interface_WriteBuff);

	/* CS function register */
	reg_wizchip_cs_cbfunc(w5500_interface_Select,w5500_interface_DeSelect);

	if(ctlwizchip(CW_INIT_WIZCHIP,(void*)W5500FifoSize) == -1)
	{
		printf("W5500 initialized fail.\r\n");
	}

	do{//check phy status.
		if(ctlwizchip(CW_GET_PHYLINK,(void*)&temp) == -1){
			printf("Unknown PHY link status.\r\n");
		}
	}while(temp == PHY_LINK_OFF);

}
