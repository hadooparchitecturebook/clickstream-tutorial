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
