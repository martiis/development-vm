# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = ["vagrant-hostsupdater", "vagrant-bindfs"]
required_plugins.each do |plugin|
  if not Vagrant.has_plugin?(plugin) then
    abort("Required plugin `#{plugin}` is not installed.\nRun: vagrant plugin install #{plugin}")
	end
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  config.vm.hostname = "vm.local"
  config.hostsupdater.aliases = ["kibana.vm.local", "www.vm.local"]

  config.vm.define "vm" do |v|
    v.vm.box = "ubuntu/trusty64"
    v.vm.network :private_network, ip: "192.168.52.101"
    v.vm.synced_folder "./public_html", "/vagrant-nfs",
      type: "nfs",
      mount_options: ['rw', 'vers=3', 'tcp']
    v.bindfs.bind_folder "/vagrant-nfs", "/home/vagrant/public_html"

    v.vm.provider :virtualbox do |virtualbox|
      virtualbox.gui = false
      virtualbox.name = "vm"
      virtualbox.cpus = 1
      virtualbox.memory = 2048
      virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      virtualbox.customize ["modifyvm", :id, "--cpuexecutioncap", "95"]
      virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    end
  end

  # config.vm.provision "shell", path: "vagrant/swap.sh"
  config.vm.provision "shell", path: "vagrant/python.sh"
  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "playbook/setup.yml"
  end
end
