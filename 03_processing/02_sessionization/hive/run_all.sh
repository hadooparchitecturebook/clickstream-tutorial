#!/bin/bash -x
hive -f 01-create-raw-log-table.hql
hive -f 02-create-parquet-log-table.hql
hive -f 03-populate-parquet-log-table.hql
hive -f 04-query-parquet-log-table.hql

