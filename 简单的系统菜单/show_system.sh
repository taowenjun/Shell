#!/bin/bash

#
#System info
#

#delay 
DELAY=3

while [[ "$REPLY" != "0" ]];do
    clear
    cat <<EOF
----------------------------
please input:
    1.show system infomation
    2.show disk use info
    3.show user space info
    0.exit
----------------------------
EOF

    read -p  "please input your choice[0-3]:"
    if [[ $REPLY =~ ^[0-3]$ ]];then

       #system info
       if [[ "$REPLY" = "1" ]];then
               echo
               echo "hostname:${HOSTNAME}"
               uptime
               sleep $DELAY
       fi

       #disk info
       if [[ "$REPLY" = "2" ]];then
            df -h
            sleep $DELAY
       fi

       #user space info
       if [[ "$REPLY" = "3" ]];then
           if [[ $(id -u) -eq 0 ]];then
               echo
               echo "(all user) user space info:"
               du -sh /home/*
           else
               echo
               echo "(${USER})user space info"
               du -sh $HOME
           fi
           sleep $DELAY
        fi
     else
        echo "input error"
        sleep $DELAY
     fi
done
echo "exit"
          
