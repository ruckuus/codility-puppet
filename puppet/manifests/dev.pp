import "common"

class { 'puppetry':
  document_root => '/var/www/foliogalery',
  app_name => 'foliogalery',
  source => 'http://www.foliopages.com/downloads/foliogallery-master-1.3.zip',
  env => 'dev'
}

