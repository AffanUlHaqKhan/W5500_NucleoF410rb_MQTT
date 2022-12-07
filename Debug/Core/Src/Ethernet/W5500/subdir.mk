################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Ethernet/W5500/w5500.c 

OBJS += \
./Core/Src/Ethernet/W5500/w5500.o 

C_DEPS += \
./Core/Src/Ethernet/W5500/w5500.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Ethernet/W5500/%.o Core/Src/Ethernet/W5500/%.su: ../Core/Src/Ethernet/W5500/%.c Core/Src/Ethernet/W5500/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F410Rx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Core/Src/Ethernet -I../Core/Src/Ethernet/W5500 -I../Core/Src/Internet/MQTT -I../Core/Src/Internet/MQTTPacket -I../Core/Src/Internet/DHCP -I../Core/Src/Internet/DNS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Ethernet-2f-W5500

clean-Core-2f-Src-2f-Ethernet-2f-W5500:
	-$(RM) ./Core/Src/Ethernet/W5500/w5500.d ./Core/Src/Ethernet/W5500/w5500.o ./Core/Src/Ethernet/W5500/w5500.su

.PHONY: clean-Core-2f-Src-2f-Ethernet-2f-W5500

