set -x 
while ! ip route | grep 192 >/dev/null; do 
	echo "Waiting for IP assignment from DHCP..."; 
	sleep 1; 
done &

# Assuming user has bridged their VM to a network like 192.168.*
MY_IP=$(ip addr show | grep -i 192 | awk '{print $2}' | sed "s/\/24//g") 

# Write control plane IP to shared dir
echo $MY_IP > /vagrant/control-ip

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip $MY_IP --flannel-iface enp0s8 --cluster-init" sh -s - 

# Copying server token to shared directory to be used by worker nodes
cp /var/lib/rancher/k3s/server/node-token /vagrant
