#!/bin/bash

echo "INFO:begin to stop flume..."

num=$(ps -ef|grep java|grep flume|wc -l)

if [ $num -lt 1 ];then 
  echo "INFO:no flume process"
else
  echo "INFO:stop flume"
  ps -ef|grep java|grep flume|awk  '{print $2}'|xargs kill -9

  if [ $? -eq 0 ];then
     echo "INFO:flume stop successfully"
  fi
fi
