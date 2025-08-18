FROM docker.io/bitnami/spark:3.3.2

USER root

# Install prerequisites
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Download required JARs in folder 
WORKDIR /tmp/jars

# Jars for Spark to work with Kafka + Avro
RUN curl -L -O https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.3.2/spark-sql-kafka-0-10_2.12-3.3.2.jar && \
    curl -L -O https://repo1.maven.org/maven2/org/apache/spark/spark-token-provider-kafka-0-10_2.12/3.3.2/spark-token-provider-kafka-0-10_2.12-3.3.2.jar && \
    curl -L -O https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.3.2/kafka-clients-3.3.2.jar && \
    curl -L -O https://repo1.maven.org/maven2/org/apache/commons/commons-pool2/2.11.1/commons-pool2-2.11.1.jar && \
    curl -L -O https://repo1.maven.org/maven2/org/apache/spark/spark-avro_2.12/3.3.2/spark-avro_2.12-3.3.2.jar

# Jars for Spark to work with MinIO
RUN curl -L https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar && \
    curl -L https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.1026/aws-java-sdk-bundle-1.11.1026.jar

# Jars for Spark to work with Iceberg
RUN curl -L -O https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.3_2.12/1.5.0/iceberg-spark-runtime-3.3_2.12-1.5.0.jar 

# Move all jars to folder ...
RUN mv *.jar /opt/bitnami/spark/jars/ && \
    rm -rf /tmp/jars


# Switch back
WORKDIR /opt/spark/app
USER 1001