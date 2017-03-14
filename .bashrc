# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi

  # set the default region for the AWS CLI
  export AWS_DEFAULT_REGION=$(curl --retry 5 --silent --connect-timeout 2
  http://169.254.169.254/latest/dynamic/instance-identity/document | grep region
  | awk -F\" '{print $4}')
  export JAVA_HOME=/etc/alternatives/jre

  export SPARK_HOME="/usr/lib/spark"
  export PYSPARK_SUBMIT_ARGS='--master yarn --deploy-mode client --conf
  spark.serializer=org.apache.spark.serializer.KryoSerializer --num-executors 34
  --executor-memory 4g --executor-cores 2 --driver-java-options
  -Dlog4j.configuration=file:///usr/lib/spark/conf/log4j.properties --conf
  spark.default.parallelism=42 --conf spark.driver.memory=3g --conf
  spark.driver.maxResultSize=2g --conf spark.shuffle.spill=true  --conf
  spark.sql.autoBroadcastJoinThreshold=209715200 --conf
  spark.sql.shuffle.partitions=1000 --conf
  spark.yarn.executor.memoryOverhead=1536'
  alias notebook='ipython notebook --profile=pyspark'

  alias 'hc=hdfs dfs -cat'
  alias 'hl=hdfs dfs -ls -h'
  alias 'hco=hdfs dfs -count -h'
  alias 'hp=hdfs dfs -put'
  alias 'hg=hdfs dfs -get'
  alias 'hgm=hdfs dfs -getmerge'

  export SPARK_HOME="/usr/lib/spark"
  export PYSPARK_SUBMIT_ARGS='--master yarn --deploy-mode client --conf
  spark.serializer=org.apache.spark.serializer.KryoSerializer --num-executors 34
  --executor-memory 4g --executor-cores 2 --driver-java-options
  -Dlog4j.configuration=file:///usr/lib/spark/conf/log4j.properties --conf
  spark.default.parallelism=42 --conf spark.driver.memory=3g --conf
  spark.driver.maxResultSize=2g --conf spark.shuffle.spill=true  --conf
  spark.sql.autoBroadcastJoinThreshold=209715200 --conf
  spark.sql.shuffle.partitions=1000 --conf
  spark.yarn.executor.memoryOverhead=1536'
  alias notebook='ipython notebook --profile=pyspark'
