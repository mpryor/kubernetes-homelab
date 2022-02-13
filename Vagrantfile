Vagrant.configure("2") do |config|
  config.vm.box = "rockylinux/8"
  config.vm.network :public_network, bridge: "Intel(R) Wireless-AC 9560 160MHz"

  config.vm.define "control-node" do |control|
    control.vm.hostname = "control-node"
    control.vm.provider "virtualbox" do |vb|
      vb.name = "control-node"
    end    
    control.vm.provision "shell", path: "control.sh"
  end

  config.vm.define "worker-node" do |worker|
    worker.vm.hostname = "worker-node"
    worker.vm.provider "virtualbox" do |vb|
      vb.name = "worker-node"
    end    
    worker.vm.provision "shell", path: "worker.sh"
  end

end
