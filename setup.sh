#!/bin/bash
sudo -u hdfs hadoop fs -mkdir -p /etl/BI/casualcyclist/clicks/rawlogs
sudo -u hdfs hadoop fs -chmod 1777 /etl/BI/casualcyclist/clicks/rawlogs

sudo -u hdfs hadoop fs -mkdir -p /etl/BI/casualcyclist/clicks/sessionizedlogs/year=2014/month=10/
sudo -u hdfs hadoop fs -chmod 1777 /etl/BI/casualcyclist/clicks/sessionizedlogs/year=2014/month=10/

sudo -u hdfs hadoop fs -mkdir -p /data/bikeshop/clickstream
sudo -u hdfs hadoop fs -chmod 1777 /data/bikeshop/clickstream

sudo -u hdfs hadoop fs -mkdir -p /user/$USER
sudo -u hdfs hadoop fs -chown $USER:$USER /user/$USER
