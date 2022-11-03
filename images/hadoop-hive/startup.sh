#!/bin/bash

hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -mkdir -p    /usr/hdp/atlas/hook/hive/
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse
hadoop fs -chmod g+w   /usr/hdp/atlas/hook/hive/
hadoop fs -put /usr/hdp/2.3.0.0-2557/atlas/hook/hive/* /user/oozie/share/lib/lib200344/hive 

cd $HIVE_HOME/bin
./hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=INFO,console --hiveconf hive.server2.enable.doAs=false
