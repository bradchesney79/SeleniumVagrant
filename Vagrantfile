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

  config.vm.synced_folder "./Website", "/home/vagrant/Website", owner: "vagrant", group: "vagrant"

  $script = <<-SCRIPT
	# # Install NodeJS

	# # install n

	# # n is a nodeJS version manager tool similar to rvm and nvm
	# # n allow you to install several versions of nodeJS side by side
	# # if you need a specific version you may "use" that version of node

	# # todo: check n script against expected hash

	# echo "Installing NodeJS"

	# curl -s -L https://git.io/n-install | bash -s -- -y

	# # make n available to the shell

	# . /home/vagrant/.bashrc

	# # Install the latest stable node
	# /home/vagrant/n/bin/n -q stable

	# # update the nodeJS software package manager

	# # ToDo: check npm script against expected hash

	# npm install -g npm@latest

    cd /home/vagrant/Website
    npm install

  SCRIPT

  config.vm.provision "shell", inline: $script, privileged: false

  config.trigger.after :up do |trigger|
    trigger.info = "Changing video settings..."
    trigger.run = {path: "changeVideoSettings.sh"}
  end

end