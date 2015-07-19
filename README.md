Virtual machine for development
===============================

This environment uses [vagrant][vagrant] as vm manager and [ansible][ansible] as provisioner. In this case I did not provision using vagrant, but for more excitement it is executed by user.

### Requirements

 - [Virtualbox][virtualbox_download] (>=4.3)
 - [Vagrant][vagrant_download] (>=1.7)
 - [Ansible][ansible_download] (>=1.8, recommend using pip)
 - paramiko (python library)

> The more latest you can get the better, but I dont currently know which versions should be the lowest exactly.

### Virtual machine specification:

 - box: *ubuntu/trusty64*
 - vm's: *1*
 - cpu's: *1*
 - memory: *1024 MB*

 > If you need more power specifications can be changed in [Vagrantfile][vagrantfile].

## Launching

 1. Just like every other vagrant machine start using `vagrant up` command.
 > **NOTICE:** dont terminate if red text starts apearing! If it fails to start it will say at the end.

 2. *(Optional)* To check if *ansible* sees your vagrant machine try command `ansible dev-vm -m ping`. You should see the following output:

 ```
	dev-vm | success >> {
	  "changed": false,
	  "ping": "pong"
	}
 ```

 3. Time to provision with ansible! Simple as `ansible-playbook playbook/setup.yml` command.

## Usage

After you done all steps above machine should contain php5-fpm+nginx (PHP 5.6). Nginx [virtualhost][nginx_vh] provided in repository is from [symfony2 documentation][sf_nginx], but it can be modified freely. By default symfony project is expected to be located in *public_html* directory which also should be accessible through [vm.dev][vm_host]. Any other sources (f.e. bundles, scripts) should be in *private_html* directory.

> **NOTICE**: If you want to start new symfony project use symfony playbook: `ansible-playbook playbook/symfony.yml`. But be careful because **it cleans out *public_html* directory** so that [symfony installer][sf_installer] could be executed.

## About

I've created this environment after reading [Ansible: Up and Running][book], so if you see any mistakes or weird places, do not hesitate to contribute.

[book]: http://shop.oreilly.com/product/0636920035626.do
[vagrant]: https://github.com/mitchellh/vagrant
[ansible]: https://github.com/ansible/ansible
[virtualbox_download]: https://www.virtualbox.org/wiki/Downloads
[ansible_download]: https://github.com/ansible/ansible
[vagrant_download]: https://www.vagrantup.com/downloads.html
[vagrantfile]: https://github.com/martiis/development-vm/blob/master/Vagrantfile
[sf_nginx]: http://symfony.com/doc/current/cookbook/configuration/web_server_configuration.html#nginx
[nginx_vh]: https://github.com/martiis/development-vm/blob/master/playbook/template/nginx.vhost.j2
[vm_host]: http://vm.dev
[sf_installer]: https://github.com/symfony/symfony-installer
