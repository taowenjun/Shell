#!/bin/bash
brokers="master slave1"
KAFKA_HOME=/root/software/kafka

echo "INFO:Begin to start kafka cluster..."

for broker in $brokers
do
    echo "Info:start kafka on ${broker} ..."
    ssh $broker -C "source /etc/profile;sh ${KAFKA_HOME}/bin/kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties"
    if [ $? -eq 0 ];then
         echo  "INFO:[${broker}] Start successfully "
    fi
done

echo "INFO:Kafka cluster starts successfully!"

