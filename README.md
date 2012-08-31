django-dev-vm
=============

Creates a virtual machine using Vagrant and Puppet to develop Django apps. You can either use it with an existing Django project or to create a new one.

### Customization

You can customize the following parameters in Vagrantfile:
 * `project_name` => Defaults to `djangoproject`
 * `django_dir` => Defaults to `/home/vagrant/djangoproject`
 * `django_url` => Defaults to `djangoproject.local`
 * `db_username` => Defaults to `django`
 * `db_password` => Defaults to `django`
 * `db_name` => Defaults to `django`
 * `db_root_password` => Defaults to `secure`

If you don't place an existing project within $django_dir, it'll create a new project.

### Installation
 1. Install [Vagrant](http://www.vagrantup.com) & [VirtualBox](https://www.virtualbox.org)
 2. Clone this repository including all submodules (`git clone --recursive https://github.com/tsteur/django-dev-vm.git`)
 3. Execute the command `vagrant up` 
 4. It'll take some time when executing this command the first time. It'll download the Vagrant base box once and install all required packages.
 5. Log in to your VM via `vagrant ssh`. Next execute `python manage.py syncdb` and maybe `python ./manage.py collectstatic` within your Django project folder
 6. Don't forget to update your local hosts file. `192.168.33.20 djangoproject.local`

### Installed Packages
 * Ubuntu Precise 64 Bit (12.04)
 * MySQL + Percona Toolkit
 * Python including Django, Grappelli, ...
 * NGINX
 * Subversion
 * Git
 * Memcached

### Known issues

If your urls are not working correctly, you may need to add the line `fastcgi_split_path_info ^()(.*)$;` to `location /:` and remove the line `try_files` in `/etc/nginx/conf.d/vhost_autogen.conf`

### Dependencies
* puppetlabs-firewall - https://github.com/puppetlabs/puppetlabs-firewall
* puppetlabs-mysql - https://github.com/puppetlabs/puppetlabs-mysql
* puppetlabs-nginx - https://github.com/Mayflower/puppetlabs-nginx
* puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib

```
git submodule add git://github.com/puppetlabs/puppetlabs-firewall puppet/manifests/modules/Firewall
git submodule add git://github.com/puppetlabs/puppetlabs-mysql puppet/manifests/modules/mysql
git submodule add git://github.com/Mayflower/puppetlabs-nginx puppet/manifests/modules/nginx
git submodule add git://github.com/puppetlabs/puppetlabs-stdlib puppet/manifests/modules/stdlib
```