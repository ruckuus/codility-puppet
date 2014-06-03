class codility::appconfig(
  $user = 'www-data',
  $listen_url = '127.0.0.1:9000',
  $app_name = 'codility',
  $document_root = '/var/www',
  $dir_index = 'index.php'
) {

  # FPM pool for $app_name
  file { 'app_php5_fpm_pool':
    path => "/etc/php5/fpm/pool.d/${app_name}.conf",
    ensure => present,
    content => template('codility/app_php5_fpm_pool.erb')
  }

  # Nginx config for $app_name
  file {'app_nginx_conf':
    path => "/etc/nginx/sites-available/${app_name}.conf",
    ensure => present,
    content => template('codility/app_nginx_conf.erb'),
  }

  file {'app_nginx_log_dirs':
    path => "/var/log/nginx/${app_name}",
    ensure => directory
  }

  file {'app_nginx_conf_enabled':
    path => "/etc/nginx/sites-enabled/${app_name}.conf",
    ensure => link,
    target => "../sites-available/${app_name}.conf"
  }

  exec { 'restart_fpm':
    command => "/usr/sbin/service php5-fpm restart",
  }

  exec { 'restart_nginx':
    command => "/usr/sbin/service nginx restart",
    unless => "/usr/sbin/nginx -t"
  }

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    restart    => '/etc/init.d/nginx reload'
  }

}
