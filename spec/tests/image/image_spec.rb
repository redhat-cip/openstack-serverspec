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
describe command("bash -c \"if grep -q 'default_store = rbd' /etc/glance/glance-api.conf; then test -f /etc/ceph/ceph.client.glance.keyring; fi\"") do
  it { should return_exit_status 0 }
end

describe cron do
  it { should have_entry('1 0 * * * glance-cache-cleaner').with_user('glance') }
  it { should have_entry('*/30 * * * * glance-cache-pruner').with_user('glance') }
end

describe command("glance --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 image-list") do
  it { should return_exit_status 0 }
end
