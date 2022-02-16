Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network :public_network, bridge: "Intel(R) Wireless-AC 9560 160MHz"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
  end

  config.vm.define "control-node" do |control|
    control.vm.hostname = "control-node"
    control.vm.provider "virtualbox" do |vb|
      vb.name = "control-node"
    end    
    control.vm.provision "shell", path: "control.sh"
  end

  (1..2).each do |number|
    config.vm.define "worker-node-#{number}" do |worker|
      worker.vm.hostname = "worker-node-#{number}"
      worker.vm.provider "virtualbox" do |vb|
        vb.name = "worker-node-#{number}"
      end    
      worker.vm.provision "shell", path: "worker.sh"
    end
  end

end
