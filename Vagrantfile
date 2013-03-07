# -*- mode: ruby -*-
# vi: set ft=ruby :

roles = %w[mysql1 mysql2 mysql3 mysql4]

Vagrant::Config.run do |config|
  roles.each_with_index do |role,i|
    config.vm.define role.to_sym do |cfg|
      cfg.vm.box = "opscode-ubuntu-precise"
      cfg.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"
      cfg.vm.host_name = role
      cfg.vm.network :hostonly, "33.33.33.#{i+11}"
      cfg.vm.forward_port 3306, 3306+i+1
      

      cfg.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"
        chef.roles_path = "roles"
#        chef.data_bags_path = "../my-recipes/data_bags"
        chef.add_role "mysql"
        chef.json = { "mysql" => { "tunable" => { "server_id" => i+1 } } }
     
      end

    end
  end
end
