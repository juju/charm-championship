codename=`cat /etc/lsb-release | grep CODENAME | cut -f2 -d'='`

sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:juju/stable
sudo apt-get update
sudo apt-get -y install juju-core lxc mongodb-server

mkdir -p ~/charm/$codename
mkdir -p ~/charm/precise
git clone git@github.com:peterklipfel/storm_charm.git ~/charm/$codename/storm
git clone git@github.com:peterklipfel/storm_charm.git ~/charm/precise/storm


sed s/notsosecret/`tr -dc "[:alpha:]" < /dev/urandom | head -c 30`/ aws.yaml > tmp.yaml
sed s/notsounique/`tr -dc "[:alpha:]" < /dev/urandom | head -c 30`/ tmp.yaml > uniquified.yaml
rm tmp.yaml
echo "Type your amazon access key, followed by [ENTER]:"
read access_key
echo "Type your amazon secret key, followed by [ENTER]:"
read secret_key
sed s/youraccesskey/$access_key/ uniquified.yaml > tmp.yaml
sed s/yoursecretkey/$secret_key/ tmp.yaml > environments.yaml
rm tmp.yaml
rm uniquified.yaml
mkdir ~/.juju
mv environments.yaml ~/.juju/environments.yaml

echo "Setting up juju environment, this can take a number of minutes"
sudo juju bootstrap
juju deploy zookeeper
juju deploy -v --repository=/home/$USER/charm/ local:storm stormmaster
juju deploy -v --repository=/home/$USER/charm/ local:storm stormworker
