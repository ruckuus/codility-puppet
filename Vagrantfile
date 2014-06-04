# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

puts <<eof
Hello, Codility!
eof

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "dev.codility.com"
  config.vm.box = "hashicorp/precise64"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "private_network", ip: "10.0.0.2"

  config.vm.define "developer", primary: true do |developer|
    developer.vm.synced_folder "repo", "/var/www", :nfs => { :mount_options => ["dmode=777, fmode=666"] }
   # developer.vm.provision "shell", path: "./repo/get_foliopages.sh"
    developer.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/init.pp"
    end
  end
end
