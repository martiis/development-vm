Virtual machine for development
===============================

This environment uses [vagrant][vagrant] as vm manager and [ansible][ansible] as provisioner.

### Requirements

 - [Virtualbox][virtualbox_download] (>=4.3)
 - [Vagrant][vagrant_download] (>=1.7)
 - [Ansible][ansible_download] (>=1.8, recommend using pip)
 - paramiko (python library). *Optional. This is required if you would use ansible commands by hand.*

> The more latest you can get the better, but I dont currently know which versions should be the lowest exactly.

### Virtual machine specification:  

 - box: *ubuntu/trusty64*
 - vm's: *1*
 - cpu's: *1*
 - memory: *1024 MB*

 > If you need more power specifications can be changed in [Vagrantfile][vagrantfile].

## Launching

Just like every other vagrant machine start using `vagrant up` command, provisioning will be handled automagicly.
 > **NOTICE:** dont terminate if red text starts apearing! If it fails to start it will say at the end.

## Usage

After you done all steps above machine should contain php5-fpm+nginx (PHP 5.6). Nginx [virtualhost][nginx_vh] provided in repository is from [symfony2 documentation][sf_nginx], but it can be modified freely. By default symfony project is expected to be located in *public_html* directory which also should be accessible through [vm.dev][vm_host].

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
