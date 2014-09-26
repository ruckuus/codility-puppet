# == Class: devtools
#
# A module that will install common utilities for sysadmin/developer in *nix.
#
# === Examples
#
#  class { 'devtools': }
#
# === Authors
#
# Author Name <ruckuus@gmail.com>
#
# === Copyright
#
# Copyright 2014 Dwi Sasongko S, unless otherwise noted.
#
class devtools {
  package { ['git', 'mtr', 'vim', 'zip', 'htop', 'make', 'iotop', 'iperf', 'ngrep', 'unzip', 'screen', 'strace', 'tcpdump', 'sysstat', 'iproute', 'libpcre3', 'dos2unix', 'iptables', 'bind9utils', 'traceroute', 'libpcre3-dev', 'ntop', 'rsync', 'tig', 'vnstat', 'iptraf', 'curl', 'wget' ]:
    ensure => latest
  }
}
