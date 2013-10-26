Application for High Availability

Couldn't create relationships with apache and mysql, apache and memcache. 

Memcache handles all sessions of the site.

MysqlProxy balances read traffic between each mysql server.

All write queries only go to master through. 