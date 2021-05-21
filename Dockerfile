FROM centos:7
RUN yum install java -y
ADD https://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz /opt
RUN tar -xf /opt/apache-tomcat-9.0.46.tar.gz
RUN rm -f /opt/apache-tomcat-9.0.46.tar.gz
RUN mv apache-tomcat-9.0.46 tomcat
RUN rm -rf /tomcat/webapps/*
ADD https://github.com/cit-aliqui/APP-STACK/raw/master/student.war /tomcat/webapps
ADD https://github.com/cit-aliqui/APP-STACK/raw/master/mysql-connector-java-5.1.40.jar /tomcat/lib
COPY context.xml /tomcat/conf
COPY catalina.sh /tomcat/bin
COPY tomcat.sh /
RUN chmod +x /tomcat.sh /tomcat/bin/catalina.sh
EXPOSE 8080
EXPOSE 8009
CMD /tomcat.sh 
