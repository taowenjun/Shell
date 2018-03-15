#! /bin/bash
brokers="master slave1"
KAFKA_HOME=/root/software/kafka
echo "INFO:Stop kafka cluster"

for broker in $brokers:
do
  ssh $broker -C "source /etc/profile;${KAFKA_HOME}/bin/kafka-server-stop.sh"
  if [ $? -eq 0 ];then
    echo "INFO:[${broker}] stop successfully!"
  fi
done

echo "INFO:Kafka cluster stop successfully"
