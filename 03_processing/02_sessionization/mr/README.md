MRSessionize
============
Sessionization code written in MapReduce

To build:
<pre>
<code>
mvn clean package
</code>
</pre>



1. You may have to copy joda-time jar to HADOOP_HOME/lib until we start building an uber jar:-(.
Something like:
<pre>
<code>
sudo cp ~/.m2/repository/joda-time/joda-time/2.3/joda-time-2.3.jar /usr/lib/hadoop/lib
</code>
</pre>

2. Before you run the code, you need to make sure the output directory's parent directory exists and has the correct permissions.
<pre>
<code>
sudo -u hdfs hadoop fs -mkdir -p /etl/BI/casualcyclist/clicks/sessionizedlogs/year=2014/month=10/
sudo -u hdfs hadoop fs -chmod 1777 /etl/BI/casualcyclist/clicks/sessionizedlogs/year=2014/month=10/
</code>
</pre>

3. Run the code with something a command like this:
<pre>
<code>
hadoop jar ./target/MRSessionize-1.0-SNAPSHOT.jar com.hadooparchitecturebook.MRSessionize /etl/BI/casualcyclist/clicks/deduplogs/year=2014/month=10/day=10/* /etl/BI/casualcyclist/clicks/sessionizedlogs/year=2014/month=10/day=10
</code>
</pre>
