-- This query makes use of Windowing functions in Hive which are only available in
-- Apache Hive 0.11+, CDH 5.0.0+, etc.
ADD JAR /usr/lib/hive/lib/hive-contrib.jar;

set parquet.compression=GZIP;

-- Important to set memory parameters like this  mapreduce.map.java.opts = -Xmx4G; mapreduce.reduce.java.opts = -Xmx4G
INSERT INTO TABLE apache_log_parquet
PARTITION(year=2014, month=10, day=10)
SELECT ip, ts, url, referrer, user_agent, session_id
FROM sessionized_log
WHERE year=2014 AND month=10 AND day=10;

-- SELECT * FROM apache_log_parquet LIMIT 5;
