/*
 * mqtt.c
 *
 *  Created on: Nov 13, 2022
 *      Author: muham
 */


#include "mqtt_user.h"

#include "dns.h"
#include "w5500_interface.h"

unsigned char targetIP[4] = {};
unsigned char targetIP_local[4] = {192,168,178,25};
unsigned int targetPort = 1883;


char* BrokerTargetName;// = "test.mosquitto.org";
char* SubTargetName;
char* PubTargetName;

MQTTMessage messagePub;

Network mqtt_network;
MQTTClient mqtt_client;
wiz_NetInfo WIZNETINFO;

unsigned char buf[100];
int rc = 0;
unsigned char tempBuffer_DNS[BUFFER_SIZE] = {};
unsigned char tempBuffer[BUFFER_SIZE] = {};

struct opts_struct
{
	char* clientid;
	int nodelimiter;
	char* delimiter;
	enum QoS qos;
	char* username;
	char* password;
	char* host;
	int port;
	int showtopics;
} opts =
{
	(char*)"stdout-subscriber", 0, (char*)"\n", QOS0, "", "", (char*)"192.168.178.25", 1883, 0
};

void setMQTTBrokerTargetName(char* Target)
{
	BrokerTargetName = Target;
}
void setMQTTSubTargetName(char* Target)
{
	SubTargetName = Target;
}
void setMQTTPubTargetName(char* Target)
{
	PubTargetName = Target;
}

void setMQTTClientID(char* Target)
{
	opts.clientid = Target;
}

void setMQTTUsername(char* Target)
{
	opts.username = Target;
}

void AXON_setMQTTPassword(char* Target)
{
	opts.password = Target;
}

void setMQTTPubData(MQTTMessage message)
{
	messagePub = message;
}

void MQTTPublishMessage()
{
	MQTTPublish(&mqtt_client,PubTargetName ,&messagePub);
}

void MQTTmessageArrived(MessageData* md)
{
	unsigned char testbuffer[100];
	MQTTMessage* message = md->message;

	if (opts.showtopics)
	{
		memcpy(testbuffer,(char*)message->payload,(int)message->payloadlen);
		*(testbuffer + (int)message->payloadlen + 1) = "\n";
		printf("%s\r\n",testbuffer);
	}
	if (opts.nodelimiter)
		printf("%.*s", (int)message->payloadlen, (char*)message->payload);
	else
		printf("%.*s%s", (int)message->payloadlen, (char*)message->payload, opts.delimiter);
}

void MQTTInitialze()
{
	mqtt_network.my_socket = 0;
	DNS_init(1,tempBuffer_DNS);
	WIZNETINFO = Get_Wiz_NetInfo();
	while(DNS_run(WIZNETINFO.dns,BrokerTargetName,targetIP) == 0){}
	NewNetwork(&mqtt_network, 0);

	ConnectNetwork(&mqtt_network, targetIP_local, targetPort);
	MQTTClientInit(&mqtt_client,&mqtt_network,1000,buf,100,tempBuffer,2048);

	MQTTPacket_connectData data = MQTTPacket_connectData_initializer;
	data.willFlag = 0;
	data.MQTTVersion = 3;
	data.clientID.cstring = opts.clientid;
	data.username.cstring = opts.username;
	data.password.cstring = opts.password;

	data.keepAliveInterval = HAL_MAX_DELAY;
	data.cleansession = 1;

	rc = MQTTConnect(&mqtt_client, &data);
	printf("Connected %d\r\n", rc);
	opts.showtopics = 1;

}

int mqttSubscribe()
{
	int status = 0;
	status = MQTTSubscribe(&mqtt_client, SubTargetName, opts.qos, MQTTmessageArrived);
	printf("Subscribed %d\r\n", status);
	return status;
}
void mqttYield()
{
	MQTTYield(&mqtt_client, 1000);
}
