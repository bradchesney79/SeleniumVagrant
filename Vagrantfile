Vagrant.configure("2") do |config|
	
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.network :forwarded_port, guest:4444, host:4444
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provision "shell", path: "vagrant-provision.sh"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--name", "Selenium"]
  end

  config.vm.synced_folder "./tests", "/home/vagrant/tests", owner: "vagrant", group: "vagrant"

  config.trigger.after :up do |trigger|
    trigger.info = "Changing video settings..."
    trigger.run = {path: "changeVideoSettings.sh"}
  end

end