require 'spec_helper'

#
# Glance
#

describe port(9292) do
  it { should be_listening.with('tcp') }
end

describe port(9191) do
  it { should be_listening.with('tcp') }
end

# when ceph is enabled, ensure we have the ceph keyring installed
rbd_enable = file('/etc/glance/glance-api.conf').contain("^default_store\s*=\s*rbd\s*$",nil,nil)
describe file('/etc/ceph/ceph.client.glance.keyring'), :if => rbd_enable do
	it { should be_file }
	it { should be_mode 400 }
	it { should be_owned_by 'glance' }
	it { should be_grouped_into 'glance' }
end

describe cron do
  it { should have_entry('1 0 * * * glance-cache-cleaner').with_user('glance') }
  it { should have_entry('*/30 * * * * glance-cache-pruner').with_user('glance') }
end

describe command("timeout 10 glance --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_protocol]}://#{property[:vip_public]}:5000/v2.0 image-list") do
  it { should return_exit_status 0 }
end
