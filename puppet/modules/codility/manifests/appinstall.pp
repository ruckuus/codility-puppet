class codility::appinstall(
  $appname = 'codility',
  $source = 'www.google.com/foo',
  $document_root = '/var/www/'
) {

  Exec {
    path => [
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin',
    ]
  }

  define setup_app($appname, $source, $target) {
    # Setup document root
    exec { 'creates_app_dir':
      command => "mkdir -p /var/www/${appname}" 
    }

    exec { 'clean_up':
      command => "rm -rf /var/www/${appname}/*"
    }

    exec { "retrieve_${appname}":
      cwd => "/var/www/${appname}",
      command => "wget -q ${source} -O /tmp/${appname}",
      path => ['/usr/bin'],
      creates => "/tmp/${appname}",
      notify => Exec["extract_${appname}"],
      require => Exec['clean_up'],
    }

    exec { "extract_${appname}":
      command => "unzip -o /tmp/${appname} -d /var/www/${appname}",
      require => [Package['unzip'], Exec["retrieve_${appname}"]],
      notify => Exec['restart_nginx'],
    }
  }

  setup_app { 'app_setup': 
    appname => $appname, 
    source => $source, 
    target => $document_root
  }
}
