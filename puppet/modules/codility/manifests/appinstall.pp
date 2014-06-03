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

    exec { "retrieve_${appname}":
      cwd => "/var/www/${appname}",
      command => "wget -q ${source} -O /tmp/${appname}",
      path => ['/usr/bin'],
      creates => "/tmp/${appname}",
      notify => Exec["extract_${appname}"],
    }

    exec { "extract_${appname}":
      command => "/usr/bin/unzip /tmp/${appname} -d /var/www/${appname}",
      path => ['/usr/bin'],
      require => Exec["retrieve_${appname}"],
    }
  }

  setup_app { 'app_setup': 
    appname => $appname, 
    source => $source, 
    target => $document_root
  }
}
