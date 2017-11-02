# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi

  # set the default region for the AWS CLI
  export AWS_DEFAULT_REGION=$(curl --retry 5 --silent --connect-timeout 2
  http://169.254.169.254/latest/dynamic/instance-identity/document | grep
  region | awk -F\" '{print $4}')
  export JAVA_HOME=/etc/alternatives/jre

  export SPARK_HOME="/usr/lib/spark"

  # THIS IS FOR ONE m4.10xlarge instance!!!!!
  export PYSPARK_SUBMIT_ARGS='--master yarn --deploy-mode client
  --driver-memory 9g
  --executor-memory 10976m
  --executor-cores 4
  --conf spark.default.parallelism=40
  --conf spark.sql.shuffle.partitions=40
  --conf spark.yarn.executor.memoryOverhead=4096
  --driver-java-options
  -Dlog4j.configuration=file:///usr/lib/spark/conf/log4j.properties
  pyspark-shell'

  export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
  export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.3-src.zip:$PYTHONPATH

  alias notebook='jupyter notebook --no-browser --port 8889'

  alias 'hc=hdfs dfs -cat'
  alias 'hco=hdfs dfs -count -h'
  alias 'hl=hdfs dfs -ls -h'
  alias 'hp=hdfs dfs -put'
  alias 'hg=hdfs dfs -get'
  alias 'hgm=hdfs dfs -getmerge'
