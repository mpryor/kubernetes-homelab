worker_count = 2
node_os = "ubuntu/bionic64"
node_memory = 2048
node_cpus = 1

Vagrant.configure("2") do |config|
  config.vm.box = node_os
  config.vm.network :public_network, bridge: "Intel(R) Wireless-AC 9560 160MHz"

  config.vm.provider "virtualbox" do |v|
    v.memory = node_memory
    v.cpus = node_cpus

    # Disable annoying ubuntu-bionic log file in project directory
    v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end

  config.vm.define "control-node" do |control|
    control.vm.hostname = "control-node"
    control.vm.provider "virtualbox" do |vb|
      vb.name = "control-node"
    end    
    control.vm.provision "shell", path: "control.sh"
  end

  (1..worker_count).each do |number|
    config.vm.define "worker-node-#{number}" do |worker|
      worker.vm.hostname = "worker-node-#{number}"
      worker.vm.provider "virtualbox" do |vb|
        vb.name = "worker-node-#{number}"
      end    
      worker.vm.provision "shell", path: "worker.sh"
      
      # Run bootstrap.sh on last node, triggered after up command has finished
      worker.trigger.after :up do |trigger|   
        trigger.only_on = "worker-node-#{worker_count}"   
        trigger.info = "all workers provisioned, bootstrapping with argocd..."
        trigger.run_remote = {path: "bootstrap.sh"}
      end
    end
  end

end
