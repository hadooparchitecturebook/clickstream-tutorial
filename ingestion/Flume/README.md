Clickstream Ingestion Example
=============================

The files in this directory provide an example of ingesting Apache logs into HDFS via Apache Flume as part of a clickstream analysis workflow. This example is set up to run on a single node Hadoop install, and simulates the following scenario:

* A Flume agent running on a web server which sends log events via Avro sinks to collector agents running on remote hosts. This agent is referred to as the *client* agent.
* Two collector agents running on different hosts. Each agent receives events from the client via an Avro source, and writes events to HDFS. These are the *collector1* and *collector2* agents.

This example is set up to run on a Cloudera CDH install on a single node, for example with the Cloudera QuickStart VM. These examples were tested with CDH 5.1.

To configure and run the example:

* Create directory to pull logs from. The current config is set to */opt/weblogs*. To use an alternate directory, change the *client.sources.r1.spoolDir* value in *client.conf*. Make sure this directory is readable and writable by the user that will be executing the Flume agents. For example:
 
    $ sudo mkdir /opt/weblogs
    $ sudo chmod 777 /opt/weblogs

* Create directory for the Flume file channels and make sure it's readable and writable by the user executing the Flume agents. The current configuration uses /opt/flume. As an example:

    $ sudo mkdir /opt/flume
    $ sudo chmod 1777 /opt/flume

To run the ingestion example:

* Open two terminal windows to run the collector agents. In the first terminal window execute:

    $ cd clickstream-tutorial/ingestion/Flume
    $ flume-ng agent -n collector1 --conf . -f collector1.conf
* In the second terminal window, execute:
    $ cd clickstream-tutorial/ingestion/Flume
    $ flume-ng agent -n collector2 --conf . -f collector2.conf 
* Open another terminal window to run the client agent, and execute the following:

    $ cd clickstream-tutorial/ingestion/Flume
    $ flume-ng agent -n client --conf . -f client.conf 

* Copy test logs to the local weblog directory created in the first step. You can use the fake Apache combined logs created with the * clickstream-tutorial/loggen/generate_apache_logs.py* script. For example:

    $ cp clickstream-tutorial/loggen/combined_log_*.log /opt/weblogs

* Confirm that the logs have been written to the specified directory in HDFS:

    $ hadoop fs -ls /etl/BI/casualcyclist/clicks/rawlogs/year=...

