
class puppetry(
  $user = 'www-data',
  $document_root = '/var/www',
  $listen_url = '127.0.0.1:9000',
  $app_name = 'puppetry',
  $source = 'www.google.com/foo',
  $env = 'dev',
  $tld = 'com'
) {

  if $env == 'prod' {
    $server_names = "www.${app_name}.${tld} ${app_name}.${tld}"
  } else {
    $server_names = "${env}.${app_name}.${tld}"
  }

  nginx::resource::vhost { "${app_name}":
    www_root => $document_root,
  }

  nginx::resource::location { "${app_name}":
    ensure => present,
    ssl => false,
    ssl_only => false,
    vhost => $app_name,
    www_root => $document_root,
    location => '~ \.php$',
    index_files => ['index.php', 'index.html'],
    proxy => undef,
    fastcgi => $listen_url,
    fastcgi_param => {
      'DOCUMENT_ROOT' => $document_root,
    }
  }

}
