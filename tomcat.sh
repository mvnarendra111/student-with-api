#!/bin/bash 

/tomcat/bin/startup.sh 
if [ $? -ne 0 ]; then 
	echo Tomcat Container Startup Failed
	exit 1
fi

tail -f /tomcat/logs/catalina.out
