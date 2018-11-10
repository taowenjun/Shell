@echo off
set JAVA_HOME=C:\Program Files (x86)\Java
set classpath=.;D:\hadoop-2.6.5\share\hadoop\common\hadoop-common-2.6.5.jar;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;D:\hadoop-2.6.5\share\hadoop\hdfs\*;D:\hadoop-2.6.5\share\hadoop\hdfs\lib\*;D:\hadoop-2.6.5\share\hadoop\common\*;D:\hadoop-2.6.5\share\hadoop\common\lib\*;D:\hadoop-2.6.5\share\hadoop\tools\lib\*
set path=%path%;C:\Program Files (x86)\Java\bin

for %%I in (1,2,3,4) do  (
    for %%J in (2000,4000,6000,8000,10000)  do  (
          java HarReader %%I %%J
          java HDFSReader %%I %%J
          chcp 65001
          java LHFReader %%I %%J
          chcp 936
          java MapFileReader %%I %%J
        )
	)
pause