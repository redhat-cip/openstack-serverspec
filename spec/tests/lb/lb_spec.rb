require 'spec_helper'

#
# KeepAlived
#
describe package('keepalived') do
  it { should be_installed }
end

describe service('keepalived') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/keepalived/keepalived.conf') do
  its(:content) { should match /state     #{property[:keepalived_state]}/ }
  its(:content) { should match /priority  #{property[:keepalived_priority]}/ }
end

describe file('/etc/keepalived/keepalived.conf') do
  it { should contain('script   "killall -0 haproxy"').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }
  it { should contain('interval 2').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }
  it { should contain('weight   2').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }

  its(:content) { should match /^vrrp_instance 1 {/ }
  it { should contain('virtual_router_id 1').from(/^vrrp_instance/).to(/^}/) }
  its(:content) { should match /interface/ }
  its(:content) { should match /notify_master "\/etc\/init.d\/haproxy start"/ }
  its(:content) { should match /notify_backup "\/etc\/init.d\/haproxy stop"/ }
end

#
# HAProxy
#

describe package('haproxy') do
  it { should be_installed }
end


describe service('haproxy') do
  it { should be_enabled }
  it { should be_running }
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
# Monitor
describe port(9300) do
  it { should be_listening.with('tcp') }
end

# ceilometer_api_cluster
describe port(8777) do
  it { should be_listening.with('tcp') }
end

# cinder_api_cluster
describe port(8776) do
  it { should be_listening.with('tcp') }
end

# ec2_api_cluster
describe port(8773) do
  it { should be_listening.with('tcp') }
end

# galera_cluster
describe port(3306) do
  it { should be_listening.with('tcp') }
end

# glance_api_cluster
describe port(9292) do
  it { should be_listening.with('tcp') }
end

# heat_api_cfn_cluster
describe port(8000) do
  it { should be_listening.with('tcp') }
end

# health_api_cloudwatch_cluster
describe port(8003) do
  it { should be_listening.with('tcp') }
end

# heat_api_cluster
describe port(8004) do
  it { should be_listening.with('tcp') }
end

# horizon_cluster
describe port(80) do
  it { should be_listening.with('tcp') }
end

# keystone_api_admin_cluster
describe port(35357) do
  it { should be_listening.with('tcp') }
end

# keystone_api_cluster
describe port(5000) do
  it { should be_listening.with('tcp') }
end

# metadata_api_cluster
describe port(8775) do
  it { should be_listening.with('tcp') }
end

# neutron_api_cluster
describe port(9696) do
  it { should be_listening.with('tcp') }
end

# nova_api_cluster
describe port(8774) do
  it { should be_listening.with('tcp') }
end

# spice_cluster
describe port(6082) do
  it { should be_listening.with('tcp') }
end

# swift_api_cluster
#describe port(8080) do
#  it { should be_listening.with('tcp') }
#end
