sudo oozie-setup sharelib create -fs hdfs://localhost:8020 --locallib /usr/lib/oozie/oozie-sharelib-yarn.tar.gz
hdfs dfs -rm -r /app/oozie-workflows/clickstream
hdfs dfs -mkdir -p /app/oozie-workflows/clickstream/lib
hdfs dfs -put processing.xml /app/oozie-workflows/clickstream
hdfs dfs -put dedup.pig /app/oozie-workflows/clickstream
hdfs dfs -put ../03_processing/02_sessionization/mr/target/MRSessionize-1.0-SNAPSHOT.jar /app/oozie-workflows/clickstream/lib
hdfs dfs -put /etc/hive/conf/hive-site.xml /app/oozie-workflows/clickstream
hdfs dfs -put ../03_processing/03_parquetize/hive/01_parquetize.hql /app/oozie-workflows/clickstream

