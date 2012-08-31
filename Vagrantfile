# -*- mode: ruby -*-
# vi: set ft=ruby :

PROJECT_NAME = 'djangoproject'
MOUNT_POINT  = '/home/vagrant/djangoproject'

Vagrant::Config.run do |config|

  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :hostonly, "192.168.33.20"

  config.vm.share_folder PROJECT_NAME, MOUNT_POINT, PROJECT_NAME

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = "puppet/manifests/modules"
    puppet.facter = [
            ['project_name', PROJECT_NAME],
            ['django_dir', MOUNT_POINT],
            ['django_url', 'djangoproject.local'],
            ['db_username', 'django'],
            ['db_password', 'django'],
            ['db_name', 'django'],
            ['db_root_password', 'secure'],
    ]
  end

end
