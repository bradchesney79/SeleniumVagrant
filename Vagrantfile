Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.name = "SeleniumVagrant"

    # VBoxModify Vagrant translation syntax
    #vb.customize ["modifyvm", :id, "--name", "SeleniumVagrant"]
  end
  
  config.vm.network :forwarded_port, guest:4444, host:4444
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provision "shell", path: "vagrantProvision.sh"

  config.vm.synced_folder ".", "/home/vagrant/", owner: "vagrant", group: "vagrant"

  $script = <<-SCRIPT

    cd /home/vagrant/
    npm install

  SCRIPT

  config.vm.provision "shell", inline: $script, privileged: false

  config.trigger.after :up do |trigger|
    trigger.info = "Changing video settings..."
    trigger.run = {path: "changeVideoSettings.sh"}
  end
end