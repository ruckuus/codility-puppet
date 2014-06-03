class php5() {

   package { [
      'php5',
      'php5-common',
      'php5-cgi',
      'php5-cli',
      'php5-fpm',
      'php5-gd',
    ]:
      ensure => 'latest',
      require => Class['codility::prepare'],
  }

# Remove apache, to use nginx
  package { ['apache2', 'apache2-utils', 'apache2.2-bin', 'apache2-common']:
    ensure => purged
  }

}
