#!/bin/bash

# Lock contention is influenced by two factors,
# 1. How often is the lock requested by threads running on-CPU ? 
# 2. How long are the locks held once required ?
# ***Locks are mostly uncontented when the product of the above 2 questions is sufficiently small.***

# Reduce duration of locks held, frequency of lock requests and replace exclusive locks in favor of concurrency friendly collections, read-write locks, 
# immutable objects and atomic variables. 

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
