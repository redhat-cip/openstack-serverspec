require 'spec_helper'

#
# cloud::telemetry::server
#

describe port(8777) do
  it { should be_listening.with('tcp') }
end

describe port(27017) do
  it { should be_listening.with('tcp') }
end

describe user('ceilometer') do
  it { should exist }
  it { should belong_to_group 'ceilometer' }
end

describe group('ceilometer') do
  it { should exist }
end

describe file('/etc/ceilometer') do
  it { should be_directory }
end

describe file('/etc/ceilometer/ceilometer.conf') do
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by 'ceilometer' }
  it { should be_grouped_into 'ceilometer' }
  its(:content) { should match /^rpc_backend=ceilometer.openstack.common.rpc.impl_kombu$/ }
  its(:content) { should match /^notification_topics=notifications$/ }
end

describe command("timeout 10 ceilometer --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_protocol]}://#{property[:vip_public]}:5000/v2.0 meter-list") do
  it { should return_exit_status 0 }
end
