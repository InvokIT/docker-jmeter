FROM openjdk:8

ARG JMETER_VERSION=3.3
ENV JMETER_VERSION=$JMETER_VERSION

RUN cd /opt/ \
  && curl -sSLfOO https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz{,.md5} \
  && md5sum -c apache-jmeter-${JMETER_VERSION}.tgz.md5 \
  && tar -xzf apache-jmeter-${JMETER_VERSION}.tgz \
  && ln -s apache-jmeter-${JMETER_VERSION} apache-jmeter \
  && rm apache-jmeter-${JMETER_VERSION}.tgz*

EXPOSE 4445

ENTRYPOINT ["/opt/apache-jmeter/bin/jmeter"]
