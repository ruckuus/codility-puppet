# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

puts <<eof
Hello, Puppetry!
eof

$post = <<SCRIPT
sudo service nginx restart
sudo service php5-fpm restart
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "dev.symfony2.com"
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "developer", primary: true do |developer|
    developer.vm.synced_folder "developer", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
    developer.vm.network "forwarded_port", guest: 8000, host: 8506
    developer.vm.network "private_network", ip: "192.168.1.99"
    developer.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/dev.pp"
    end
    developer.vm.provision "shell", inline: $post, privileged: false
  end

  config.vm.define "integration", primary: true do |integration|
    integration.vm.synced_folder "integration", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
    integration.vm.network "forwarded_port", guest: 8000, host: 8507
    integration.vm.network "private_network", ip: "192.168.1.100"
    integration.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/integration.pp"
    end
    integration.vm.provision "shell", inline: $post, privileged: false
  end

  config.vm.define "staging", primary: true do |staging|
    staging.vm.synced_folder "staging", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
    staging.vm.network "forwarded_port", guest: 8000, host: 8508
    staging.vm.network "private_network", ip: "192.168.1.101"
    staging.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/staging.pp"
    end
    staging.vm.provision "shell", inline: $post, privileged: false
  end

  config.vm.define "production", primary: true do |production|
    production.vm.synced_folder "production", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
    production.vm.network "forwarded_port", guest: 8000, host: 8509
    production.vm.network "private_network", ip: "192.168.1.102"
    production.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/production.pp"
    end
    production.vm.provision "shell", inline: $post, privileged: false
  end

end
