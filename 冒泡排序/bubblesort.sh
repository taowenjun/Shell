#!/bin/bash
read -p "input " n
arr=($n)
#temp=0
echo ${#arr[@]}
for((i=0;i<${#arr[@]}-1;i++))
{
for((j=${#arr[@]}-1;j>=i+1;j--))
{
if [ ${arr[j]} -gt ${arr[j-1]} ]
then
  temp=${arr[j]}
  arr[j]=${arr[j-1]}
  arr[j-1]=$temp
fi
}
}

echo ${arr[@]}
