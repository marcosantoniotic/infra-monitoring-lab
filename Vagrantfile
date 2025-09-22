Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "infra-monitoring-lab"
  config.vm.network "private_network", ip: "192.168.56.50"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "infra-monitoring-lab-v4.6-rev5"
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "bootstrap.sh"
end
