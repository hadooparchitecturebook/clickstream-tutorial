#!/bin/sh

hadoop fs -rm -r dedupedlogs

pig -x mapreduce -param raw_log_dir='duplogs' -param deduped_log_dir='dedupedlogs' dedup.pig
