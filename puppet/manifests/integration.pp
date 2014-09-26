import "common"

class { 'puppetry':
  document_root => '/var/www/foliogalery',
  listen_url => '127.0.0.1:9000',
  app_name => 'foliogalery',
  source => 'http://www.foliopages.com/downloads/foliogallery-master-1.3.zip',
  env => 'integration'
}

