#FROM 10.45.80.1/public/centos7_java8_tomcat8_base:8.0.35
FROM 10.45.80.1/public/centos7-java-base:openjdk1.8.0.151
MAINTAINER gengbin
COPY ./docker-app.def /root/docker-app.def
COPY ./boot-0.0.1-SNAPSHOT.jar /root/lib/
EXPOSE 8088
RUN mkdir -p /root/logs \
    && chmod +x /root/docker-app.def

ENV APP_NAME=boot

ENTRYPOINT ["/usr/local/bin/tini", "-g", "--", "docker-entrypoint.sh"]
CMD ["start"]
#ENTRYPOINT ["java","-jar","/bootdo-2.0.0.jar"]