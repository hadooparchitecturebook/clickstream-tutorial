The script in this directory will generate fake logs that conform to the Apache combined log format (http://httpd.apache.org/docs/2.2/logs.html). The following provides an example of the format of a record in the generated logs:

    198.122.118.164 - - [10/Oct/2013:00:00:39 ] "GET /seatposts HTTP/1.0" 200 3061 "http://searchengine.com" "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)"

To run, just execute the following:

    $ ./generate_apache_logs.py

This will create a file in the current directory named *combined_log_<timestamp>.log*.