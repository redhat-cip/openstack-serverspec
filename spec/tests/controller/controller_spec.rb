require 'spec_helper'

#
# cloud::compute::controller
#

describe command("nova --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 flavor-list") do
  it { should return_exit_status 0 }
end

describe port(8773) do
  it { should be_listening.with('tcp') }
end

describe port(8774) do
  it { should be_listening.with('tcp') }
end

describe port(8775) do
  it { should be_listening.with('tcp') }
end

describe file('/etc/nova/nova.conf') do
  it { should contain "servicegroup_driver=mc" }
end

describe port(6082) do
  it { should be_listening.with('tcp') }
end
