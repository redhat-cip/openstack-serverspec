require 'spec_helper'
#
# HAProxy
#
describe package('haproxy') do
    it { should be_installed }
end

describe file('/etc/logrotate.d/haproxy') do
    its(:content) { should match /rotate 7/ }
    its(:content) { should match /daily/ }
    its(:content) { should match /missingok/ }
    its(:content) { should match /notifempty/ }
    its(:content) { should match /delaycompress/ }
    its(:content) { should match /compress/ }
    its(:content) { should match /postrotate/ }
    its(:content) { should match /endscript/ }

    it { should be_mode 644 }
    it { should be_owned_by 'root' }
end

#
# KeepAlived
#
describe package('keepalived') do
    it { should be_installed }
end

describe service('keepalived') do
    it {should be_enabled }
    it {should be_running }
end

describe file('/etc/keepalived/keepalived.conf') do
    it { should contain('script   "killall -0 haproxy"').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }
    it { should contain('interval 2').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }
    it { should contain('weight   2').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }

    its(:content) { should match /^vrrp_instance 1 {/ }
    it { should contain('virtual_router_id 1').from(/^vrrp_instance/).to(/^}/) }
    its(:content) { should match /interface eth0/ }
    its(:content) { should match /notify_master "\/etc\/init.d\/haproxy start"/ }
    its(:content) { should match /notify_backup "\/etc\/init.d\/haproxy stop"/ }

end

# mysql proxy
describe port(3306) do
  it { should be_listening.with('tcp') }
end

