/*
 * mqtt.h
 *
 *  Created on: Nov 13, 2022
 *      Author: muham
 */

#ifndef SRC_MQTT_H_
#define SRC_MQTT_H_



#endif /* SRC_MQTT_H_ */

#include <wizchip_conf.h>
#include <mqtt_interface.h>
#include <MQTTClient.h>
#include <stm32f4xx_hal.h>

#define BUFFER_SIZE	2048


typedef struct MQTT_Message
{
    MQTTMessage message;
    char* topicName;
} MQTT_Message;

void MQTTInitialze();

void setMQTTClientID(char* Target);
void setMQTTUsername(char* Target);
void setMQTTPassword(char* Target);
void setMQTTQoS(int Target);

void setMQTTBrokerTargetName(char* Target);

void setMQTTSubTargetName(char* Target);
int mqttSubscribe();
void MQTTmessageArrived(MessageData* md);

void setMQTTPubTargetName(char* Target);
void setMQTTPubData(MQTTMessage message);
void MQTTPublishMessage();

void mqttYield();
