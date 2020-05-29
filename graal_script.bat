REM Visual Studio 2017 must be installed 
REM Execute this script from 'x64 Native Tools Command Prompt for VS 2017'
REM Windows 10 SDK must be installed from https://go.microsoft.com/fwlink/p/?linkid=2120843
REM OpenJDK 14 could be downloaded from 
REM https://bell-sw.com/pages/downloads/?release=14.0.1+8
set JAVA_HOME=C:\Java\BellSoft\LibericaJDK-14
REM Python 2.7 https://www.python.org/ftp/python/2.7.18/python-2.7.18.amd64.msi
set PYTHON27=C:\Python27
REM Could be latest JDK from https://github.com/graalvm/graal-jvmci-8/releases
set EXTRA_JAVA_HOMES=C:\Java\BellSoft\LibericaJDK-14
REM Path to Git for Windows folder
set MKS_HOME=C:\Progra~1\Git\bin


set PATH=%PATH%;%MKS_HOME%
set PATH=%PATH%;%PYTHON27%
set PATH=%PATH%;%JAVA_HOME%
set PATH=%PATH%;%CD%\graalvm\mx
mkdir graalvm
cd graalvm
IF exist graal ( 
  cd graal
  git pull
  cd ..
) ELSE ( 
  git clone https://github.com/graalvm/graal.git
)
IF exist mx ( 
  cd mx
  git pull
  cd ..
) ELSE (
  git clone https://github.com/graalvm/mx.git
)

cd graal/compiler
call mx clean
call mx build
cd ../../..