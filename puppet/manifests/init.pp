stage { 'preinstall':
  before => Stage['main']
}

class { 'puppetry::prepare':
  stage => preinstall
}

package { ['nginx', 'curl', 'wget', 'unzip']:
  ensure => 'present',
  require => Class['puppetry::prepare']
}

class { ['php5']:
}

class { 'puppetry':
  document_root => '/var/www/foliogalery',
  listen_url => '127.0.0.1:9000',
  app_name => 'foliogalery',
  source => 'http://www.foliopages.com/downloads/foliogallery-master-1.3.zip',
}

