stage { 'preinstall':
  before => Stage['main']
}

class { 'devtools': }

class { 'puppetry::prepare':
  stage => preinstall
}

# Install nginx
class { 'nginx': 
  require => Class['puppetry::prepare']
}

class { ['php::fpm', 'php::cli', 'php::extension::apc']:

}

include rvm
