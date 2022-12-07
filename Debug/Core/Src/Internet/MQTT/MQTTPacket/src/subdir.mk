################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectClient.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectServer.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTDeserializePublish.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTFormat.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTPacket.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSerializePublish.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeClient.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeServer.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.c \
../Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.c 

OBJS += \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectClient.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectServer.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTDeserializePublish.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTFormat.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTPacket.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSerializePublish.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeClient.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeServer.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.o \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.o 

C_DEPS += \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectClient.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectServer.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTDeserializePublish.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTFormat.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTPacket.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSerializePublish.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeClient.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeServer.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.d \
./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Internet/MQTT/MQTTPacket/src/%.o Core/Src/Internet/MQTT/MQTTPacket/src/%.su: ../Core/Src/Internet/MQTT/MQTTPacket/src/%.c Core/Src/Internet/MQTT/MQTTPacket/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F410Rx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Core/Src/Ethernet -I../Core/Src/Ethernet/W5500 -I../Core/Src/Internet/MQTT -I../Core/Src/Internet/MQTTPacket -I../Core/Src/Internet/DHCP -I../Core/Src/Internet/DNS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Internet-2f-MQTT-2f-MQTTPacket-2f-src

clean-Core-2f-Src-2f-Internet-2f-MQTT-2f-MQTTPacket-2f-src:
	-$(RM) ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectClient.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectClient.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectClient.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectServer.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectServer.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTConnectServer.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTDeserializePublish.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTDeserializePublish.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTDeserializePublish.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTFormat.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTFormat.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTFormat.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTPacket.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTPacket.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTPacket.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSerializePublish.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSerializePublish.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSerializePublish.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeClient.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeClient.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeClient.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeServer.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeServer.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTSubscribeServer.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.su ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.d ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.o ./Core/Src/Internet/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.su

.PHONY: clean-Core-2f-Src-2f-Internet-2f-MQTT-2f-MQTTPacket-2f-src

