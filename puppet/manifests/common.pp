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

rvm::system_user { vagrant: ; }

rvm_system_ruby {
  'ruby-2.1.5':
    ensure      => 'present',
    default_use => true;
  'ruby-2.0-dev':
    ensure      => 'present',
    default_use => false;

}

include '::mysql::server'
