# Deploy Services
juju deploy juju-gui
juju deploy rabbitmq-server rabbit
juju deploy cs:~paulcz/precise/sensu-server
juju deploy cs:~paulcz/precise/graphite
juju deploy cs:~paulcz/precise/logstash-indexer
juju deploy cs:~paulcz/precise/kibana
juju deploy cs:~paulcz/precise/elasticsearch

# Deploy Subordinates
juju deploy cs:~paulcz/precise/sensu-agent
juju deploy cs:~paulcz/precise/logstash-agent

# Set any config options
juju set graphite rabbit_username=sensu rabbit_vhost=sensu rabbit_exchange=metrics

# Create Relationships
juju add-relation sensu-server rabbit
juju add-relation graphite:amqp rabbit
juju add-relation logstash-indexer:amqp rabbit
juju add-relation elasticsearch:cluster logstash-indexer
juju add-relation elasticsearch:rest kibana

# Deploy Agents
## Logstash
juju add-relation logstash-agent:juju-info rabbit
juju add-relation logstash-agent:juju-info juju-gui
juju add-relation logstash-agent:juju-info sensu-server
juju add-relation logstash-agent:juju-info graphite
juju add-relation logstash-agent:juju-info kibana
juju add-relation logstash-agent:juju-info elasticsearch
juju add-relation logstash-agent:amqp rabbit
## Sensu
juju add-relation sensu-agent:juju-info rabbit
juju add-relation sensu-agent:juju-info juju-gui
juju add-relation sensu-agent:juju-info graphite
juju add-relation sensu-agent:juju-info logstash-indexer
juju add-relation sensu-agent:juju-info kibana
juju add-relation sensu-agent:juju-info elasticsearch
juju add-relation sensu-agent:amqp rabbit


# Expose services to the interwebs
juju expose sensu-server
juju expose graphite
juju expose kibana
juju expose rabbit
juju expose juju-gui

