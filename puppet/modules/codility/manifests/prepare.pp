class codility::prepare {
  Exec  {
    path => [
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin',
    ],
  }

  exec { 'apt-get update':
    command => "apt-get -y update",
    creates => '/tmp/updated',
  }
}
