FROM qnib/alplain-jre8

VOLUME ["/data/zookeeper"]
ARG ZK_VER=3.4.8
ARG ZK_URL=http://apache.claz.org/zookeeper
ENV PATH=/opt/zookeeper/bin:${PATH}

RUN apk add --update curl \
 && curl -fsL ${ZK_URL}/zookeeper-${ZK_VER}/zookeeper-${ZK_VER}.tar.gz | tar xzf - -C /opt \
 && mv /opt/zookeeper-${ZK_VER} /opt/zookeeper \
 && rm -rf /tmp/* /var/cache/apk/*
ADD opt/qnib/zookeeper/bin/start.sh /opt/qnib/zookeeper/bin/
ENV PATH=/opt/zookeeper/bin:${PATH}
RUN echo "tail -f /var/log/supervisor/zookeeper.log" >> /root/.bash_history && \
    echo "cat /opt/zookeeper/conf/zoo.cfg" >> /root/.bash_history
ADD opt/zookeeper/conf/zoo.cfg /opt/zookeeper/conf/
