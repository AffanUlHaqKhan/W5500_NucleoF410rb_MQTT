################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Internet/MQTT/MQTTClient.c \
../Core/Src/Internet/MQTT/mqtt_interface.c 

OBJS += \
./Core/Src/Internet/MQTT/MQTTClient.o \
./Core/Src/Internet/MQTT/mqtt_interface.o 

C_DEPS += \
./Core/Src/Internet/MQTT/MQTTClient.d \
./Core/Src/Internet/MQTT/mqtt_interface.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Internet/MQTT/%.o Core/Src/Internet/MQTT/%.su: ../Core/Src/Internet/MQTT/%.c Core/Src/Internet/MQTT/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F410Rx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Core/Src/Ethernet -I../Core/Src/Ethernet/W5500 -I../Core/Src/Internet/MQTT -I../Core/Src/Internet/MQTTPacket -I../Core/Src/Internet/DHCP -I../Core/Src/Internet/DNS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Internet-2f-MQTT

clean-Core-2f-Src-2f-Internet-2f-MQTT:
	-$(RM) ./Core/Src/Internet/MQTT/MQTTClient.d ./Core/Src/Internet/MQTT/MQTTClient.o ./Core/Src/Internet/MQTT/MQTTClient.su ./Core/Src/Internet/MQTT/mqtt_interface.d ./Core/Src/Internet/MQTT/mqtt_interface.o ./Core/Src/Internet/MQTT/mqtt_interface.su

.PHONY: clean-Core-2f-Src-2f-Internet-2f-MQTT

