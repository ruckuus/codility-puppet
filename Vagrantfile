# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

puts <<eof
Hello, Codility!
eof

$post = <<SCRIPT
sudo service nginx restart
sudo service php5-fpm restart
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "dev.codility.com"
  config.vm.box = "hashicorp/precise64"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "private_network", ip: "10.0.0.2"

  config.vm.define "developer", primary: true do |developer|
    developer.vm.synced_folder "repo", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
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
