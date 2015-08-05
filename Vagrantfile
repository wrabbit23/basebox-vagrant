# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.7.3"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "10.11.12.13"

  config.vm.synced_folder "./", "/vagrant/", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--acpi", "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.network "forwarded_port", guest: 5555, host: 5555
  config.vm.network "forwarded_port", guest: 5556, host: 5556
  config.vm.network "forwarded_port", guest: 5557, host: 5557

  config.vm.provision "file", source: "puppet/files/.npmrc", destination: ".npmrc"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: ".ssh/id_rsa.pub"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: ".ssh/id_rsa"
  config.vm.provision :shell, inline: "chmod 600 .ssh/id_rsa.pub"
  config.vm.provision :shell, inline: "chmod 600 .ssh/id_rsa"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision :shell, :path => "shell/bootstrap.sh"
  config.vm.provision :shell, inline: "mkdir -p /home/vagrant/development"
  config.vm.provision :shell, inline: "chown vagrant:vagrant /home/vagrant/development"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end
end
