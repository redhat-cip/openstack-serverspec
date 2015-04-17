require 'spec_helper'
#
# Keystone
#

describe port(5000) do
  it { should be_listening.with('tcp') }
end

describe port(35357) do
  it { should be_listening.with('tcp') }
end

describe command("timeout 10 keystone --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_protocol]}://#{property[:vip_public]}:5000/v2.0 user-list") do
  it { should return_exit_status 0 }
end
