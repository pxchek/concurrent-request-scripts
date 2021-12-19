#!/bin/bash

# curlHttpRequests.sh 5 732C35D59030443DAEEE5996D1CA3476

# Simulates multiple calls to recreate thread contention issues on the back-end such as java.lang.Thread.State: BLOCKED (on object monitor)

while true; do
  for i in $(seq $1); do
    curl -k 'www.mysite.com/path1'
    -H 'Cookie:JSESSIONID='$2 >/dev/null & # add more cookies if required to recreate the scenarios for testing.

    curl -k 'www.mysite.com/path2'
    -H 'Cookie:JSESSIONID='$2 >/dev/null & # add more cookies if required to recreate the scenarios for testing.

    curl -k 'www.mysite.com/path3'
    -H 'Cookie:JSESSIONID='$2 >/dev/null & # add more cookies if required to recreate the scenarios for testing.

    curl -k 'www.mysite.com/path4'
    -H 'Cookie:JSESSIONID='$2 >/dev/null & # add more cookies if required to recreate the scenarios for testing.

    curl -k 'www.mysite.com/path5'
    -H 'Cookie:JSESSIONID='$2 >/dev/null & # add more cookies if required to recreate the scenarios for testing.

  done
  wait
done
