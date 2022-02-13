# Assuming user has bridged their VM to a network like 192.168.*
MY_IP=$(ip addr show | grep -i 192 | awk '{print $2}' | sed "s/\/24//g") 

# Write control plane IP to shared dir
echo $MY_IP > /vagrant/control-ip

curl -sfL https://get.k3s.io | sh -s - --advertise-address $MY_IP

# Copying server token to shared directory to be used by worker nodes
cp /var/lib/rancher/k3s/server/node-token /vagrant
