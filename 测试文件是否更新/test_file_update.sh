#!/bin/bash
#$1 the file needed to monitor
#$2 put the file's md5 ,used to judge whether the file is updated
#$3 if the file is updated ,execute the command

function createMd5file()
{
    md5sum -b $1 > $2
}

#judge whether file is exited
if [ ! -e $2 ];then
    createMd5file $1 $2
fi

while(true) ; do
    #check the file ,$? return 1 ,update;and 0,no changed
    md5sum -c $2  --status

    if [ $? -gt 0 ];then
        if [ "$3" ];then
            $3 $1
        fi

    createMd5file $1 $2

    fi

    #period
    sleep 20
done
