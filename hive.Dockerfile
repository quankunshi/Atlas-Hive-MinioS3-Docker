FROM johannestang/hive:2.3.6-postgresql-metastore-s3

ENV ATLAS_HIVE_HOOK_HOME /opt/atlas-hive-hook

#Add atlas hive hook jars
ADD apache-atlas-hive-hook-3.0.0-SNAPSHOT/hook/hive $ATLAS_HIVE_HOOK_HOME
ADD ./images/hadoop-hive/conf/hive-site.xml $HIVE_HOME/conf
ADD ./images/hadoop-hive/conf/hive-env.sh $HIVE_HOME/conf
ADD ./images/hadoop-hive/conf/atlas-application.properties $HIVE_HOME/conf
