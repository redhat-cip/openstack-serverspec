require 'spec_helper'

describe port(8004) do
  it { should be_listening.with('tcp') }
end

describe port(8000) do
  it { should be_listening.with('tcp') }
end

describe port(8003) do
  it { should be_listening.with('tcp') }
end

describe command("heat --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 stack-list") do
  it { should return_exit_status 0 }
end
