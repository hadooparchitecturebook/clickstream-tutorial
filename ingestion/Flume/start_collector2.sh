#!/bin/sh

flume-ng agent -n collector2 --conf . -f collector2.conf
