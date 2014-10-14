DROP TABLE sessionized_log;
 
CREATE EXTERNAL TABLE sessionized_log(
        IP              STRING,
        ts              STRING,
        URL             STRING,
        referrer        STRING,
        user_agent      STRING,
        session_id      STRING)
PARTITIONED BY (
        year            INT,
        month           INT,
        day             INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
        "input.regex" = "(\\d+.\\d+.\\d+.\\d+).*\\[(.*) \\].*GET (\\S*).*\\d+ \\d+ (\\S+) \"(.*)\" (.+)"
)
LOCATION '/etl/BI/casualcyclist/clicks/sessionizedlogs';

ALTER TABLE sessionized_log ADD PARTITION (year=2014, month=10, day=10);
-- Need a later version of a distribution like CDH4.5.0+ for using Parquet Hive out of the box
-- TODO: processed_log is a better name for this table.
DROP TABLE apache_log_parquet;

CREATE EXTERNAL TABLE apache_log_parquet(
        IP              STRING,
        t	        STRING,
        URL             STRING,
        referrer        STRING,
        user_agent      STRING,
	session_id	STRING)
PARTITIONED BY (
	year            INT,
	month 		INT,
	day 		INT)
ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
STORED AS
INPUTFORMAT "parquet.hive.DeprecatedParquetInputFormat"
OUTPUTFORMAT "parquet.hive.DeprecatedParquetOutputFormat"
LOCATION '/data/bikeshop/clickstream';
-- This query makes use of Windowing functions in Hive which are only available in
-- Apache Hive 0.11+, CDH 5.0.0+, etc.
ADD JAR /usr/lib/hive/lib/hive-contrib.jar;

set parquet.compression=GZIP;

-- Important to set memory parameters like this  mapreduce.map.java.opts = -Xmx4G; mapreduce.reduce.java.opts = -Xmx4G
INSERT OVERWRITE TABLE apache_log_parquet
PARTITION(year=2014, month=10, day=10)
SELECT ip, ts, url, referrer, user_agent, session_id
FROM sessionized_log
WHERE year=2014 AND month=10 AND day=10;

-- SELECT * FROM apache_log_parquet LIMIT 5;
