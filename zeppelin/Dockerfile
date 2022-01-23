FROM ryuk4/spark-base:3.1.2-hadoop3.2

LABEL maintainer="M Fajar M <captainfreedom37@gmail.com>"

ENV ZEPPELIN_HOME="/opt/zeppelin"

COPY require /root
COPY env_python_3_with_R.yml /

RUN bash /root/install-lang.sh
RUN bash /root/install-glibc.sh 
RUN bash /root/install-miniconda.sh
RUN bash /root/install-zeppelin.sh

RUN rm -f /root/install-lang.sh \
    /root/install-glibc.sh \
    /root/install-miniconda.sh \
    /root/install-zeppelin.sh

COPY log4j.properties ${ZEPPELIN_HOME}/conf/
COPY log4j_docker.properties ${ZEPPELIN_HOME}/conf/
COPY log4j2.properties ${ZEPPELIN_HOME}/conf/
COPY log4j2_docker.properties ${ZEPPELIN_HOME}/conf/
COPY Example-Notebook ${ZEPPELIN_HOME}/notebook/

# Remote Sharing File
ARG shared_workspace=/resource
RUN mkdir -p ${shared_workspace}
ENV SHARED_WORKSPACE=${shared_workspace}
VOLUME ${shared_workspace}

USER $UNAME

EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${ZEPPELIN_HOME}
CMD ["bin/zeppelin.sh"]
