Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.network "private_network", ip: "192.168.33.40"
  config.vm.provision :docker
  config.vm.provision :docker_compose
  config.vm.provision "shell", path: "provision.sh"
end
