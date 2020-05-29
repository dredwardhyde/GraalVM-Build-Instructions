# Building the GraalVM compiler for Hotspot JVM

## Windows 10

### Prerequisites
- **Visual Studio 2017** must be installed 
- Execute scripts below from **x64 Native Tools Command Prompt for VS 2017**
- Windows 10 SDK must be installed from [here](https://go.microsoft.com/fwlink/p/?linkid=2120843)
- OpenJDK 14 could be downloaded from [here](https://bell-sw.com/pages/downloads/?release=14.0.1+8)
- Python 2.7 must be installed from [here](https://www.python.org/ftp/python/2.7.18/python-2.7.18.amd64.msi)
- Git for Windows must be installed from [here](https://git-scm.com/download/win)

### Building process 
- Open **x64 Native Tools Command Prompt for VS 2017**
- Execute following commands:
  - ```set JAVA_HOME=<path to JDK 14 folder>```
  - ```set PYTHON27=<path to Python 2.7 folder>```
  - ```set EXTRA_JAVA_HOMES=<path to JDK 14 folder>```
  - ```set MKS_HOME=<path to Git for Windows bin folder>```
  - ```cd <any empty that will be used for building>```
  - ```set PATH=%PATH%;%MKS_HOME%```
  - ```set PATH=%PATH%;%PYTHON27%```
  - ```set PATH=%PATH%;%JAVA_HOME%```
  - ```set PATH=%PATH%;%CD%\graalvm\mx```
  - ```mkdir graalvm```
  - ```cd graalvm```
  - ```git clone https://github.com/graalvm/graal.git```
  - ```git clone https://github.com/graalvm/mx.git```
  - ```cd graal/compiler```
  - ```mx clean```
  - ```mx build```

 - After that the following command should print similar output:  
```mx vm -XX:+UnlockExperimentalVMOptions -XX:+UseJVMCICompiler  -XX:+EnableJVMCI  -Dgraal.CompilerConfiguration=community -XX:+EagerJVMCI -Dgraal.ShowConfiguration=info -Djvmci.Compiler=graal -version```
