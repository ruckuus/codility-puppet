class codility(
  $user = 'www-data',
  $document_root = '/var/www',
  $listen_url = '127.0.0.1:9000',
  $app_name = 'codility',
  $source = 'www.google.com/foo'
) {
  # Setup nginx
  file { ['/etc/nginx/sites-available', '/etc/nginx/sites-enabled']:
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => 0755,
    recurse => true,
    purge => true,
  }

  file { 'nginx_default':
      path => '/etc/nginx/sites-enabled/000-default',
      ensure => present,
      source => 'puppet:///modules/codility/nginx/000-default',
  }

  # Setup FPM
  exec { 'php5_fpm_setup_dirs':
    command => "/bin/mkdir -p /etc/php5/fpm/pool.d"
  }

  file { 'php5_fpm_confd':
    path => '/etc/php5/fpm/conf.d',
    ensure => link,
    target => "../conf.d",
    require => Exec['php5_fpm_setup_dirs']
  }

  file { '/var/log/php5-fpm':
    ensure => directory,
    purge => false,
  }

  file { 'php5_fpm_ini':
    path => '/etc/php5/fpm/php.ini',
    ensure => present,
    source => 'puppet:///modules/codility/fpm/php.ini',
  }

  file { 'php5_fpm_conf':
    path => '/etc/php5/fpm/php-fpm.conf',
    ensure => present,
    source => 'puppet:///modules/codility/fpm/php-fpm.conf',
  }

  # Configure nginx and fpm pool for this app
  class { 'codility::appconfig':
    user => $user,
    listen_url => $listen_url,
    app_name => $app_name,
    document_root => $document_root,
  }

#  class { 'codility::appinstall':
#    appname => $app_name,
#    source => $source,
#    document_root => $document_root,
#  }
}
