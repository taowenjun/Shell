#!/bin/bash
brokers="master slave1"
KAFKA_HOME=/root/software/kafka

echo "INFO:Begin to stop kafka cluster..."

for broker in $brokers
do
    echo "Info:stop kafka on ${broker} ..."
    ssh $broker -C "source /etc/profile;sh ${KAFKA_HOME}/bin/kafka-server-stop.sh"
    if [ $? -eq 0 ];then
         echo  "INFO:[${broker}] Stop successfully "
    fi
done

echo "INFO:Kafka cluster stop successfully!"

