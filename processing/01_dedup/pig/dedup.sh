#!/bin/sh

hadoop fs -rm -r /etl/BI/casualcyclist/clicks/deduplogs/year=2014/month=10/day=10

pig -x mapreduce -param raw_log_dir='/etl/BI/casualcyclist/clicks/rawlogs/year=2014/month=10/day=10' -param deduped_log_dir='/etl/BI/casualcyclist/clicks/deduplogs/year=2014/month=10/day=10' dedup.pig
