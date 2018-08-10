et -x
parent_path=/data0/logs
i=0
filelist=()

function getFileLists()
{
  fileLists=`ls $1`
  for fileName in $fileLists;
  do
     if [ -f $fileName ];then
          #echo `pwd`/$fileName;
          filelist[$i]=`pwd`/$fileName
          let i=i+1
     fi
     if test -d $fileName; then
          cd $fileName;
          filepath=`pwd`;
          getFileLists $filepath;
          cd ..;
     fi
  done
}

cd $parent_path;
#pwd
getFileLists $parent_path;

len=${#filelist[*]}
let len=len-1
seqs=`seq 0 $len`
echo $seqs
for i in $seqs;
do 
  echo  ${filelist[$i]}
done
