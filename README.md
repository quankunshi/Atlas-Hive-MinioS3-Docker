# Atlas-Hive-MinioS3

Hi there! 
This repository can help you quickly!
 - Hadoop 2.8.5
 - Minio RELEASE.2019-10-12T01-39-57Z
 - Hive 2.3.6
 - Atlas 2.1.0
 
## Build images
Hive images:
```
docker build -f hive.Dockerfile -t johannestang/hive:2.3.6-postgresql-metastore-s3 ./
```
Atlas images:
```
docker build -f atlas.Dockerfile -t sburn/apache-atlas ./
```

The stack should now be up and running and the following services available:

 - Hadoop namenode: http://localhost:50070
 - Minio: http://localhost:9000 | user/password: minio/minio123
 - Atlas: http://localhost:21000 | user/password: admin/admin

## Example
Docker-compose:
```
Docker-compose up -d
```
Create a table in the Hive metastore:
Login to Minio and create buckets `customer-data-text` and add this file [customer](https://github.com/minio/presto-minio/blob/main/minio/data/customer-data-text/customer.csv)
Run `docker exec -it hive-server /bin/bash`.
```
# hive
hive> use default;
hive> create external table customer_text(id string, fname string, lname string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE location 's3a://customer-data-text/';
hive> select * from customer_text;
```
Login to Atlas and see the results
## Contents

This repository I incorporated from [johannestang/bigdata_stack](https://github.com/johannestang/bigdata_stack) and [zanmato1984/atlas-hive-docker](https://github.com/zanmato1984/atlas-hive-docker) and also [minio/presto-minio](https://github.com/minio/presto-minio)
