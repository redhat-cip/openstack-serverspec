require 'spec_helper'

#
# KeepAlived
#
describe package('keepalived') do
  it { should be_installed }
end

# (spredzy) TODO: chkconfig is not
# available anymore for systemd
# aware daemon. Upgrade to
# serverspec 2.0 needs to be planned
#describe service('keepalived') do
#  it { should be_running }
#end

describe file('/etc/keepalived/keepalived.conf') do
  its(:content) { should match /state     #{property[:keepalived_state]}/ }
  its(:content) { should match /priority  #{property[:keepalived_priority]}/ }
end

describe file('/etc/keepalived/keepalived.conf') do
# TODO (spredzy) : Make this dynamic
# a user can decide to user another command
# than killall to check status
#  it { should contain('script   "killall -0 haproxy"').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }
  it { should contain('interval 2').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }
  it { should contain('weight   2').from(/^vrrp_script haproxy/).to(/^vrrp_instance/) }

  its(:content) { should match /^vrrp_instance 1 {/ }
  it { should contain('virtual_router_id 1').from(/^vrrp_instance/).to(/^}/) }
  its(:content) { should match /interface/ }
end

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

  it { should be_mode 444 }
  it { should be_owned_by 'root' }
end

# Monitor
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:10300/) }
end

# ceilometer_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8777/) }
end

# cinder_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8776/) }
end

# ec2_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8773/) }
end

# galera_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:3306/) }
end

# glance_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:9292/) }
end

# heat_api_cfn_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8000/) }
end

# health_api_cloudwatch_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8003/) }
end

# heat_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8004/) }
end

# horizon_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:80/) }
end

# keystone_api_admin_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:35357/) }
end

# keystone_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:5000/) }
end

# metadata_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8775/) }
end

# neutron_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:9696/) }
end

# nova_api_cluster
describe file('/etc/haproxy/haproxy.cfg') do
  it { should contain(/bind .*:8774/) }
end


# swift_api_cluster
#describe port(8080) do
#  it { should be_listening.with('tcp/) }
#end
