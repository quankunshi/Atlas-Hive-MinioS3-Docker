build:
	docker build -f hive.Dockerfile -t johannestang/hive:2.3.6-postgresql-metastore-s3 ./
	cd atlas
	docker build -f atlas.Dockerfile -t sburn/apache-atlas ./
