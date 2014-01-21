require 'spec_helper'

#
# HAProxy
#
describe service('haproxy') do
    it { should_not be_enabled   }
    it { should_not be_running   }
end

# Monitor
describe port(9300) do
  it { should_not be_listening.with('tcp') }
end

# ceilometer_api_cluster
describe port(8777) do
  it { should_not be_listening.with('tcp') }
end

# cinder_api_cluster
describe port(8776) do
  it { should_not be_listening.with('tcp') }
end

# ec2_api_cluster
describe port(8773) do
  it { should_not be_listening.with('tcp') }
end

# galera_cluster
describe port(3306) do
  it { should_not be_listening.with('tcp') }
end

# glance_api_cluster
describe port(9292) do
  it { should_not be_listening.with('tcp') }
end

# heat_api_cfn_cluster
describe port(8000) do
  it { should_not be_listening.with('tcp') }
end

# health_api_cloudwatch_cluster
describe port(8003) do
  it { should_not be_listening.with('tcp') }
end

# heat_api_cluster
describe port(8004) do
  it { should_not be_listening.with('tcp') }
end

# horizon_cluster
describe port(80) do
  it { should_not be_listening.with('tcp') }
end

# keystone_api_admin_cluster
describe port(35357) do
  it { should_not be_listening.with('tcp') }
end

# keystone_api_cluster
describe port(5000) do
  it { should_not be_listening.with('tcp') }
end

# metadata_api_cluster
describe port(8775) do
  it { should_not be_listening.with('tcp') }
end

# neutron_api_cluster
describe port(9696) do
  it { should_not be_listening.with('tcp') }
end

# nova_api_cluster
describe port(8774) do
  it { should_not be_listening.with('tcp') }
end

# spice_cluster
describe port(6082) do
  it { should_not be_listening.with('tcp') }
end

# swift_api_cluster
describe port(8080) do
  it { should_not be_listening.with('tcp') }
end

#
# KeepAlived
#
describe file('/etc/keepalived/keepalived.conf') do
  its(:content) { should match /state     BACKUP/ }
  its(:content) { should match /priority  49/ }
end
