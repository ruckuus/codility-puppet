stage { 'preinstall':
  before => Stage['main']
}

class { 'devtools': }

class { 'puppetry::prepare':
  stage => preinstall
}

package { 'nginx':
  ensure => 'present',
  require => Class['puppetry::prepare']
}

class { ['php5']:
}
