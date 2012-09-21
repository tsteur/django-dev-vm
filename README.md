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

If you don't place an existing project within `django_dir`, it'll create a new project.

### Installation
 1. Install [Vagrant](http://www.vagrantup.com) & [VirtualBox](https://www.virtualbox.org)
 2. Clone this repository including all submodules (`git clone --recursive https://github.com/tsteur/django-dev-vm.git`)
 3. Execute the command `vagrant up` 
 4. It'll take some time when executing this command the first time. It'll download the Vagrant base box once and install all required packages afterwards.
 5. Log in to your VM via `vagrant ssh`. 
 6. Make sure `djangoproject/djangoproject/settings.py` matches your database connection settings
 7. Next execute `python manage.py syncdb` and `python ./manage.py collectstatic` within your Django project folder
 8. Start the development web server `cd ~/djangoproject && sudo python manage.py runserver djangoproject.local:80`
 9. Don't forget to update your local hosts file. `192.168.33.20 djangoproject.local`

### Installed Packages
 * Ubuntu Precise 64 Bit (12.04)
 * MySQL + Percona Toolkit
 * Memcached
 * Python including Django, Grappelli, Johnny Cache, Pil, django-tastypie, django-evolution, django-debug-toolbar and django-snippetscream
 * apache2-utils
 * Subversion
 * Git

### Dependencies
* puppetlabs-mysql - https://github.com/puppetlabs/puppetlabs-mysql
* puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib