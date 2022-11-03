FROM sburn/apache-atlas

#Add atlas hive hook jars
ADD ./config/atlas-application.properties /opt/apache-atlas-2.1.0/conf
