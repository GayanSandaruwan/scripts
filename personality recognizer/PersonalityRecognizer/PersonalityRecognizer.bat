@echo off
rem WINDOWS LAUNCH SCRIPT

rem ENVIRONMENT VARIABLES TO MODIFY
echo %JAVA_HOME%
set JDK_PATH="C:\Program Files\Java\jdk1.8.0_45"
rem set WEKA="H:\apps\weka-3-4\weka.jar"
set WEKA="weka-3-4\\weka.jar"
rem ----------------------------------

set COMMONS_CLI="lib\\commons-cli-1.0.jar"
set JMRC="lib\\jmrc.jar"

set LIBS=%WEKA%;%COMMONS_CLI%;%JMRC%;"%CD%";bin\

echo %LIBS%

rem powershell -Command "(gc PersonalityRecognizer.properties.bak) -replace 'appDIRsetBYscript', '%CD%' | Out-File -encoding ASCII  PersonalityRecognizer.properties"


rem %JDK_PATH%\bin\java -Xmx512m -classpath %LIBS% recognizer.PersonalityRecognizer %1 %2 %3 %4 %5 %6 %7 %8 %9
java -Xmx512m -classpath %LIBS% recognizer.PersonalityRecognizer %1 %2 %3 %4 %5 %6 %7 %8 %9