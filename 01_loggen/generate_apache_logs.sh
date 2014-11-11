#!/bin/sh

./generate_apache_logs.py
mv combined_log_*.log /opt/weblogs
