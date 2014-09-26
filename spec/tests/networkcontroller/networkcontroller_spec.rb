require 'spec_helper'

# Neutron Server

describe file('/etc/neutron/neutron.conf') do
  its(:content) { should match /^nova_admin_username ?= ?nova$/ }
end

describe port(9696) do
  it { should be_listening.with('tcp') }
end

describe command("neutron --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 net-list") do
  it { should return_exit_status 0 }
end
