# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = ["vagrant-hostmanager"]
required_plugins.each do |plugin|
	if not Vagrant.has_plugin?(plugin) then
    abort("Required plugin `#{plugin}` is not installed.\nRun: vagrant plugin install #{plugin}")
	end
end

Vagrant.configure(2) do |config|
	config.ssh.insert_key = false

  config.vm.define "dev-vm" do |v|
    v.vm.box = "ubuntu/trusty64"
    v.vm.network :private_network, ip: "192.168.52.101"
    v.vm.synced_folder "./", "/var/www", type: "nfs"

    v.vm.hostname = "vm.dev"
    v.hostmanager.enabled = true
    v.hostmanager.manage_host = true
    v.hostmanager.ignore_private_ip = false
    v.hostmanager.include_offline = true
    v.hostmanager.aliases = ["www.vm.dev"]

    v.vm.provider :virtualbox do |virtualbox|
      virtualbox.gui = false
      virtualbox.name = "dev-vm"
      virtualbox.cpus = 1
      virtualbox.memory = 1024
      virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      virtualbox.customize ["modifyvm", :id, "--cpuexecutioncap", "95"]
      virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    end
  end

  config.vm.provision "shell", path: "vagrant/python.sh"
end
