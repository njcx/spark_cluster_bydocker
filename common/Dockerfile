# Use Java 8
FROM centos:7
# Install needed tools
RUN  yum makecache && yum install epel-* -y && yum install gcc-c++ cpp wget curl tar unzip zip htop java-1.8.0-openjdk-devel java-1.8.0-openjdk  librdkafka-devel python-pip  python-devel gcc make re2-devel -y
# Download Spark
RUN  mkdir /root/.pip
COPY pip.conf  /root/.pip
RUN  pip install setuptools==25.0.0
RUN  pip install py2neo==4.3.0 redis re2 ujson pyArango neo4j-driver==1.7.6
RUN  pip install --no-binary :all: confluent-kafka==0.11.6

RUN wget "https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"


RUN tar -xzf spark-2.4.5-bin-hadoop2.7.tgz && \
    mv spark-2.4.5-bin-hadoop2.7 /spark && \
    rm spark-2.4.5-bin-hadoop2.7.tgz
RUN cp /spark/conf/spark-env.sh.template  /spark/conf/spark-env.sh

RUN echo "export PYSPARK_PYTHON=/usr/bin/python" >>  /spark/conf/spark-env.sh
RUN echo "export PYSPARK_DRIVER_PYTHON=/usr/bin/python" >> /spark/conf/spark-env.sh

ENV  SPARK_HOME="/spark/"


