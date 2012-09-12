Exec {
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'make_update':
    command => 'sudo apt-get update',
}

# Setup MySQL
class { 'mysql': 
  require => Exec['make_update'],
}

class { 'mysql::server':
  config_hash => { 'root_password' => $db_root_password },
  require     => Exec['make_update'],
}

class { 'mysql::python': 
  require => Exec['make_update'],
}

mysql::db { $db_name:
  user     => $db_username,
  password => $db_password,
  host     => 'localhost',
  grant    => ['all'],
}

# Setup Memcached
package {
  'memcached': 
    ensure   => latest,
    require  => Exec['make_update'],
}

service { "memcached":
  ensure  => running,
  enable  => true,
  require => Package['memcached'];
}

# Install required Packages
package {
  ['vim', 'facter', 'percona-toolkit', 'git-core', 'subversion', 'curl']:
    ensure   => latest,
    require  => Exec['make_update'],
}

package {
  ['python-pip', 'python-software-properties', 'python-setuptools', 'python-dev', 'build-essential', 'python-flup']:
    ensure   => latest,
    require  => Exec['make_update'];
}

package {
  ['libjpeg8', 'libjpeg-dev', 'libfreetype6', 'libfreetype6-dev']:
    ensure   => latest,
    require  => Exec['make_update'];
}

package {
  ['python-imaging']:
    ensure   => latest,
    require  => Package['libjpeg8', 'libjpeg-dev', 'libfreetype6', 'libfreetype6-dev'];
}

package {
  ['Django', 'django-grappelli', 'django_evolution', 'johnny-cache', 'django-tastypie']:
    ensure   => latest,
    provider => pip,
    require  => [ Package['python-pip'], Package['python-setuptools'] ],
}

host { $django_url:
  ip => $ipaddress_eth1;
}
