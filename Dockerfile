FROM centos:7

MAINTAINER yzhan737@ucr.edu

RUN rpm --rebuilddb \
    && yum clean all \
    && yum install -y --skip-broken git wget net-tools which

ADD jdk-8u281-linux-x64.tar.gz /usr/local/
ENV JAVA_HOME /usr/local/jdk1.8.0_281
ENV PATH $JAVA_HOME/bin:$PATH

ADD apache-maven-3.6.3-bin.tar.gz /usr/local/
ENV MAVEN_HOME /usr/local/apache-maven-3.6.3
ENV PATH $MAVEN_HOME/bin:$PATH

ADD spark-3.0.2-bin-hadoop2.7.tgz /usr/local/
ENV SPARK_HOME /usr/local/spark-3.0.2-bin-hadoop2.7
ENV PATH $SPARK_HOME/bin:$PATH

RUN echo 'export PS1="\[\e[32;3m\]\u\[\e[0m\]:\[\e[36;1m\]\w\[\e[0m\]$ "' >> /root/.bashrc
