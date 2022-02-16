set -x
while ! ip route | grep 192 >/dev/null; do 
	echo "Waiting for IP assignment from DHCP..."; 
	sleep 1; 
done &

MY_IP=$(ip addr show | grep -i 192 | awk '{print $2}' | sed "s/\/24//g") 

CONTROL_IP="$(cat /vagrant/control-ip):6443"
SERVER_TOKEN=$(cat /vagrant/node-token)

curl -sfL https://get.k3s.io | K3S_URL=https://$CONTROL_IP K3S_TOKEN=$SERVER_TOKEN INSTALL_K3S_EXEC="--flannel-iface enp0s8 --node-ip $MY_IP" sh -s - 
