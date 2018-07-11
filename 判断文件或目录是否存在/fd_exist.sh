#!/bin/bash

if [ $# -eq 0 ] ; then
  echo "no input"
  echo "usage:$0 [file|directory]"
  exit
fi
if [ -f $1 ];then
  echo "file exists"
  ls -l $1
  exit
else
  echo "no such file"
fi
if [ -d $1 ];then
  echo "directory exists"
  ls -ld $1
  exit
else
  echo "no such directory"
  exit
fi
