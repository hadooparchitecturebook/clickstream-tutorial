# Clickstream Tutorial


Code for Tutorial on designing clickstream analytics application using Hadoop
We developed and tested this tutorial using Cloudera's Quickstart VM, CDH 5.2.
You can download the VM here: http://www.cloudera.com/content/cloudera/en/documentation/DemoVMs/Cloudera-QuickStart-VM/cloudera_quickstart_vm.html

Start the tutorial by using "git clone" to create a copy of this repository on your VM.

## To run the demo end-to-end:
* Run setup.sh to create the directory structure needed for the tutorial (If you ran this tutorial before, you'll want to run cleanup.sh first)
* Run 01_loggen/generate_apache_logs.py - This will create an example clickstream log in /opt/weblogs
* Follow the instructions in 02_ingestion/Flume/README.md - This will show you how to use Flume to ingest the logs we generated into Hadoop
* Run 03_processing/01_dedup/pig/dedup.sh to remove duplicate events from the clickstream log
* Follow the instructions in 03_processing/02_sessionization/mr/ to enrich the data with information about user sessions using MapReduce
* Run 03_processing/03_paquetize/hive/run_all.sh to convert the sessionized data to Parquet format and to create the tables we'll later use for querying
* Now you can run the query in 03_processing/04_query/query-parquet-log-table.hql using either Hive or Impala - this will give you the bounce-rate of your website for this day.
* You can also run all the processing steps (dedup, sessionize and parquetize) automatically using an Oozie workflow. For that:
..* Run 04_orchestration/setup.sh to setup the Oozie library directory, and then upload the Hive and Pig scripts, the MapReduce jar and the Oozie workflow to HDFS. This is a requirement for running Oozie workflows.
..* Then run 04_orchestration/run.sh to trigger the workflow. Once the workflow is triggered, you can use Hue on the VM to watch the workflow dashboard and see its progress. When it finished, you can query the data using Hive or Impala as mentioned above.



