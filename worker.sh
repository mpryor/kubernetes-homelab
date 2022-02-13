CONTROL_IP="$(cat /vagrant/control-ip):6443"
SERVER_TOKEN=$(cat /vagrant/node-token)

curl -sfL https://get.k3s.io | K3S_URL=https://$CONTROL_IP K3S_TOKEN=$SERVER_TOKEN sh -