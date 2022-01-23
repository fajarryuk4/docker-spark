FROM ryuk4/spark-base:3.1.2-hadoop3.2

LABEL maintainer="M Fajar M <captainfreedom37@gmail.com>"

COPY install-zeppelin.sh /root
COPY env_python_3_with_R.yml /

RUN bash /root/install-zeppelin.sh && rm -f /root/install-zeppelin.sh

COPY log4j.properties ${ZEPPELIN_HOME}/conf/
COPY log4j_docker.properties ${ZEPPELIN_HOME}/conf/
COPY log4j2.properties ${ZEPPELIN_HOME}/conf/
COPY log4j2_docker.properties ${ZEPPELIN_HOME}/conf/

USER $UNAME

EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${ZEPPELIN_HOME}
CMD ["bin/zeppelin.sh"]
