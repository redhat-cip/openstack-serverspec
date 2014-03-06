require 'spec_helper'
#
# Keystone
#
describe package('keystone') do
    it { should be_installed }
end

describe service('keystone') do
    it {should be_enabled }
    it {should be_running }
end

describe port(5000) do
  it { should be_listening.with('tcp') }
end

describe port(35357) do
  it { should be_listening.with('tcp') }
end

describe command("keystone --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url http://#{property[:vip_public]}:5000/v2.0 user-list") do
  it { should return_exit_status 0 }
end
