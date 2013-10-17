# Monitoring Stack

This Juju Deployment will build a full monitoring and logging stack for your environment.

## The following Applications will be Installed and configured

* Juju
** bootstrap node
** juju GUI
* Queuing
** RabbitMQ
* Logging
** Elasticsearch
** Kibana
** Logstash Server
** Logstash Agent(s) on all machines
* Monitoring
** Graphite
** Sensu Server
** Sensu Agent(s) on all machines

If you are building your whole environment in juju you can simply add the logstash agent and sensu agent
subordinate charms to any system you want to monitor.   Logstash agent is set up to look for common log directories for sensu, nginx, and apache and should start collecting their logs.  

If you have servers outside of the juju deployment you can install the logstash agent or sensu agent on those servers
and set them to send their data to the public port of the RabbitMQ server.

Between the server startup time and getting all the dependencies hooked together,  don't be surprised if it takes 15mins or more before kibana and sensu/graphite start seeing good data.

## To Deploy

```
sudo pip install juju-deployer
juju bootstrap
juju-deployer -c monitoringstack.yaml
```

^ I had some (issues with the GUI)[https://bugs.launchpad.net/juju-core/+bug/1240708] export and subordinate charms ( bonus points for finding a bug right? ),  so I put together the following shell script to deploy the same stack via the CLI.     

```
sh monitoringstack.sh
```

## To access

`juju status` can be a little hard to read when there's a lot of services,  so I wrote a little shell script to find and display the hostname/urls needed to access the various dasbhoards.  It is a little primitive and may not parse correctly until all services are up.

If you're using a decent terminal you should even be able to click on the resultant URLs.

```
sudo pip install shyaml
./show-services
```

Below is the easiest way I could think of to represent how to find the hostnames/URLs by eyeballing the `juju status` output.

### Kibana   

#### Basic Dashboard
http://`services => kibana => public-address`:80

#### Web site statistics
http://`services => kibana => public-address`/index.html#/dashboard/file/web.json

### Sensu

http://`services => sensu-server => public-address`:8080

* username: admin
* password: secret

### Graphite 

#### Base Graphite Web

http://`services => graphite => public-address`:80

#### Graphlot graph plotting cpu.user across all systems

http://`services => graphite => public-address`/graphlot/?from=-1hour&until=-0hour&target=stats.*.cpu.user

## Logstash agents


## Caveats

### This deployment is not HA.   To make it fully HA you would need to do the following

* Add more Elasticsearch units
** easy if in amazon,  can use EC2 discovery for auto-clustering
** if you have luxury of multicast it should just work
** there's some experimental config options ( ZENMASTERS ) which should work for unicast discovery, but not well tested.
* Add more RabbitMQ units ( I haven't tested the clustering,  but the charm looks like it supports it )
* Add a redundant Logstash Server ( or just have a script to start a new one if existing fails )
* Add a redundant Sensu Server ( or just have a script to start a new one if existing fails )
* Add a redundant Kibana Server and put a LB in front ( or just have a script to start a new one if existing fails )
* Add support to Graphite charm to be HA and then add more Graphite units

### No alerting

* I didn't want to alert by default, because I don't know how you like to alert.
* Pretty simple to set up Sensu to alert via email or via PagerDuty API