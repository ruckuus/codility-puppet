stage { 'preinstall':
  before => Stage['main']
}

class { 'puppetry::prepare':
  stage => preinstall
}

package { ['nginx', 'curl', 'wget', 'unzip', 'vim']:
  ensure => 'present',
  require => Class['puppetry::prepare']
}

class { ['php5']:
}
