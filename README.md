![Juju](http://ubuntuone.com/5mLQLCHY50wB2OyqejDpRa)

2 bundles:

  - 1. Entry: Data Science / Data Mining - represents a full stack of data mining and “big data” analysis.

![Screenshot from JuJu Gui](bigdata.png "Screenshot from JuJu Gui")

  - this charm bundle is called bigdata. It includes the following charms:
    - hadoop with hbase and pig enabled
    - hive
    - mysql
    - nagios nrpe

  - to deploy:

juju bootstrap

sleep 180

juju-deployer -d -v -c bigdata.yaml envExport

juju status


  - 2. Entry: HA of the apache2 service.

![Screenshot from JuJu Gui](ha_apache.png "Screenshot from JuJu Gui")

  - this charm bundle is called ha_apache. It includes the following charms:
    - apache2
    - haproxy
    - nagios nrpe
    - ganglia node

  - to deploy:

juju bootstrap

sleep 180

juju-deployer -d -v -c ha_apache.yaml envExport

juju status


