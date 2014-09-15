# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

puts <<eof
Hello, Symfony2!
eof

$post = <<SCRIPT
sudo service nginx restart
sudo service php5-fpm restart
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "dev.symfony2.com"
  config.vm.box = "hashicorp/precise64"
  config.vm.network "forwarded_port", guest: 8000, host: 8506
  config.vm.network "private_network", ip: "192.168.1.99"

  config.vm.define "developer", primary: true do |developer|
    developer.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/init.pp"
    end
    developer.vm.provision "shell", inline: $post, privileged: false
  end

  config.vm.define "frontend", primary: true do |developer|
    developer.vm.synced_folder "repo", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
    developer.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/init.pp"
    end
    developer.vm.provision "shell", inline: $post, privileged: false
  end

end
