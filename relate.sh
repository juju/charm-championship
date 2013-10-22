juju add-relation stormmaster zookeeper
juju add-relation stormworker zookeeper
juju add-relation stormmaster:master stormworker:worker
juju expose stormmaster
juju expose stormworker
