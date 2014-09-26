require 'spec_helper'

describe 'devtools', :type => :class do
  let(:title) { 'devtools' }
  let(:node) { 'rspec.devtools.local' }

  it { should contain_class('devtools') }

  describe 'Installation' do
    it { should contain_package('git').with_ensure('latest') }
    it { should contain_package('tig').with_ensure('latest') }
    it { should contain_package('mtr').with_ensure('latest') }
    it { should contain_package('vim').with_ensure('latest') }
    it { should contain_package('zip').with_ensure('latest') }
    it { should contain_package('curl').with_ensure('latest') }
    it { should contain_package('htop').with_ensure('latest') }
    it { should contain_package('ntop').with_ensure('latest') }
    it { should contain_package('make').with_ensure('latest') }
    it { should contain_package('wget').with_ensure('latest') }
    it { should contain_package('iotop').with_ensure('latest') }
    it { should contain_package('iperf').with_ensure('latest') }
    it { should contain_package('ngrep').with_ensure('latest') }
    it { should contain_package('rsync').with_ensure('latest') }
    it { should contain_package('unzip').with_ensure('latest') }
    it { should contain_package('iptraf').with_ensure('latest') }
    it { should contain_package('screen').with_ensure('latest') }
    it { should contain_package('strace').with_ensure('latest') }
    it { should contain_package('vnstat').with_ensure('latest') }
    it { should contain_package('tcpdump').with_ensure('latest') }
    it { should contain_package('sysstat').with_ensure('latest') }
    it { should contain_package('iproute').with_ensure('latest') }
    it { should contain_package('libpcre3').with_ensure('latest') }
    it { should contain_package('dos2unix').with_ensure('latest') }
    it { should contain_package('iptables').with_ensure('latest') }
    it { should contain_package('bind9utils').with_ensure('latest') }
    it { should contain_package('traceroute').with_ensure('latest') }
    it { should contain_package('libpcre3-dev').with_ensure('latest') }
  end

end
